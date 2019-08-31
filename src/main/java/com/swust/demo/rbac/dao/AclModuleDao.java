package com.swust.demo.rbac.dao;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.AclModule;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：权限模块数据持久化操作类
 */
public class AclModuleDao extends BaseMySql {

    /**
     * 保存权限模块对象
     *
     * @param obj 权限模块对象
     */
    @Override
    public void save(Object obj) {
        AclModule aclModule = (AclModule) obj;
        try {
            sql = "insert into sys_acl_module(name,parent_id,level,seq,status,remark,operator,operate_time,operate_ip)"
                    + " values (?,?,?,?,?,?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, aclModule.getName());
            ps.setInt(2, aclModule.getParentId());
            ps.setString(3, aclModule.getLevel());
            ps.setInt(4, aclModule.getSeq());
            ps.setInt(5, aclModule.getStatus());
            ps.setString(6, aclModule.getRemark());
            ps.setString(7, aclModule.getOperator());
            ps.setTimestamp(8, aclModule.getOperateTime());
            ps.setString(9, aclModule.getOperateIp());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 查询所有的权限模块信息
     *
     * @return List<AclModule>
     */
    @Override
    public List<AclModule> find() {
        AclModule aclModule = null;
        List<AclModule> list = new ArrayList<>();
        try {
            sql = "select * from sys_acl_module";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                aclModule = AclModule.builder().id(rs.getInt(1)).name(rs.getString(2))
                        .parentId(rs.getInt(3)).level(rs.getString(4))
                        .seq(rs.getInt(5)).status(rs.getInt(6)).remark(rs.getString(7))
                        .operator(rs.getString(8)).operateTime(rs.getTimestamp(9))
                        .operateIp(rs.getString(10))
                        .build();
                list.add(aclModule);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 查询权限模块信息
     *
     * @param id 权限模块id
     * @return AclModule
     */
    @Override
    public AclModule findById(int id) {
        AclModule aclModule = null;
        try {
            sql = "select * from sys_acl_module where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                aclModule = AclModule.builder().id(rs.getInt(1)).name(rs.getString(2))
                        .parentId(rs.getInt(3)).level(rs.getString(4))
                        .seq(rs.getInt(5)).status(6).remark(rs.getString(7))
                        .operator(rs.getString(8)).operateTime(rs.getTimestamp(9))
                        .operateIp(rs.getString(10))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return aclModule;
    }

    /**
     * 查询权限模块信息
     *
     * @param parentId      上级权限模块id
     * @param aclModuleName 权限模块名称
     * @return List<AclModule>
     */
    public List<AclModule> findByArg(Integer parentId, String aclModuleName) {
        List<AclModule> list = new ArrayList<>();
        try {
            sql = "select * from sys_acl_module where name=? and parent_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, aclModuleName);
            ps.setInt(2, parentId);
            rs = ps.executeQuery();
            while (rs.next()) {
                AclModule dept = AclModule.builder()
                        .id(rs.getInt(1)).name(rs.getString(2))
                        .parentId(rs.getInt(3)).level(rs.getString(4))
                        .seq(rs.getInt(5)).status(rs.getInt(6)).remark(rs.getString(7))
                        .operator(rs.getString(8)).operateTime(rs.getTimestamp(9))
                        .operateIp(rs.getString(10))
                        .build();
                list.add(dept);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 删除权限模块记录
     *
     * @param aclModuleId 权限模块id
     */
    @Override
    public void delete(int aclModuleId) {
        try {
            sql = "delete from sys_acl_module where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, aclModuleId);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }


    /**
     * 更新权限模块记录
     *
     * @param obj 权限模块记录
     */
    @Override
    public void update(Object obj) {
        AclModule aclModule = (AclModule) obj;
        try {
            sql = "update sys_acl_module set name=?,parent_id=?,level=?,seq=?,status=?,remark=?,operator=?,operate_time=?,operate_ip=? where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, aclModule.getName());
            ps.setInt(2, aclModule.getParentId());
            ps.setString(3, aclModule.getLevel());
            ps.setInt(4, aclModule.getSeq());
            ps.setInt(5, aclModule.getStatus());
            ps.setString(6, aclModule.getRemark());
            ps.setString(7, aclModule.getOperator());
            ps.setTimestamp(8, aclModule.getOperateTime());
            ps.setString(9, aclModule.getOperateIp());
            ps.setInt(10, aclModule.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

}
