package com.swust.demo.rbac.dao;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.AclInfo;
import com.swust.demo.rbac.bean.RoleAclRelation;

import java.security.acl.Acl;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：权限数据持久化操作类
 */
public class AclInfoDao extends BaseMySql {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = null;

    /**
     * 保存“权限”记录
     *
     * @param obj 权限对象
     */
    @Override
    public void save(Object obj) {
        AclInfo aclInfo = (AclInfo) obj;
        try {
            sql = "insert into sys_acl_info(code,name,acl_module_id,url,type,status,seq,remark,gmt_create,gmt_modified)"
                    + " values (?,?,?,?,?,?,?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, aclInfo.getCode());
            ps.setString(2, aclInfo.getName());
            ps.setLong(3, aclInfo.getAclModuleId());
            ps.setString(4, aclInfo.getUrl());
            ps.setInt(5, aclInfo.getType());
            ps.setInt(6, aclInfo.getStatus());
            ps.setInt(7, aclInfo.getSeq());
            ps.setString(8, aclInfo.getRemark());
            ps.setTimestamp(9, new Timestamp(System.currentTimeMillis()));
            ps.setTimestamp(10, new Timestamp(System.currentTimeMillis()));
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 查询权限记录
     *
     * @return
     */
    @Override
    public List<AclInfo> select() {
        List<AclInfo> list = new ArrayList<>();
        try {
            sql = "select * from sys_acl_info";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                AclInfo aclInfo = AclInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .code(rs.getString(4))
                        .name(rs.getString(5))
                        .aclModuleId(rs.getLong(6))
                        .url(rs.getString(7))
                        .type(rs.getInt(8))
                        .status(rs.getInt(9))
                        .seq(rs.getInt(10))
                        .remark(rs.getString(11))
                        .build();
                list.add(aclInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 查询权限记录
     *
     * @param id 记录id
     * @return
     */
    @Override
    public AclInfo selectById(Long id) {
        AclInfo aclInfo = null;
        try {
            sql = "select * from sys_acl_info where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                aclInfo = AclInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .code(rs.getString(4))
                        .name(rs.getString(5))
                        .aclModuleId(rs.getLong(6))
                        .url(rs.getString(7))
                        .type(rs.getInt(8))
                        .status(rs.getInt(9))
                        .seq(rs.getInt(10))
                        .remark(rs.getString(11))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return aclInfo;
    }

    /**
     * 查询权限记录
     *
     * @param aclName 权限名称
     * @return
     */
    public AclInfo selectByName(String aclName) {
        AclInfo aclInfo = null;
        try {
            sql = "select * from sys_acl_info where name=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, aclName);
            rs = ps.executeQuery();
            if (rs.next()) {
                aclInfo = AclInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .code(rs.getString(4))
                        .name(rs.getString(5))
                        .aclModuleId(rs.getLong(6))
                        .url(rs.getString(7))
                        .type(rs.getInt(8))
                        .status(rs.getInt(9))
                        .seq(rs.getInt(10))
                        .remark(rs.getString(11))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return aclInfo;
    }

    /**
     * 查询权限记录
     *
     * @param moduleId 权限模块ID
     * @return
     */
    public List<AclInfo> selectByModuleId(Long moduleId) {
        List<AclInfo> list = new ArrayList<>();
        try {
            sql = "select * from sys_acl_info where acl_module_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, moduleId);
            rs = ps.executeQuery();
            while (rs.next()) {
                AclInfo aclInfo = AclInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .code(rs.getString(4))
                        .name(rs.getString(5))
                        .aclModuleId(rs.getLong(6))
                        .url(rs.getString(7))
                        .type(rs.getInt(8))
                        .status(rs.getInt(9))
                        .seq(rs.getInt(10))
                        .remark(rs.getString(11))
                        .build();
                list.add(aclInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 更新权限记录
     *
     * @param obj 权限对象
     */
    @Override
    public void update(Object obj) {
        AclInfo aclInfo = (AclInfo) obj;
        try {
            sql = "update sys_acl_info set code=?,name=?,acl_module_id=?,url=?,type=?,status=?,seq=?,remark=?,gmt_modified=? where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, aclInfo.getCode());
            ps.setString(2, aclInfo.getName());
            ps.setLong(3, aclInfo.getAclModuleId());
            ps.setString(4, aclInfo.getUrl());
            ps.setInt(5, aclInfo.getType());
            ps.setInt(6, aclInfo.getStatus());
            ps.setInt(7, aclInfo.getSeq());
            ps.setString(8, aclInfo.getRemark());
//            ps.setTimestamp(9, aclInfo.getGmtCreate());
            ps.setTimestamp(9, new Timestamp(System.currentTimeMillis()));
            ps.setLong(10, aclInfo.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 删除权限记录
     *
     * @param id 权限对象ID
     */
    @Override
    public void delete(Long id) {
        try {
            sql = "delete from sys_acl_info where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 删除权限记录
     *
     * @param id 父级权限对象ID
     */
    public void deleteByAclModuleId(Long id) {
        try {
            sql = "delete from sys_acl_info where acl_module_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }
}
