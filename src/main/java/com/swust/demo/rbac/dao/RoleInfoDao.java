package com.swust.demo.rbac.dao;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.AclInfo;
import com.swust.demo.rbac.bean.RoleInfo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：角色数据持久化操作类
 */
public class RoleInfoDao extends BaseMySql {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = null;

    /**
     * 保存“角色”记录
     *
     * @param obj 角色对象
     */
    @Override
    public void save(Object obj) {
        RoleInfo roleInfo = (RoleInfo) obj;
        try {
            sql = "insert into sys_role_info(name,type,status,remark,gmt_create,gmt_modified)"
                    + " values (?,?,?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, roleInfo.getName());
            ps.setInt(2, roleInfo.getType());
            ps.setInt(3, roleInfo.getStatus());
            ps.setString(4, roleInfo.getRemark());
            ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            ps.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 查询所有角色记录
     *
     * @return
     */
    @Override
    public List<RoleInfo> select() {
        List<RoleInfo> list = new ArrayList<>();
        try {
            sql = "select * from sys_role_info";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                RoleInfo roleInfo = RoleInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .name(rs.getString(4))
                        .type(rs.getInt(5))
                        .status(rs.getInt(6))
                        .remark(rs.getString(7))
                        .build();
                list.add(roleInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 查询角色记录
     *
     * @param id 记录id
     * @return
     */
    @Override
    public RoleInfo selectById(Long id) {
        RoleInfo roleInfo = null;
        try {
            sql = "select * from sys_role_info where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                roleInfo = RoleInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .name(rs.getString(4))
                        .type(rs.getInt(5))
                        .status(rs.getInt(6))
                        .remark(rs.getString(7))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return roleInfo;
    }

    /**
     * 查询角色记录
     *
     * @param roleName 记录名称
     * @return
     */
    public RoleInfo selectByName(String roleName) {
        RoleInfo roleInfo = null;
        try {
            sql = "select * from sys_role_info where name=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, roleName);
            rs = ps.executeQuery();
            if (rs.next()) {
                roleInfo = RoleInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .name(rs.getString(4))
                        .type(rs.getInt(5))
                        .status(rs.getInt(6))
                        .remark(rs.getString(7))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return roleInfo;
    }

    /**
     * 更新角色记录
     *
     * @param obj 角色对象
     */
    @Override
    public void update(Object obj) {
        RoleInfo roleInfo = (RoleInfo) obj;
        try {
            sql = "update sys_role_info set name=?,type=?,status=?,remark=?,gmt_modified=? where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, roleInfo.getName());
            ps.setInt(2, roleInfo.getType());
            ps.setInt(3, roleInfo.getStatus());
            ps.setString(4, roleInfo.getRemark());
//            ps.setTimestamp(5, roleInfo.getGmtCreate());
            ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            ps.setLong(6, roleInfo.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 删除角色记录
     *
     * @param id 角色对象ID
     */
    @Override
    public void delete(Long id) {
        try {
            sql = "delete from sys_role_info where id=?";
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
