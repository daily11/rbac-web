package com.swust.demo.rbac.util;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 时间工具类
 * 生成操作的时间等
 *
 * @author chen
 */
public class TimeUtil {

    /**
     * 获取当前时间
     * @return Timestamp
     */
    public static Timestamp getCurrentTimestamp() {
        return new Timestamp(new Date().getTime());
    }
}
