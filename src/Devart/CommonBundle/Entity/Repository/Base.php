<?php

namespace Devart\CommonBundle\Entity\Repository;

use Doctrine\ORM\EntityNotFoundException;
use Doctrine\ORM\EntityRepository;

/**
 * Base
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class Base extends EntityRepository
{
    /**
     * @inheritdoc
     * Always check for status
     */
    public function findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
    {
        if (!array_key_exists('status', $criteria)) {
            $criteria['status'] = \Devart\CommonBundle\Entity\BASE::ST_ACTIVE;
        }

        return parent::findBy($criteria, $orderBy, $limit, $offset);
    }

    /**
     * @inheritdoc
     * Always check for status
     */
    public function findOneBy(array $criteria, array $orderBy = null)
    {
        if (!array_key_exists('status', $criteria)) {
            $criteria['status'] = \Devart\CommonBundle\Entity\BASE::ST_ACTIVE;
        }

        return parent::findOneBy($criteria, $orderBy);
    }

    /**
     * @param $id
     * @throws \Doctrine\ORM\EntityNotFoundException
     */
    public function delete($id)
    {
        $entity = $this->find($id);
        if (!$entity) {
            throw new EntityNotFoundException('Entity with id [' . $id . '] could not be found.');
        }

        // flag entity as deleted
        $entity->setStatus(\Devart\CommonBundle\Entity\Base::ST_DELETED);

        // save changes
        $this->_em->flush();
    }

    /**
     * @param $query
     * @param $countName
     * @return int
     */
    public function count($query, $countName)
    {
        $queryClone = clone $query;
        $queryClone->select('COUNT(' . $countName . ')');
        return (int) $queryClone->getQuery()->getSingleScalarResult();
    }

}