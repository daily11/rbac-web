package com.swust.demo.rbac.dao;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.UsergroupInfo;
import com.swust.demo.rbac.bean.UsergroupInfo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：用户组 数据持久化操作类
 */
public class UsergroupInfoDao extends BaseMySql {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = null;

    /**
     * 保存“用户组”记录
     *
     * @param obj 用户组对象
     */
    @Override
    public void save(Object obj) {
        UsergroupInfo usergroupInfo = (UsergroupInfo) obj;
        try {
            sql = "insert into sys_usergroup_info(group_name,description,group_key,parent_id,group_path,group_type,gmt_create,gmt_modified)"
                    + " values (?,?,?,?,?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usergroupInfo.getGroupName());
            ps.setString(2, usergroupInfo.getDescription());
            ps.setString(3, usergroupInfo.getGroupKey());
            ps.setLong(4, usergroupInfo.getParentId());
            ps.setString(5, usergroupInfo.getGroupPath());
            ps.setInt(6, usergroupInfo.getGroupType());
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
     * 查询用户组记录
     *
     * @return
     */
    @Override
    public List<UsergroupInfo> select() {
        List<UsergroupInfo> list = new ArrayList<>();
        try {
            sql = "select * from sys_usergroup_info";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UsergroupInfo usergroupInfo = UsergroupInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .groupName(rs.getString(4))
                        .description(rs.getString(5))
                        .groupKey(rs.getString(6))
                        .parentId(rs.getLong(7))
                        .groupPath(rs.getString(8))
                        .groupType(rs.getInt(9))
                        .build();
                list.add(usergroupInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 查询用户组记录
     *
     * @param id 记录id
     * @return
     */
    @Override
    public UsergroupInfo selectById(Long id) {
        UsergroupInfo usergroupInfo = null;
        try {
            sql = "select * from sys_usergroup_info where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                usergroupInfo = UsergroupInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .groupName(rs.getString(4))
                        .description(rs.getString(5))
                        .groupKey(rs.getString(6))
                        .parentId(rs.getLong(7))
                        .groupPath(rs.getString(8))
                        .groupType(rs.getInt(9))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return usergroupInfo;
    }

    /**
     * 查询用户组记录
     *
     * @param groupName 用户组名称
     * @return
     */
    public UsergroupInfo selectByName(String groupName) {
        UsergroupInfo usergroupInfo = null;
        try {
            sql = "select * from sys_usergroup_info where group_name=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, groupName);
            rs = ps.executeQuery();
            if (rs.next()) {
                usergroupInfo = UsergroupInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .groupName(rs.getString(4))
                        .description(rs.getString(5))
                        .groupKey(rs.getString(6))
                        .parentId(rs.getLong(7))
                        .groupPath(rs.getString(8))
                        .groupType(rs.getInt(9))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return usergroupInfo;
    }

    /**
     * 更新用户组记录
     *
     * @param obj 用户组对象
     */
    @Override
    public void update(Object obj) {
        UsergroupInfo usergroupInfo = (UsergroupInfo) obj;
        try {
            sql = "update sys_usergroup_info set group_name=?,description=?,group_key=?,parent_id=?,group_path=?,group_type=?,gmt_modified=? where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usergroupInfo.getGroupName());
            ps.setString(2, usergroupInfo.getDescription());
            ps.setString(3, usergroupInfo.getGroupKey());
            ps.setLong(4, usergroupInfo.getParentId());
            ps.setString(5, usergroupInfo.getGroupPath());
            ps.setInt(6, usergroupInfo.getGroupType());
//            ps.setTimestamp(7, usergroupInfo.getGmtCreate());
            ps.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
            ps.setLong(8, usergroupInfo.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 删除用户组记录
     *
     * @param id 用户组对象ID
     */
    @Override
    public void delete(Long id) {
        try {
            sql = "delete from sys_usergroup_info where id=?";
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
