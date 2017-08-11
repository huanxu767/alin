package com.xh.alin.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xh.alin.dao.AreaRelationMapper;
import com.xh.alin.pojo.AreaRelation;
import com.xh.alin.service.IAreaRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by 123 on 2017/3/14.
 */
@Service
@Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
public class AreaRelationServiceImpl implements IAreaRelationService {

    @Autowired
    private AreaRelationMapper areaRelationMapper;
    /**
     * 查询关系
     * @return
     */
    public PageInfo<AreaRelation> queryAreaRelations(Map params){
        Assert.notNull(params.get("pageNum"));
        PageHelper.startPage(Integer.parseInt(params.get("pageNum").toString()), 10);
        PageInfo page = new PageInfo(areaRelationMapper.queryAreaRelations(params));
        return page;
    }

    @Override
    public boolean updateAreaRelation(AreaRelation areaRelation) {
        return areaRelationMapper.updateAreaRelation(areaRelation)>0;
    }

    @Override
    public boolean insertAreaRelation(AreaRelation areaRelation) {
        return areaRelationMapper.insertAreaRelation(areaRelation)>0;
    }

    @Override
    public boolean insertOrUpdateAreaRelation(AreaRelation areaRelation) {
        if(StringUtils.isEmpty(areaRelation.getId())){
            return areaRelationMapper.insertAreaRelation(areaRelation)>0;
        }else{
            return areaRelationMapper.updateAreaRelation(areaRelation)>0;
        }
    }

    @Override
    public List queryDistinctAreaRelation() {
        return areaRelationMapper.queryDistinctAreaRelations();
    }


}
