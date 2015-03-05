<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/17/13
 * Time: 9:26 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Model;

class UserManager extends \FOS\UserBundle\Doctrine\UserManager
{
    /**
     * @param $criteria
     * @return array
     */
    public function findUsersBy($criteria)
    {
        return $this->repository->findBy($criteria);
    }

    /**
     * @param $groupName
     * @param array $params
     * @return array
     */
    public function findOverviewByGroup($groupName,array $params = array())
    {

        $result = array(
            'items' => array(),
            'count' => 0,
        );

        $query = $this->repository->createQueryBuilder('u')
            ->leftJoin('u.groups', 'g')
            ->orderBy('u.username', 'ASC');

            $query->where('g.name IN (:group)');
            $query->setParameter('group', $groupName);

        $queryClone = clone $query;
        $queryClone->select('COUNT(u.id)');
        $result['count'] =  (int) $queryClone->getQuery()->getSingleScalarResult();

        if (array_key_exists('start', $params)) {
            $query->setFirstResult($params['start']);
        }

        if (array_key_exists('limit', $params)) {
            $query->setMaxResults($params['limit']);
        }

        $result['items'] = $query->getQuery()->getResult();

        return $result;
    }

    /**
     * @param array $params
     * @return array
     */
    public function findOverview(array $params = array())
    {
        $result = array(
            'items' => array(),
            'count' => 0,
        );

        $query = $this->repository->createQueryBuilder('u')
            ->leftJoin('u.groups', 'g')
            ->orderBy('u.username', 'ASC');

        if (array_key_exists('blockGroups', $params)) {
            $query->where('g.name NOT IN (:blockgroups)');
            $query->setParameter('blockgroups', $params['blockGroups']);
        }

        $queryClone = clone $query;
        $queryClone->select('COUNT(u.id)');
        $result['count'] =  (int) $queryClone->getQuery()->getSingleScalarResult();

        if (array_key_exists('start', $params)) {
            $query->setFirstResult($params['start']);
        }

        if (array_key_exists('limit', $params)) {
            $query->setMaxResults($params['limit']);
        }

        $result['items'] = $query->getQuery()->getResult();

        return $result;
    }
}