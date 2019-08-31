package com.swust.demo.rbac.util;

/**
 * 操作日志类型
 *
 * @author chen
 */
public interface LogType {

    //部门操作日志
    int TYPE_DEPT = 1;

    //用户操作日志
    int TYPE_USER = 2;

    //权限模块操作日志
    int TYPE_ACL_MODULE = 3;

    //权限模块操作日志
    int TYPE_ACL = 4;

    //角色模块操作日志
    int TYPE_ROLE = 5;

    //角色权限模块操作日志
    int TYPE_ROLE_ACL = 6;

    //角色用户模块操作日志
    int TYPE_ROLE_USER = 7;
}
