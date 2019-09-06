package com.swust.demo.rbac.dao;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.UsergroupRoleRelation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：用户组-角色 数据持久化操作类
 */
public class UsergroupRoleRelationDao extends BaseMySql {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = null;

    /**
     * 保存“用户组-角色”关联记录
     *
     * @param obj 用户组-角色 对象
     */
    @Override
    public void save(Object obj) {
        UsergroupRoleRelation usergroupRoleRelation = (UsergroupRoleRelation) obj;
        try {
            sql = "insert into sys_usergroup_role_relation(user_group_id,role_id,gmt_create,gmt_modified)"
                    + " values (?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, usergroupRoleRelation.getUserGroupId());
            ps.setLong(2, usergroupRoleRelation.getRoleId());
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
     * 查询所有的用户组-角色 记录
     *
     * @return
     */
    @Override
    public List<UsergroupRoleRelation> select() {
        List<UsergroupRoleRelation> list = new ArrayList<>();
        try {
            sql = "select * from sys_usergroup_role_relation";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UsergroupRoleRelation dept = UsergroupRoleRelation.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .userGroupId(rs.getLong(4))
                        .roleId(rs.getLong(5))
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
     * 查询用户组-角色 记录
     *
     * @param id 记录id
     * @return
     */
    @Override
    public UsergroupRoleRelation selectById(Long id) {
        UsergroupRoleRelation usergroupRoleRelation = null;
        try {
            sql = "select * from sys_usergroup_role_relation where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                usergroupRoleRelation = UsergroupRoleRelation.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .userGroupId(rs.getLong(4))
                        .roleId(rs.getLong(5))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return usergroupRoleRelation;
    }

    public List<UsergroupRoleRelation> selectByGroupId(Long id) {
        List<UsergroupRoleRelation> list = new ArrayList<>();
        try {
            sql = "select * from sys_usergroup_role_relation where user_group_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                UsergroupRoleRelation usergroupRoleRelation = UsergroupRoleRelation.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .userGroupId(rs.getLong(4))
                        .roleId(rs.getLong(5))
                        .build();
                list.add(usergroupRoleRelation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 更新用户组-角色 记录
     *
     * @param obj 用户组-角色 对象
     */
    @Override
    public void update(Object obj) {
        UsergroupRoleRelation usergroupRoleRelation = (UsergroupRoleRelation) obj;
        try {
            sql = "update sys_usergroup_role_relation set user_group_id=?,role_id=?,gmt_modified=? where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, usergroupRoleRelation.getUserGroupId());
            ps.setLong(2, usergroupRoleRelation.getRoleId());
//            ps.setTimestamp(3, usergroupRoleRelation.getGmtCreate());
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            ps.setLong(4, usergroupRoleRelation.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 删除用户组-角色 记录
     *
     * @param id 用户组-角色 对象ID
     */
    @Override
    public void delete(Long id) {
        try {
            sql = "delete from sys_usergroup_role_relation where id=?";
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

    public void deleteByRoleid(Long roleId) {
        try {
            sql = "delete from sys_usergroup_role_relation where role_id=?";
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

    public void deleteByUsergroupId(Long groupId) {
        try {
            sql = "delete from sys_usergroup_role_relation where user_group_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, groupId);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }
}
