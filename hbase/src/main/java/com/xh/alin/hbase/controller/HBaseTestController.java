package com.xh.alin.hbase.controller;


import com.xh.alin.hbase.util.HBaseUtils;
import org.apache.hadoop.hbase.*;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.util.Bytes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


@Controller
@RequestMapping("/hbaseTest")
public class HBaseTestController{

	Logger logger = LoggerFactory.getLogger(HBaseTestController.class);

	@ResponseBody
	@RequestMapping(value = "testHbase")
	public String testlog() {
        try {
//            listTables();
//            insert("test","row3","cf","b","value3");
//
//            insert("test","foo10","cf","f1","value7");
//            insert("test","foo11","cf","f2","value8");
            insert("test","foo45","cf","f21","value日");

//            getData("test", "row2");
            //创建爬虫表

            //插入记录
            queryAll("test");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
	}

    /**
     * 查看已有表
     *
     * @throws IOException
     */
    public static void listTables() throws Exception {
        Admin admin = HBaseUtils.getConnection().getAdmin();
        HTableDescriptor hTableDescriptors[] = null;
        hTableDescriptors = admin.listTables();
        for (HTableDescriptor hTableDescriptor : hTableDescriptors) {
            System.out.println("ri:"+hTableDescriptor.getNameAsString());
        }
        if (null != admin) {
            admin.close();
        }
    }

    public static void insert(String tableName, String rowKey, String colFamily, String col, String value) throws IOException {
        Table table = HBaseUtils.getConnection().getTable(TableName.valueOf(tableName));
        Put put = new Put(Bytes.toBytes(rowKey));
        put.addColumn(Bytes.toBytes(colFamily), Bytes.toBytes(col), Bytes.toBytes(value));
        table.put(put);
        /*
         * 批量插入 List<Put> putList = new ArrayList<Put>(); puts.add(put); table.put(putList);
         */
        table.close();
    }

    /**
     * 根据RowKey获取信息
     *
     * @param tableName
     * @param rowKey
     * @throws IOException
     */
    public static void getData(String tableName, String rowKey) throws IOException {
        getData(tableName, rowKey, null, null);
    }

    /**
     * 根据RowKey获取数据
     *
     * @param tableName 表名称
     * @param rowKey RowKey名称
     * @param colFamily 列族名称
     * @param col 列名称
     * @throws IOException
     */
    public static void getData(String tableName, String rowKey, String colFamily, String col) throws IOException {
        Table table = HBaseUtils.getConnection().getTable(TableName.valueOf(tableName));
        Get get = new Get(Bytes.toBytes(rowKey));
        if (colFamily != null) {
            get.addFamily(Bytes.toBytes(colFamily));
        }
        if (colFamily != null && col != null) {
            get.addColumn(Bytes.toBytes(colFamily), Bytes.toBytes(col));
        }
        Result result = table.get(get);
        showCell(result);
        table.close();
    }


    public static void queryAll(String tableName){
        Table table = null;
        try {
            table = HBaseUtils.getConnection().getTable(TableName.valueOf(tableName));

            Scan scan = new Scan();
//            ResultScanner rs = table.getScanner(new Scan(Bytes.toBytes("foo1"),Bytes.toBytes("foo4")));
//            ResultScanner rs = table.getScanner(new Scan(Bytes.toBytes("row1")));
//            ResultScanner rs = table.getScanner(new Scan(Bytes.toBytes("cf")));

            /**时间查询 **/
            SimpleDateFormat dateFormat =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date beginDate = dateFormat.parse("2017-04-12 19:30:00");
            scan.setTimeRange(beginDate.getTime(),System.currentTimeMillis());
            scan.setMaxVersions();

            ResultScanner rs = table.getScanner(scan);
            for (Result result : rs) {
                System.out.println("获得到rowkey:" + new String(result.getRow()));
//                showCell(result);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(table != null){
                try {
                    table.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 格式化输出
     *
     * @param result
     */
    public static void showCell(Result result) {
        Cell[] cells = result.rawCells();
        for (Cell cell : cells) {
            System.out.println("RowName: " + new String(CellUtil.cloneRow(cell)) + " ");
            System.out.println("Timetamp: " + cell.getTimestamp() + " ");
            System.out.println("column Family: " + new String(CellUtil.cloneFamily(cell)) + " ");
            System.out.println("row Name: " + new String(CellUtil.cloneQualifier(cell)) + " ");
            System.out.println("value: " + new String(CellUtil.cloneValue(cell)) + " ");
        }
    }


}
