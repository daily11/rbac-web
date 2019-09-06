package com.swust.demo.rbac.dao;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.AclInfo;
import com.swust.demo.rbac.bean.AclModuleInfo;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：权限模块数据持久化操作类
 */
public class AclModuleInfoDao extends BaseMySql {

    /**
     * 保存“权限模块”记录
     *
     * @param obj 权限模块对象
     */
    @Override
    public void save(Object obj) {
        AclModuleInfo aclModuleInfo = (AclModuleInfo) obj;
        try {
            sql = "insert into sys_acl_module_info(name,parent_id,level,seq,status,remark,gmt_create,gmt_modified)"
                    + " values (?,?,?,?,?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, aclModuleInfo.getName());
            ps.setLong(2, aclModuleInfo.getParentId());
            ps.setString(3, aclModuleInfo.getLevel());
            ps.setInt(4, aclModuleInfo.getSeq());
            ps.setInt(5, aclModuleInfo.getStatus());
            ps.setString(6, aclModuleInfo.getRemark());
            ps.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
            ps.setTimestamp(8, new Timestamp(System.currentTimeMillis()));
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 查询权限模块记录
     *
     * @return
     */
    @Override
    public List<AclModuleInfo> select() {
        List<AclModuleInfo> list = new ArrayList<>();
        try {
            sql = "select * from sys_acl_module_info";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                AclModuleInfo aclInfo = AclModuleInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .name(rs.getString(4))
                        .parentId(rs.getLong(5))
                        .level(rs.getString(6))
                        .seq(rs.getInt(7))
                        .status(rs.getInt(8))
                        .remark(rs.getString(9))
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
     * 查询权限模块记录
     *
     * @param id 记录id
     * @return
     */
    @Override
    public AclModuleInfo selectById(Long id) {
        AclModuleInfo aclModuleInfo = null;
        try {
            sql = "select * from sys_acl_module_info where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                aclModuleInfo = AclModuleInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .name(rs.getString(4))
                        .parentId(rs.getLong(5))
                        .level(rs.getString(6))
                        .seq(rs.getInt(7))
                        .status(rs.getInt(8))
                        .remark(rs.getString(9))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return aclModuleInfo;
    }

    /**
     * 查询权限模块记录
     *
     * @param aclModuleName 权限模块名
     * @return
     */
    public AclModuleInfo selectByName(String aclModuleName) {
        AclModuleInfo aclModuleInfo = null;
        try {
            sql = "select * from sys_acl_module_info where name=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, aclModuleName);
            rs = ps.executeQuery();
            if (rs.next()) {
                aclModuleInfo = AclModuleInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .name(rs.getString(4))
                        .parentId(rs.getLong(5))
                        .level(rs.getString(6))
                        .seq(rs.getInt(7))
                        .status(rs.getInt(8))
                        .remark(rs.getString(9))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return aclModuleInfo;
    }

    /**
     * 更新权限模块记录
     *
     * @param obj 权限模块对象
     */
    @Override
    public void update(Object obj) {
        AclModuleInfo aclModuleInfo = (AclModuleInfo) obj;
        try {
            sql = "update sys_acl_module_info set name=?,parent_id=?,level=?,seq=?,status=?,remark=?,gmt_modified=? where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, aclModuleInfo.getName());
            ps.setLong(2, aclModuleInfo.getParentId());
            ps.setString(3, aclModuleInfo.getLevel());
            ps.setInt(4, aclModuleInfo.getSeq());
            ps.setInt(5, aclModuleInfo.getStatus());
            ps.setString(6, aclModuleInfo.getRemark());
//            ps.setTimestamp(7, aclModuleInfo.getGmtCreate());
            ps.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
            ps.setLong(8, aclModuleInfo.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 删除权限模块记录
     *
     * @param id 权限模块对象ID
     */
    @Override
    public void delete(Long id) {
        try {
            sql = "delete from sys_acl_module_info where id=?";
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
