<?php

namespace Cta\AisheBundle\Entity\Repository;

use Devart\CommonBundle\Entity\Repository\Base;
use Doctrine\ORM\NoResultException;

/**
 * PageTranslation
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class PageTranslation extends Base
{
    /**
     * @param $page_id
     * @param $lang
     * @return mixed|null
     */
    public function findByPageAndLanguage($page_id, $lang)
    {
        $qb = $this->getEntityManager()->createQueryBuilder();

        $query = $qb->select('pt')
            ->from('CtaAisheBundle:PageTranslation', 'pt')
            ->leftJoin('pt.page', 'p')
            ->andWhere('p.id = :id')
            ->andWhere('pt.lang = :lang')
            ->andWhere('pt.status = :status')
            ->setParameter('id', $page_id)
            ->setParameter('lang', $lang)
            ->setParameter('status', \Cta\AisheBundle\Entity\PageTranslation::ST_ACTIVE)
            ->getQuery();

        try {
            return $query->getSingleResult();
        } catch (NoResultException $e) {
            return null;
        }
    }
}
