package com.swust.demo.rbac.util;

/**
 * 调试台输出信息的工具
 *
 * @author chen
 */
public class Log {

    //判断是否打印信息 true：打印日志 false：不打印日志
    private static boolean LOG_FLAG = false;

    /**
     * 打印信息
     *
     * @param obj 需要打印的信息
     */
    public static void sop(Object obj) {
        if (!LOG_FLAG) {
            System.out.println(obj);
        }
    }
}
