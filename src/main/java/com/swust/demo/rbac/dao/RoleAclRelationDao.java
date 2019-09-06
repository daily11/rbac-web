package com.swust.demo.rbac.dao;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.RoleAclRelation;
import com.swust.demo.rbac.param.RoleAclViewParam;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 * 功能描述：角色权限数据持久化操作类
 */
public class RoleAclRelationDao extends BaseMySql {

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
        RoleAclRelation aclRole = (RoleAclRelation) obj;
        try {
            sql = "insert into sys_role_acl_relation(role_id,acl_id,gmt_create,gmt_modified)"
                    + " values (?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, aclRole.getRoleId());
            ps.setLong(2, aclRole.getAclId());
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            ps.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 查询所有的角色权限记录
     *
     * @return
     */
    @Override
    public List<RoleAclRelation> select() {
        List<RoleAclRelation> list = new ArrayList<>();
        try {
            sql = "select * from sys_role_acl_relation";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                RoleAclRelation dept = RoleAclRelation.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .roleId(rs.getLong(4))
                        .aclId(rs.getLong(5))
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
     * 查询角色权限记录
     *
     * @param id 记录id
     * @return
     */
    @Override
    public RoleAclRelation selectById(Long id) {
        RoleAclRelation roleAcl = null;
        try {
            sql = "select * from sys_role_acl_relation where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                roleAcl = RoleAclRelation.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .roleId(rs.getLong(4))
                        .aclId(rs.getLong(5))
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
     * 查询角色对应的权限
     *
     * @param rolename 角色名
     * @return
     */
    public List<RoleAclViewParam> selectRoleAclViewParam(String rolename) {
        List<RoleAclViewParam> list = new ArrayList<>();
        try {
            sql = "SELECT sys_role_info.id as roleId,sys_acl_info.id as aclId,sys_acl_info.`name` as aclName,sys_role_info.`name` as roleName \n" +
                    "from sys_role_info join sys_role_acl_relation on sys_role_info.id=sys_role_acl_relation.role_id\n" +
                    "join sys_acl_info on sys_acl_info.id=sys_role_acl_relation.acl_id\n" +
                    "where sys_role_info.name=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, rolename);
            rs = ps.executeQuery();
            while (rs.next()) {
                RoleAclViewParam roleAclViewParam = new RoleAclViewParam(
                        rs.getLong(1),
                        rs.getLong(2),
                        rs.getString(3),
                        rs.getString(4));
                list.add(roleAclViewParam);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }


    /**
     * 更新角色权限记录
     *
     * @param obj 角色权限对象
     */
    @Override
    public void update(Object obj) {
        RoleAclRelation roleAclRelation = (RoleAclRelation) obj;
        try {
            sql = "update sys_role_acl_relation set role_id=?,acl_id=?,gmt_modified=? where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, roleAclRelation.getRoleId());
            ps.setLong(2, roleAclRelation.getAclId());
//            ps.setTimestamp(3, roleAclRelation.getGmtCreate());
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            ps.setLong(4, roleAclRelation.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 删除角色权限记录
     *
     * @param id 角色权限对象ID
     */
    @Override
    public void delete(Long id) {
        try {
            sql = "delete from sys_role_acl_relation where id=?";
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
     * 删除角色权限记录
     *
     * @param id 权限点ID
     */
    public void deleteByAclId(Long id) {
        try {
            sql = "delete from sys_role_acl_relation where acl_id=?";
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

    public void deleteByRoleId(Long roleId) {
        try {
            sql = "delete from sys_role_acl_relation where role_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, roleId);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

}
