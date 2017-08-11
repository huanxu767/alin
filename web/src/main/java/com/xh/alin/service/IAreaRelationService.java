package com.xh.alin.service;

import com.github.pagehelper.PageInfo;
import com.xh.alin.pojo.AreaRelation;

import java.util.List;
import java.util.Map;

/**
 * Created by 123 on 2017/3/14.
 */
public interface IAreaRelationService {
    /**
     * 查询--公司大区关系
     * @return
     */
    PageInfo<AreaRelation> queryAreaRelations(Map params);

    /**
     * 更新--公司大区关系
     * @param areaRelation
     * @return
     */
    boolean updateAreaRelation(AreaRelation areaRelation);

    /**
     * 新增--公司大区关系
     * @param areaRelation
     * @return
     */
    boolean insertAreaRelation(AreaRelation areaRelation);

    /**
     * 新增或更新--公司大区关系
     * @param areaRelation
     * @return
     */
    boolean insertOrUpdateAreaRelation(AreaRelation areaRelation);

    /**
     * 查询大区种类
     * @return
     */
    List queryDistinctAreaRelation();
}
