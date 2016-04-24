<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/6/13
 * Time: 11:36 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Service;

use Cta\AisheBundle\Entity\Chart;
use Doctrine\ORM\EntityManager;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorage;
use Symfony\Component\Security\Core\Authorization\AuthorizationChecker;

class Report
{
    private $_em;
    private $authCheck;
    private $user;

    /**
     * @param EntityManager        $em
     * @param AuthorizationChecker $authCheck
     * @param TokenStorage         $tokenStorage
     *
     * @internal param SecurityContext $securityContext
     */
    public function __construct(EntityManager $em, AuthorizationChecker $authCheck, TokenStorage $tokenStorage)
    {
        $this->_em = $em;
        $this->authCheck = $authCheck;
        $this->user = $tokenStorage->getToken()->getUser();
    }

    /**
     * @param $versionId
     * @return bool
     */
    public function isCurrentVersion($versionId)
    {
        $activeVersion = $this->_em->getRepository('CtaAisheBundle:OfflineTool')->findActiveVersion();
        return $activeVersion->getId() == $versionId ? true : false;
    }

    /**
     * @param array $reportData
     * @return int
     */
    public function saveCompleteReport(array $reportData)
    {
        if (!array_key_exists('name', $reportData)) {
            $reportData['name'] = 'imported_at';
        }
        $reportData['name'] .= ':' . date('Y-m-d'); // make sure it's unique, the user can change it later if desired

        $report = new \Cta\AisheBundle\Entity\Report();
        $this->_persistReport($report, $reportData);

        if (is_array($reportData['criteria'])) {
            foreach ($reportData['criteria'] as $criterionKey => $criterionValue) {
                foreach ($criterionValue as $criterionItemKey => $criterionItemValue) {
                    $this->_persistReportItem($report, $criterionKey, $criterionItemKey, $criterionItemValue);
                }
            }
        }

        // save changes
        $this->_em->flush();

        return $report->getId();
    }

    /**
     * @param \Cta\AisheBundle\Entity\Report $report
     * @param $chapter
     * @param $paragraph
     * @param array $reportItemData
     */
    private function _persistReportItem(\Cta\AisheBundle\Entity\Report &$report, $chapter, $paragraph, array $reportItemData)
    {
        $reportItem = new \Cta\AisheBundle\Entity\ReportItem();

        $reportItem->setReport($report);
        $reportItem->setCriterionItem($this->_em->getRepository('CtaAisheBundle:CriterionItem')->findOneChapterAndParagraph($chapter, $paragraph));

        if (array_key_exists('hasHighPriority', $reportItemData)) {
            $reportItem->setHasHighPriority($reportItemData['hasHighPriority']);
        }

        if (array_key_exists('current', $reportItemData)) {
            if (array_key_exists('rating', $reportItemData['current'])) {
                $reportItem->setCurrentSituationRating($reportItemData['current']['rating']);
            }
            if (array_key_exists('comment', $reportItemData['current'])) {
                $reportItem->setCurrentSituationComment($reportItemData['current']['comment']);
            }
        }

        if (array_key_exists('desired', $reportItemData)) {
            if (array_key_exists('rating', $reportItemData['desired'])) {
                $reportItem->setDesiredSituationRating($reportItemData['desired']['rating']);
            }
            if (array_key_exists('comment', $reportItemData['desired'])) {
                $reportItem->setDesiredSituationComment($reportItemData['desired']['comment']);
            }
        }

        $this->_em->persist($reportItem);
    }

    /**
     * Loop over the $reportData parameters and create a Report object with it
     *
     * @param \Cta\AisheBundle\Entity\Report $report
     * @param array $reportData
     */
    private function _persistReport(\Cta\AisheBundle\Entity\Report &$report, array $reportData)
    {
        foreach ($reportData as $key => $value) {
            switch($key)
            {
                case'name':
                    $report->setName($value);
                    break;
                case'institution':
                    $institution = $this->_em->getRepository('CtaAisheBundle:Institution')->findOneByName($value);
                    if (!$institution) {
                        $institution = $this->user->getInstitution();
                    }

                    $report->setInstitution($institution);
                    break;
                case'department':
                    $report->setDepartment($value);
                    break;
                case'coordinator':
                    $report->setCoordinator($value);
                    break;
                case'nrOfParticipants':
                    $report->setNrOfParticipants($value);
                    break;
                case'secretary':
                    $report->setSecretary($value);
                    break;
                case'dateAssessment':
                    if (is_null($value) || !$value instanceof \DateTime) {
                        $value = new \DateTime();
                    }
                    $report->setDateAssessment($value);
                    break;
                case'dateLatestAssessment':
                    if ($value instanceof \DateTime) {
                        $report->setDateLatestAssessment($value);
                    }
                    break;
                case'dateDesiredSituation':
                    if ($value instanceof \DateTime) {
                        $report->setDateDesiredSituation($value);
                    }
                    break;
                case'comment':
                    $report->setComment($value);
                    break;
                case'status':
                    $report->setStatus($value);
                    break;
                case'createdAt':
                    if ($value instanceof \DateTime) {
                        $report->setCreatedAt($value);
                    } else {
                        $report->setCreatedAt(new \DateTime());
                    }
                    break;
                case'modifiedAt':
                    if ($value instanceof \DateTime) {
                        $report->setModifiedAt($value);
                    }
                    break;
                case'createdBy':
                    if ($value instanceof \Cta\AisheBundle\Entity\User) {
                        $report->setCreatedBy($value);
                    } else {
                        $report->setCreatedBy($this->user);
                    }
                    break;
                case'modifiedBy':
                    if ($value instanceof \Cta\AisheBundle\Entity\User) {
                        $report->setModifiedBy($value);
                    }
                    break;
            }
        }

        if (false !== $this->authCheck->isGranted('ROLE_AUDITOR')) {
            $report->setIsOfficial(true);
        } else {
            $report->setIsOfficial(false);
        }

        $this->_em->persist($report);

        $chartRepository = new Chart();
        $chartRepository->setReport($report);
        $chartRepository->setModifiedAt(new \DateTime());
        $chartRepository->setModifiedBy($this->user);
        $chartRepository->setCreatedBy($this->user);
        $chartRepository->setType(Chart::TYPE_AREA);
        $chartRepository->setShowCriterion1(true);
        $chartRepository->setShowCriterion2(true);
        $chartRepository->setShowCriterion3(true);
        $chartRepository->setShowCriterion4(true);
        $chartRepository->setShowHighPriority(true);
        $chartRepository->setShowCurrentSituation(true);
        $chartRepository->setShowDesiredSituation(true);
        $this->_em->persist($chartRepository);
    }
}