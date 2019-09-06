package com.swust.demo.rbac.dao;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.UserUsergroupRelation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：用户-用户组 数据持久化操作类
 */
public class UserUsergroupRelationDao extends BaseMySql {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = null;

    /**
     * 保存“用户-用户组”关联记录
     *
     * @param obj 用户-用户组 对象
     */
    @Override
    public void save(Object obj) {
        UserUsergroupRelation userUsergroupRelation = (UserUsergroupRelation) obj;
        try {
            sql = "insert into sys_user_usergroup_relation(user_id,user_group_id,gmt_create,gmt_modified)"
                    + " values (?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, userUsergroupRelation.getUserId());
            ps.setLong(2, userUsergroupRelation.getUserGroupId());
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
     * 查询所有的用户-用户组 记录
     *
     * @return
     */
    @Override
    public List<UserUsergroupRelation> select() {
        List<UserUsergroupRelation> list = new ArrayList<>();
        try {
            sql = "select * from sys_user_usergroup_relation";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserUsergroupRelation userUsergroupRelation = UserUsergroupRelation.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .userId(rs.getLong(4))
                        .userGroupId(rs.getLong(5))
                        .build();
                list.add(userUsergroupRelation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 查询用户-用户组记录
     *
     * @param id 记录id
     * @return
     */
    @Override
    public UserUsergroupRelation selectById(Long id) {
        UserUsergroupRelation UserUsergroupRelation = null;
        try {
            sql = "select * from sys_user_usergroup_relation where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                UserUsergroupRelation = UserUsergroupRelation.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .userId(rs.getLong(4))
                        .userGroupId(rs.getLong(5))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return UserUsergroupRelation;
    }

    public List<UserUsergroupRelation> selectByUserId(Long id) {
        List<UserUsergroupRelation> list = new ArrayList<>();
        try {
            sql = "select * from sys_user_usergroup_relation where user_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserUsergroupRelation userUsergroupRelation = UserUsergroupRelation.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .userId(rs.getLong(4))
                        .userGroupId(rs.getLong(5))
                        .build();
                list.add(userUsergroupRelation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 更新用户-用户组 记录
     *
     * @param obj 用户-用户组 对象
     */
    @Override
    public void update(Object obj) {
        UserUsergroupRelation userUsergroupRelation = (UserUsergroupRelation) obj;
        try {
            sql = "update sys_user_usergroup_relation set user_id=?,user_group_id=?,gmt_modified=? where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, userUsergroupRelation.getUserId());
            ps.setLong(2, userUsergroupRelation.getUserGroupId());
//            ps.setTimestamp(3, userUsergroupRelation.getGmtCreate());
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            ps.setLong(4, userUsergroupRelation.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 删除用户-用户组 记录
     *
     * @param id 用户-用户组 对象ID
     */
    @Override
    public void delete(Long id) {
        try {
            sql = "delete from sys_user_usergroup_relation where id=?";
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

    public void deleteByUserId(Long userId) {
        try {
            sql = "delete from sys_user_usergroup_relation where user_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, userId);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    public void deleteByUsergroupId(Long groupId) {
        try {
            sql = "delete from sys_user_usergroup_relation where user_group_id=?";
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