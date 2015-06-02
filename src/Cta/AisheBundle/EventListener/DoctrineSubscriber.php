<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 8/30/13
 * Time: 10:06 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\EventListener;

use Cta\AisheBundle\Entity\Certification;
use Cta\AisheBundle\Entity\CertificationRequirement;
use Cta\AisheBundle\Entity\Criterion;
use Cta\AisheBundle\Entity\CriterionItem;
use Cta\AisheBundle\Entity\CriterionTranslation;
use Cta\AisheBundle\Entity\Repository\CriterionItemTranslation;
use Doctrine\Common\EventSubscriber;
use Doctrine\ORM\Event\PreFlushEventArgs;
use Doctrine\ORM\Event\OnFlushEventArgs;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Cta\AisheBundle\Entity\Base as CtaBase;

class DoctrineSubscriber implements EventSubscriber
{
    private $_container;

    /**
     * @param ContainerInterface $container
     */
    public function __construct(ContainerInterface $container)
    {
        $this->_container = $container;
    }

    /**
     * return the events to subscribe to
     * @return array
     */
    public function getSubscribedEvents()
    {
        return array(
            'preFlush',
            'onFlush',
        );
    }

    /**
     * @param PreFlushEventArgs $args
     */
    public function preFlush(PreFlushEventArgs $args)
    {
        $em = $args->getEntityManager();
        $uow = $em->getUnitOfWork();
        foreach ($uow->getScheduledEntityInsertions() as $entity) {
            if ($entity instanceof CtaBase) {
                if (is_null($entity->getCreatedBy())) {
                    $entity->setCreatedBy($this->_container->get('security.context')->getToken()->getUser());
                }
            }
        }

        $uow->computeChangeSets();
    }

    /**
     * @param OnFlushEventArgs $args
     */
    public function onFlush(OnFlushEventArgs $args)
    {
        $em = $args->getEntityManager();
        $uow = $em->getUnitOfWork();

        foreach ($uow->getScheduledEntityUpdates() as $entity) {
            if ($entity instanceof CtaBase) {
                $entity->setModifiedBy($this->_container->get('security.context')->getToken()->getUser());

                $meta = $em->getClassMetadata(get_class($entity));
                $uow->recomputeSingleEntityChangeSet($meta, $entity);
            }

            if ($entity instanceof Certification
                || $entity instanceof CertificationRequirement
                || $entity instanceof Criterion
                || $entity instanceof CriterionItem
                || $entity instanceof CriterionTranslation
                || $entity instanceof CriterionItemTranslation
            ) {
                $qb = $em->createQueryBuilder();
                $query = $qb->update('CtaAisheBundle:OfflineTool','ot')
                    ->set('ot.outdated', ':outdated')
                    ->andWhere('ot.outdated != :outdated')
                    ->setParameter('outdated',true)
                    ->getQuery();

                $query->getResult();
            }
        }
    }
}