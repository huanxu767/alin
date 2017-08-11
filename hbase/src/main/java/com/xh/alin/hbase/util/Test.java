package com.xh.alin.hbase.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 123 on 2017/4/12.
 */
public class Test {
    public static void main(String[] args) {
//        Date date = new Date(1492042779068L);
        Date date = new Date(1491996494663L);
        SimpleDateFormat dateFormat =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(dateFormat.format(date));
    }
}
