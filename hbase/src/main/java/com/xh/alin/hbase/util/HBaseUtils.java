package com.xh.alin.hbase.util;

/**
 * Created by 123 on 2017/4/11.
 */

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.ZooKeeperConnectionException;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;

import java.io.IOException;

public class HBaseUtils {

    private static final String QUORUM = "192.168.29.134,192.168.29.135,192.168.29.137";
    private static final String CLIENT_PORT = "2181";
    private static Configuration configuration = null;
    private static Connection conn = null;

    public static void init(){
        try {
            getConnection();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 获取全局唯一的Configuration实例
     * @return
     */
    public static synchronized Configuration getConfiguration(){
        if(configuration == null){
            configuration =  HBaseConfiguration.create();
            configuration.set("hbase.zookeeper.quorum", QUORUM);
            configuration.set("hbase.zookeeper.property.clientPort", CLIENT_PORT);
        }
        return configuration;
    }

    /**
     * 获取全局唯一的Connection实例
     * @return
     * @throws IOException
     */
    public static synchronized Connection getConnection() throws IOException{
        if(conn == null){
            conn = ConnectionFactory.createConnection(getConfiguration());
        }
        return conn;
    }
}
