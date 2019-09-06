package com.swust.demo.rbac.base;

import org.apache.logging.log4j.util.PropertiesUtil;

import java.io.InputStreamReader;
import java.sql.*;
import java.util.Properties;


/**
 * MySql数据库
 * 功能描述：
 * 基类，连接MySql数据库及关闭MySql数据库
 *
 * @author chen
 */
public abstract class BaseMySql implements BaseSql {
    //数据库驱动加载
    public static String driverclass = "com.mysql.jdbc.Driver";
    //数据库连接url
    public static String DB_URL = "jdbc:mysql://localhost:3306/permission_local?useUnicode=true&characterEncoding=UTF-8";
    //数据库名称
    public static String DB_NAME = "root";
    //数据库密码
    public static String DB_PWD =  "123456";

    public Connection con = null;
    public PreparedStatement ps = null;
    public ResultSet rs = null;
    public String sql = null;

    /**
     * 获取配置属性值
     * @param key 属性key
     * @return
     */
    public static String getProjectConfig(String key) {
        Properties pros = new Properties();
        String value = "";
        try {
            pros.load(new InputStreamReader(PropertiesUtil.class.getResourceAsStream("/application-release.yml"), "UTF-8"));
            value = pros.getProperty(key);
        } catch (Exception e) {
            return e.getMessage();
        }
        return value;
    }

    /**
     * 获取数据库连接对象
     *
     * @return
     */
    public static Connection getConnection() {
        try {

            Class.forName(driverclass);
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        Connection con = null;
        try {
            con = DriverManager.getConnection(DB_URL, DB_NAME, DB_PWD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    /**
     * 关闭数据库
     *
     * @param rs   记录集
     * @param stmt 声明
     * @param con  连接对象
     */
    public static void close(ResultSet rs, Statement stmt, Connection con) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
