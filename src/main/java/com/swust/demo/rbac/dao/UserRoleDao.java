package com.swust.demo.rbac.dao;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.UserRole;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：用户角色数据持久化操作类
 */
public class UserRoleDao extends BaseMySql {

    /**
     * 保存“用户角色”关联记录
     *
     * @param obj 用户角色对象
     */
    @Override
    public void save(Object obj) {
        UserRole userRole = (UserRole) obj;
        try {
            sql = "insert into sys_role_user(role_id,user_id,operator,operate_time,operate_ip)"
                    + " values (?,?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userRole.getRoleId());
            ps.setInt(2, userRole.getUserId());
            ps.setString(3, userRole.getOperator());
            ps.setTimestamp(4, userRole.getOperate_time());
            ps.setString(5, userRole.getOperate_ip());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 查询用户角色信息
     *
     * @param roleId 角色id
     * @param userId 用户id
     * @return List<UserRole>
     */
    public List<UserRole> findByArg(Integer roleId, Integer userId) {
        List<UserRole> list = new ArrayList<>();
        try {
            sql = "select * from sys_role_user where role_id=? and user_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, roleId);
            ps.setInt(2, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserRole dept = UserRole.builder()
                        .id(rs.getInt(1)).roleId(rs.getInt(2)).userId(rs.getInt(3))
                        .operator(rs.getString(4)).operate_time(rs.getTimestamp(5))
                        .operate_ip(rs.getString(6))
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
     * 查询所有的用户角色信息
     *
     * @return List<UserRole>
     */
    @Override
    public List<UserRole> find() {
        List<UserRole> list = new ArrayList<>();
        try {
            sql = "select * from sys_role_user";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserRole dept = UserRole.builder()
                        .id(rs.getInt(1)).roleId(rs.getInt(2)).userId(rs.getInt(3))
                        .operator(rs.getString(4)).operate_time(rs.getTimestamp(5))
                        .operate_ip(rs.getString(6))
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
     * 查询用户角色
     *
     * @param id 用户角色id
     * @return UserRole
     */
    @Override
    public UserRole findById(int id) {
        UserRole userRole = null;
        try {
            sql = "select * from sys_role_user where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                userRole = UserRole.builder()
                        .id(rs.getInt(1)).roleId(rs.getInt(2)).userId(rs.getInt(3))
                        .operator(rs.getString(4)).operate_time(rs.getTimestamp(5))
                        .operate_ip(rs.getString(6))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return userRole;
    }

    /**
     * 删除用户角色记录
     *
     * @param roleid 角色id
     */
    public void deleteByRoleid(int roleid) {
        try {
            sql = "delete from sys_role_user where role_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, roleid);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 删除用户角色记录
     *
     * @param userid 用户id
     */
    public void deleteByUserid(int userid) {
        try {
            sql = "delete from sys_role_user where user_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

//    public static void main(String[] args) {
//        UserRoleDao userRoleDao = new UserRoleDao();
//        userRoleDao.deleteByUserid(99);
//    }

    /**
     * 删除用户角色记录
     *
     * @param userRoleId
     */
    @Override
    public void delete(int userRoleId) {
        try {
            sql = "delete from sys_role_user where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userRoleId);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 更新用户角色记录
     *
     * @param obj 用户角色记录
     */
    @Override
    public void update(Object obj) {
        UserRole userRole = (UserRole) obj;
        try {
            sql = "update sys_role_user set role_id=?,user_id=?,operator=?,operate_time=?,operate_ip=? where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userRole.getRoleId());
            ps.setInt(2, userRole.getUserId());
            ps.setString(3, userRole.getOperator());
            ps.setTimestamp(4, userRole.getOperate_time());
            ps.setString(5, userRole.getOperate_ip());
            ps.setInt(6, userRole.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }


}
