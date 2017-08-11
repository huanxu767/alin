package com.xh.alin.hbase.listener;

import com.xh.alin.hbase.util.HBaseUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;


/**
 * Created by 123 on 2016/9/30.
 */
@Service
public class StartupListener implements ApplicationListener<ContextRefreshedEvent>{

    static Logger logger = LoggerFactory.getLogger(StartupListener.class);

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        if (contextRefreshedEvent.getApplicationContext().getParent() == null) {
//            Hbase开关 需要是打开
            HBaseUtils.init();
        }
    }
}
