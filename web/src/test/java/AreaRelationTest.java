import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xh.alin.pojo.AreaRelation;
import com.xh.alin.service.IAreaRelationService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.util.Assert;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by 123 on 2017/3/13.
 */
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:application.xml","classpath:application-db.xml"})
public class AreaRelationTest {
    @Autowired
    private IAreaRelationService areaRelationService;

    @Test
    public void queryRelations(){
//        PageHelper.startPage(1, 5);
        Map params = new HashMap<>();
//        params.put("areaName","北");
        params.put("pageNum","1");
        PageInfo<AreaRelation> page = areaRelationService.queryAreaRelations(params);
        for (AreaRelation areaRelation : page.getList()){
            System.out.println(areaRelation.toString());
        }
        System.out.println(page.getTotal());
    }

    @Test
    public void updateRelation(){
        AreaRelation areaRelation = new AreaRelation();
        areaRelation.setId(111L);
        areaRelation.setBegindate("20180101");
//        areaRelation.setAreaName("我去");
        boolean flag = areaRelationService.updateAreaRelation(areaRelation);
        System.out.println(flag);
    }

    @Test
    public void insertRelation(){
        AreaRelation areaRelation = new AreaRelation();
        areaRelation.setBegindate("20180101");
        areaRelation.setEnddate("20180101");
        areaRelation.setStrCode("123");
        areaRelation.setStrName("123");
        areaRelation.setAreaCode("123");
        areaRelation.setAreaName("123");
        boolean flag = areaRelationService.insertAreaRelation(areaRelation);
        System.out.println(flag);
    }

    @Test
    public void queryDistinctRelations(){
        List list  = areaRelationService.queryDistinctAreaRelation();
        System.out.println(list.size());
    }
}

