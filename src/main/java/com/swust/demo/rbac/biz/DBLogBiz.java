package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.*;
import com.swust.demo.rbac.util.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 功能模块：日志操作类
 */
public class DBLogBiz {

    /**
     * 保存新增用户操作日志
     *
     * @param before 修改前的用户，默认为null
     * @param after  修改后的用户，即新增的用户
     */
    public void saveUserLog(User before, User after) {
//		SysLog sysLog = new SysLog();
//		sysLog.setType(LogType.TYPE_USER);
//	    sysLog.setTargetId(after == null ? before.getId() : after.getId());
//	    sysLog.setOldValue(before == null ? "" : before.toString());
//	    sysLog.setNewValue(after == null ? "" : after.toString());
//	    sysLog.setOperator(Operator.OPERATOR_NAME);
//        sysLog.setOperateIp(IpUtil.IP_PATH);
//        sysLog.setOperateTime(TimeUtil.getCurrentTimestamp());
//	    sysLog.setStatus(1);
//	    
//	    saveLog(sysLog);
    }

    /**
     * 保存新增角色操作日志
     *
     * @param before 修改前的角色，默认为null
     * @param after  修改后的角色，即新增的角色
     */
    public void saveRoleLog(Role before, Role after) {
        SysLog sysLog = new SysLog();
        sysLog.setType(LogType.TYPE_ROLE);
        sysLog.setTargetId(after == null ? before.getId() : after.getId());
        sysLog.setOldValue(before == null ? "" : before.toString());
        sysLog.setNewValue(after == null ? "" : after.toString());
        sysLog.setOperator(Operator.OPERATOR_NAME);
        sysLog.setOperateIp(IpUtil.IP_PATH);
        sysLog.setOperateTime(TimeUtil.getCurrentTimestamp());
        sysLog.setStatus(1);

        saveLog(sysLog);
    }

    /**
     * 保存新增权限操作日志
     *
     * @param before 修改前的权限，默认为null
     * @param after  修改后的权限，即新增的权限
     */
    public void saveAclLog(Acl before, Acl after) {
        SysLog sysLog = new SysLog();
        sysLog.setType(LogType.TYPE_ACL);
        sysLog.setTargetId(after == null ? before.getId() : after.getId());
        sysLog.setOldValue(before == null ? "" : before.toString());
        sysLog.setNewValue(after == null ? "" : after.toString());
        sysLog.setOperator(Operator.OPERATOR_NAME);
        sysLog.setOperateIp(IpUtil.IP_PATH);
        sysLog.setOperateTime(TimeUtil.getCurrentTimestamp());
        sysLog.setStatus(1);

        saveLog(sysLog);
    }

    /**
     * 保存新增权限模块操作日志
     *
     * @param before 修改前的权限模块，默认为null
     * @param after  修改后的权限模块，即新增的权限模块
     */
    public void saveAclModuleLog(AclModule before, AclModule after) {
        SysLog sysLog = new SysLog();
        sysLog.setType(LogType.TYPE_ACL_MODULE);
        sysLog.setTargetId(after == null ? before.getId() : after.getId());
        sysLog.setOldValue(before == null ? "" : before.toString());
        sysLog.setNewValue(after == null ? "" : after.toString());
        sysLog.setOperator(Operator.OPERATOR_NAME);
        sysLog.setOperateIp(IpUtil.IP_PATH);
        sysLog.setOperateTime(TimeUtil.getCurrentTimestamp());
        sysLog.setStatus(1);

        Log.sop(sysLog.toString());
        saveLog(sysLog);
    }

    /**
     * 日志入库
     *
     * @param sysLog 日志记录
     */
    public void saveLog(SysLog sysLog) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;
        try {
            sql = "insert into sys_log(type,target_id,old_value,new_value,operator,operate_time,operate_ip,status)"
                    + " values (?,?,?,?,?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, sysLog.getType());
            ps.setInt(2, sysLog.getTargetId());
            ps.setString(3, sysLog.getOldValue());
            ps.setString(4, sysLog.getNewValue());
            ps.setString(5, sysLog.getOperator());
            ps.setTimestamp(6, sysLog.getOperateTime());
            ps.setString(7, sysLog.getOperateIp());
            ps.setInt(8, sysLog.getStatus());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }


}
