<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 8/30/13
 * Time: 10:06 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Devart\CommonBundle\EventListener;

use Doctrine\Common\EventSubscriber;
use Doctrine\ORM\Event\PreFlushEventArgs;
use Doctrine\ORM\Event\OnFlushEventArgs;
use Devart\CommonBundle\Entity\Base as DevartBase;

class DoctrineSubscriber implements EventSubscriber
{

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
        $em     = $args->getEntityManager();
        $uow    = $em->getUnitOfWork();

        foreach ($uow->getScheduledEntityInsertions() as $entity) {
            if ($entity instanceof DevartBase) {
                if (is_null($entity->getStatus())) {
                    $class = get_class($entity);
                    $entity->setStatus($class::ST_ACTIVE);
                }
                if (is_null($entity->getCreatedAt())) {
                    $entity->setCreatedAt(new \DateTime('now'));
                }
            }
        }
    }

    /**
     * @param OnFlushEventArgs $args
     */
    public function onFlush(OnFlushEventArgs $args)
    {
        $em     = $args->getEntityManager();
        $uow    = $em->getUnitOfWork();

        foreach ($uow->getScheduledEntityUpdates() as $entity) {
            if ($entity instanceof DevartBase) {
                $entity->setModifiedAt(new \DateTime('now'));
            }
        }
    }
}