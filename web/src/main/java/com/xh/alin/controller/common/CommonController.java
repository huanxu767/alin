package com.xh.alin.controller.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by 123 on 2017/3/14.
 */
@Controller
@RequestMapping("/")
public class CommonController {

    private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

    /**
     * 首页
     * @return
     */
    @RequestMapping(value = "index")
    public ModelAndView main(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        return modelAndView;
    }

    /**
     * 下载页
     * @return
     */
    @RequestMapping(value = "sale/downLoad")
    public ModelAndView downLoad(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("downLoad");
        return modelAndView;
    }



}
