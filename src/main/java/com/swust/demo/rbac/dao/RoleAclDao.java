package com.swust.demo.rbac.dao;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.RoleAcl;
import com.swust.demo.rbac.param.RoleAclViewParam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 * 功能描述：角色权限数据持久化操作类
 */
public class RoleAclDao extends BaseMySql {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = null;

    /**
     * 保存“角色权限”关联记录
     *
     * @param obj 用户角色对象
     */
    @Override
    public void save(Object obj) {
        RoleAcl aclRole = (RoleAcl) obj;
        try {
            sql = "insert into sys_role_acl(role_id,acl_id,operator,operate_time,operate_ip)"
                    + " values (?,?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, aclRole.getRoleId());
            ps.setInt(2, aclRole.getAclId());
            ps.setString(3, aclRole.getOperator());
            ps.setTimestamp(4, aclRole.getOperate_time());
            ps.setString(5, aclRole.getOperate_ip());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 查询角色权限信息
     *
     * @param roleId 角色id
     * @param aclId  权限id
     * @return List<RoleAcl>
     */
    public List<RoleAcl> findByArg(Integer roleId, Integer aclId) {
        List<RoleAcl> list = new ArrayList<>();
        try {
            sql = "select * from sys_role_acl where role_id=? and acl_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, roleId);
            ps.setInt(2, aclId);
            rs = ps.executeQuery();
            while (rs.next()) {
                RoleAcl dept = RoleAcl.builder()
                        .id(rs.getInt(1)).roleId(rs.getInt(2)).aclId(rs.getInt(3))
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
     * 查询所有的角色权限
     *
     * @return List<RoleAcl>
     */
    @Override
    public List<RoleAcl> find() {
        List<RoleAcl> list = new ArrayList<>();
        try {
            sql = "select * from sys_role_acl";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                RoleAcl dept = RoleAcl.builder()
                        .id(rs.getInt(1)).roleId(rs.getInt(2)).aclId(rs.getInt(3))
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
     * 查询角色权限
     *
     * @param id 角色权限id
     * @return RoleAcl
     */
    @Override
    public RoleAcl findById(int id) {
        RoleAcl roleAcl = null;
        try {
            sql = "select * from sys_role_acl where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                roleAcl = RoleAcl.builder()
                        .id(rs.getInt(1)).roleId(rs.getInt(2)).aclId(rs.getInt(3))
                        .operator(rs.getString(4)).operate_time(rs.getTimestamp(5))
                        .operate_ip(rs.getString(6))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return roleAcl;
    }

    /**
     * 删除角色权限记录
     *
     * @param roleAclId 角色权限id
     */
    @Override
    public void delete(int roleAclId) {
        try {
            sql = "delete from sys_role_acl where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, roleAclId);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 删除角色权限记录
     *
     * @param roleId 角色id
     */
    public void deleteByRoleId(int roleId) {
        try {
            sql = "delete from sys_role_acl where role_id=?";
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
     * 删除角色权限记录
     *
     * @param aclId 权限点id
     */
    public void deleteByAclId(int aclId) {
        try {
            sql = "delete from sys_role_acl where acl_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, aclId);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 更新角色权限记录
     *
     * @param obj 角色权限记录
     */
    @Override
    public void update(Object obj) {
        RoleAcl roleAcl = (RoleAcl) obj;
        try {
            sql = "update sys_role_acl set role_id=?,acl_id=?,operator=?,operate_time=?,operate_ip=? where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, roleAcl.getRoleId());
            ps.setInt(2, roleAcl.getAclId());
            ps.setString(3, roleAcl.getOperator());
            ps.setTimestamp(4, roleAcl.getOperate_time());
            ps.setString(5, roleAcl.getOperate_ip());
            ps.setInt(6, roleAcl.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 查询角色对应的权限
     *
     * @param rolename 角色名
     * @return
     */
    public List<RoleAclViewParam> find(String rolename) {
        List<RoleAclViewParam> list = new ArrayList<>();
        try {
            sql = "SELECT sys_role.id as roleId,sys_acl.id as aclId,sys_acl.`name` as aclName,sys_role.`name` as roleName from ((sys_role join sys_role_acl on (sys_role.id=sys_role_acl.role_id)) join sys_acl on (sys_acl.id=sys_role_acl.acl_id)) where sys_role.name=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, rolename);
            rs = ps.executeQuery();
            while (rs.next()) {
                RoleAclViewParam roleAclViewParam = new RoleAclViewParam(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
                list.add(roleAclViewParam);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }
}
