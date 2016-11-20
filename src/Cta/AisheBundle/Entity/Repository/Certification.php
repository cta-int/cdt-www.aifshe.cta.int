<?php

namespace Cta\AisheBundle\Entity\Repository;

use Cta\AisheBundle\Entity\Certification as CertificationEntity;
use Cta\AisheBundle\Entity\CertificationRequirement as CertificationRequirementEntity;
use Devart\CommonBundle\Entity\Repository\Base;
use Doctrine\ORM\Query;

/**
 * Certification
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class Certification extends Base
{
    /**
     * @return array
     */
    public function findForShow()
    {
        $qb = $this->getEntityManager()->createQueryBuilder();

        $query = $qb->select('c', 'cr')
            ->from('CtaAisheBundle:Certification',      'c')
            ->leftJoin('c.certificationRequirements',   'cr', Query\Expr\Join::WITH, $qb->expr()->eq('cr.status', CertificationRequirementEntity::ST_ACTIVE))
            ->andWhere('c.status = :status')
            ->setParameter('status', CertificationEntity::ST_ACTIVE)
            ->getQuery();

        return $query->getArrayResult();
    }
}
