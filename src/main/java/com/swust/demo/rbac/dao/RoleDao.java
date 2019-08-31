package com.swust.demo.rbac.dao;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.Role;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：角色数据持久化操作类
 */
public class RoleDao extends BaseMySql {

    /**
     * 查询角色信息
     *
     * @param name 角色名
     * @return List<Role>
     */
    public List<Role> findByArg(String name) {
        List<Role> list = new ArrayList<>();
        try {
            sql = "select * from sys_role where name=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role role = Role.builder().id(rs.getInt(1)).name(rs.getString(2))
                        .type(rs.getInt(3)).status(rs.getInt(4)).remark(rs.getString(5))
                        .operator(rs.getString(6)).operate_time(rs.getTimestamp(7))
                        .operate_ip(rs.getString(8))
                        .build();
                list.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 删除角色记录
     *
     * @param roleId 角色id
     */
    @Override
    public void delete(int roleId) {
        try {
            sql = "delete from sys_role where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, roleId);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 删除角色记录
     *
     * @param roleName 角色名
     */
    public void deleteRoleByName(String roleName) {
        try {
            sql = "delete from sys_role where name=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, roleName);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 保存角色信息
     *
     * @param obj 角色
     */
    @Override
    public void save(Object obj) {
        Role role = (Role) obj;
        try {
            sql = "insert into sys_role(name,type,status,remark,operator,operate_time,operate_ip)"
                    + " values (?,?,?,?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, role.getName());
            ps.setInt(2, role.getType());
            ps.setInt(3, role.getStatus());
            ps.setString(4, role.getRemark());
            ps.setString(5, role.getOperator());
            ps.setTimestamp(6, role.getOperate_time());
            ps.setString(7, role.getOperate_ip());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 更新角色
     *
     * @param obj 角色
     */
    @Override
    public void update(Object obj) {
        Role role = (Role) obj;
        try {
            sql = "update sys_role set name=?,type=?,status=?,remark=?,operator=?,operate_time=?,operate_ip=? where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, role.getName());
            ps.setInt(2, role.getType());
            ps.setInt(3, role.getStatus());
            ps.setString(4, role.getRemark());
            ps.setString(5, role.getOperator());
            ps.setTimestamp(6, role.getOperate_time());
            ps.setString(7, role.getOperate_ip());
            ps.setInt(8, role.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 查询所有的角色信息
     *
     * @return List<Role>
     */
    @Override
    public List<Role> find() {
        List<Role> list = new ArrayList<>();
        try {
            sql = "select * from sys_role";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role role = Role.builder().id(rs.getInt(1)).name(rs.getString(2))
                        .type(rs.getInt(3)).status(rs.getInt(4)).remark(rs.getString(5))
                        .operator(rs.getString(6)).operate_time(rs.getTimestamp(7))
                        .operate_ip(rs.getString(8))
                        .build();
                list.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 查询角色信息
     *
     * @param id 角色id
     * @return Role
     */
    @Override
    public Role findById(int id) {
        Role role = null;
        try {
            sql = "select * from sys_role where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                role = Role.builder().id(rs.getInt(1)).name(rs.getString(2))
                        .type(rs.getInt(3)).status(rs.getInt(4)).remark(rs.getString(5))
                        .operator(rs.getString(6)).operate_time(rs.getTimestamp(7))
                        .operate_ip(rs.getString(8))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return role;
    }
}
