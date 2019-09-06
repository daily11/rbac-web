package com.swust.demo.rbac.dao;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.AclInfo;
import com.swust.demo.rbac.bean.UserInfo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：用户信息 数据持久化操作类
 */
public class UserInfoDao extends BaseMySql {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = null;

    /**
     * 保存“用户”记录
     *
     * @param obj 用户对象
     */
    @Override
    public void save(Object obj) {
        UserInfo userInfo = (UserInfo) obj;
        try {
            sql = "insert into user_info(user_name,password,user_type,description,account_state,gmt_create,gmt_modified)"
                    + " values (?,?,?,?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userInfo.getUserName());
            ps.setString(2, userInfo.getPassword());
            ps.setInt(3, userInfo.getUserType());
            ps.setString(4, userInfo.getDescription());
            ps.setInt(5, userInfo.getAccountState());
            ps.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
            ps.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 查询用户记录
     *
     * @return
     */
    @Override
    public List<UserInfo> select() {
        List<UserInfo> list = new ArrayList<>();
        try {
            sql = "select * from user_info";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserInfo userInfo = UserInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .userName((rs.getString(4)))
                        .password(rs.getString(5))
                        .userType(rs.getInt(6))
                        .description(rs.getString(7))
                        .accountState(rs.getInt(8))
                        .build();
                list.add(userInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 查询用户记录
     *
     * @param id 记录id
     * @return
     */
    @Override
    public UserInfo selectById(Long id) {
        UserInfo userInfo = null;
        try {
            sql = "select * from user_info where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                userInfo = UserInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .userName((rs.getString(4)))
                        .password(rs.getString(5))
                        .userType(rs.getInt(6))
                        .description(rs.getString(7))
                        .accountState(rs.getInt(8))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return userInfo;
    }

    /**
     * 查询用户记录
     *
     * @param userName 用户名称
     * @return
     */
    public UserInfo selectByName(String userName) {
        UserInfo userInfo = null;
        try {
            sql = "select * from user_info where user_name=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            if (rs.next()) {
                userInfo = UserInfo.builder()
                        .id(rs.getLong(1))
                        .gmtCreate(rs.getTimestamp(2))
                        .gmtModified(rs.getTimestamp(3))
                        .userName((rs.getString(4)))
                        .password(rs.getString(5))
                        .userType(rs.getInt(6))
                        .description(rs.getString(7))
                        .accountState(rs.getInt(8))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return userInfo;
    }

    /**
     * 查询当前用户的权限
     *
     * @param userId 用户id
     * @return List<AclInfo>
     */
    public List<AclInfo> selectUserAcls(Long userId) {
        List<AclInfo> list = new ArrayList<>();
        try {
            sql = "select acl.id, acl.code,acl.name as aclName,acl.acl_module_id,acl.url,acl.type,acl.status,acl.seq,acl.remark,acl.gmt_create,acl.gmt_modified,user_info.user_name as userName,role.name as roleName\n" +
                    "from\n" +
                    "sys_acl_info as acl join sys_role_acl_relation on sys_role_acl_relation.acl_id=acl.id\n" +
                    "join sys_role_info as role on role.id=sys_role_acl_relation.role_id\n" +
                    "join sys_usergroup_role_relation on sys_usergroup_role_relation.role_id=role.id\n" +
                    "join sys_usergroup_info on sys_usergroup_info.id = sys_usergroup_role_relation.user_group_id\n" +
                    "join sys_user_usergroup_relation on sys_user_usergroup_relation.user_group_id = sys_usergroup_info.id\n" +
                    "join user_info on user_info.id = sys_user_usergroup_relation.user_id\n" +
                    "where user_info.id=?  ";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                AclInfo acl = AclInfo.builder()
                        .id(rs.getLong(1))
                        .code(rs.getString(2))
                        .name(rs.getString(3))
                        .aclModuleId(rs.getLong(4))
                        .url(rs.getString(5))
                        .type(rs.getInt(6))
                        .status(rs.getInt(7))
                        .seq(rs.getInt(8))
                        .remark(rs.getString(9))
                        .gmtCreate(rs.getTimestamp(10))
                        .gmtModified(rs.getTimestamp(11))
                        .build();
                list.add(acl);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 查询系统预定义给用户对应角色的权限
     *
     * @param userId 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    public List<AclInfo> selectUserAclsBySystem(int userId, String name) {
        List<AclInfo> list = new ArrayList<>();
        try {
//            sql = "select * from view_user_acl where userid=? and rolename!=?";
            sql = "select acl.id, acl.code,acl.name as aclName,acl.acl_module_id,acl.url,acl.type,acl.status,acl.seq,acl.remark,acl.gmt_create,acl.gmt_modified,user_info.user_name as userName,role.name as roleName\n" +
                    "from\n" +
                    "sys_acl_info as acl join sys_role_acl_relation on sys_role_acl_relation.acl_id=acl.id\n" +
                    "join sys_role_info as role on role.id=sys_role_acl_relation.role_id\n" +
                    "join sys_usergroup_role_relation on sys_usergroup_role_relation.role_id=role.id\n" +
                    "join sys_usergroup_info on sys_usergroup_info.id = sys_usergroup_role_relation.user_group_id\n" +
                    "join sys_user_usergroup_relation on sys_user_usergroup_relation.user_group_id = sys_usergroup_info.id\n" +
                    "join user_info on user_info.id = sys_user_usergroup_relation.user_id\n" +
                    "where user_info.id=? and role.name != ?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                AclInfo acl = AclInfo.builder()
                        .id(rs.getLong(1))
                        .code(rs.getString(2))
                        .name(rs.getString(3))
                        .aclModuleId(rs.getLong(4))
                        .url(rs.getString(5))
                        .type(rs.getInt(6))
                        .status(rs.getInt(7))
                        .seq(rs.getInt(8))
                        .remark(rs.getString(9))
                        .gmtCreate(rs.getTimestamp(10))
                        .gmtModified(rs.getTimestamp(11))
                        .build();
                list.add(acl);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 查询用户自己的，非系统预定义的权限
     *
     * @param userId 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    public List<AclInfo> selectUserAclsBySingle(int userId, String name) {
        List<AclInfo> list = new ArrayList<>();
        try {
//            sql = "select * from view_user_acl where userid=? and rolename=?";
            sql = "select acl.id, acl.code,acl.name as aclName,acl.acl_module_id,acl.url,acl.type,acl.status,acl.seq,acl.remark,acl.gmt_create,acl.gmt_modified,user_info.user_name as userName,role.name as roleName\n" +
                    "from\n" +
                    "sys_acl_info as acl join sys_role_acl_relation on sys_role_acl_relation.acl_id=acl.id\n" +
                    "join sys_role_info as role on role.id=sys_role_acl_relation.role_id\n" +
                    "join sys_usergroup_role_relation on sys_usergroup_role_relation.role_id=role.id\n" +
                    "join sys_usergroup_info on sys_usergroup_info.id = sys_usergroup_role_relation.user_group_id\n" +
                    "join sys_user_usergroup_relation on sys_user_usergroup_relation.user_group_id = sys_usergroup_info.id\n" +
                    "join user_info on user_info.id = sys_user_usergroup_relation.user_id\n" +
                    "where user_info.id=? and role.name = ?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                AclInfo acl = AclInfo.builder()
                        .id(rs.getLong(1))
                        .code(rs.getString(2))
                        .name(rs.getString(3))
                        .aclModuleId(rs.getLong(4))
                        .url(rs.getString(5))
                        .type(rs.getInt(6))
                        .status(rs.getInt(7))
                        .seq(rs.getInt(8))
                        .remark(rs.getString(9))
                        .gmtCreate(rs.getTimestamp(10))
                        .gmtModified(rs.getTimestamp(11))
                        .build();
                list.add(acl);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 更新用户记录
     *
     * @param obj 权限对象
     */
    @Override
    public void update(Object obj) {
        UserInfo userInfo = (UserInfo) obj;
        try {
            sql = "update user_info set user_name=?,password=?,user_type=?,description=?,account_state=?,gmt_modified=? where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userInfo.getUserName());
            ps.setString(2, userInfo.getPassword());
            ps.setInt(3, userInfo.getUserType());
            ps.setString(4, userInfo.getDescription());
            ps.setInt(5, userInfo.getAccountState());
//            ps.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
            ps.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
            ps.setLong(7, userInfo.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 删除用户记录
     *
     * @param id 权限对象ID
     */
    @Override
    public void delete(Long id) {
        try {
            sql = "delete from user_info where id=?";
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
