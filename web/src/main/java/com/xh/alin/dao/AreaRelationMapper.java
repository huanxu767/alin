package com.xh.alin.dao;

import com.github.pagehelper.Page;
import com.xh.alin.pojo.AreaRelation;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


/**
 * Created by 123 on 2017/3/13.
 */
@Repository
public interface AreaRelationMapper {

    /**
     * 查询--达成率权重
     * @return
     */
    Page<AreaRelation> queryAreaRelations(Map params);
    /**
     * 更新--公司大区关系
     * @param areaRelation
     * @return
     */
    int updateAreaRelation(AreaRelation areaRelation);
    /**
     * 新增--公司大区关系
     * @param areaRelation
     * @return
     */
    int insertAreaRelation(AreaRelation areaRelation);
    /**
     * 查询不重复的消金大区
     * @return
     */
    List<Map> queryDistinctAreaRelations();

}
