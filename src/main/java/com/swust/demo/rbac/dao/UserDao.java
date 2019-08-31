package com.swust.demo.rbac.dao;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.Acl;
import com.swust.demo.rbac.bean.User;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：用户数据持久化操作类
 */
public class UserDao extends BaseMySql {

    /**
     * 保存用户信息
     *
     * @param obj 用户
     */
    @Override
    public void save(Object obj) {
        User user = (User) obj;
        try {
            sql = "insert into user_info(gmt_create,gmt_modified,user_name,password,user_type,description,account_state)"
                    + " values (?,?,?,?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setTimestamp(1, user.getGmt_create());
            ps.setTimestamp(2, user.getGmt_modified());
            ps.setString(3, user.getUser_name());
            ps.setString(4, user.getPassword());
            ps.setInt(5, user.getUser_type());
            ps.setString(6, user.getDescription());
            ps.setInt(7, user.getAccount_state());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 查询当前用户的权限
     *
     * @param userid 用户id
     * @return List<Acl>
     */
    public List<Acl> findUserAcls(int userid) {
        List<Acl> list = new ArrayList<>();
        try {
//            sql = "select * from view_user_acl where userid=?";
            sql = "select sys_acl.id as id,sys_acl.code as code,sys_acl.name as name,sys_acl.acl_module_id as acl_module_id,sys_acl.url as url,sys_acl.type as type,sys_acl.status as status,sys_acl.seq as seq,sys_acl.remark as remark,sys_acl.operator as operator,sys_acl.operate_time as operate_time,sys_acl.operate_ip as operate_ip,user_info.id as userid,sys_role.name as rolename from ((((user_info join sys_role_user on (user_info.id=sys_role_user.user_id)) join sys_role on (sys_role.id=sys_role_user.role_id)) join sys_role_acl on (sys_role_acl.role_id=sys_role.id)) join sys_acl on (sys_acl.id=sys_role_acl.acl_id))  where user_info.id=? and sys_role.name=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Acl acl = Acl.builder()
                        .id(rs.getInt(1)).code(rs.getString(2))
                        .name(rs.getString(3)).aclModuleId(rs.getInt(4))
                        .url(rs.getString(5)).type(rs.getInt(6))
                        .status(rs.getInt(7)).seq(rs.getInt(8))
                        .remark(rs.getString(9)).operator(rs.getString(10))
                        .operate_time(rs.getTimestamp(11)).operate_ip(rs.getString(12))
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
     * @param userid 用户di
     * @param name 用户名称【同时也是角色名称】
     * @return
     */
    public List<Acl> findUserAclsBySystem(int userid,String name) {
        List<Acl> list = new ArrayList<>();
        try {
//            sql = "select * from view_user_acl where userid=? and rolename!=?";
            sql = "select sys_acl.id as id,sys_acl.code as code,sys_acl.name as name,sys_acl.acl_module_id as acl_module_id,sys_acl.url as url,sys_acl.type as type,sys_acl.status as status,sys_acl.seq as seq,sys_acl.remark as remark,sys_acl.operator as operator,sys_acl.operate_time as operate_time,sys_acl.operate_ip as operate_ip,user_info.id as userid,sys_role.name as rolename from ((((user_info join sys_role_user on (user_info.id=sys_role_user.user_id)) join sys_role on (sys_role.id=sys_role_user.role_id)) join sys_role_acl on (sys_role_acl.role_id=sys_role.id)) join sys_acl on (sys_acl.id=sys_role_acl.acl_id))  where user_info.id=? and sys_role.name!=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setString(2,name);
            rs = ps.executeQuery();
            while (rs.next()) {
                Acl acl = Acl.builder()
                        .id(rs.getInt(1)).code(rs.getString(2))
                        .name(rs.getString(3)).aclModuleId(rs.getInt(4))
                        .url(rs.getString(5)).type(rs.getInt(6))
                        .status(rs.getInt(7)).seq(rs.getInt(8))
                        .remark(rs.getString(9)).operator(rs.getString(10))
                        .operate_time(rs.getTimestamp(11)).operate_ip(rs.getString(12))
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
     * @param userid 用户di
     * @param name 用户名称【同时也是角色名称】
     * @return
     */
    public List<Acl> findUserAclsBySingle(int userid,String name) {
        List<Acl> list = new ArrayList<>();
        try {
//            sql = "select * from view_user_acl where userid=? and rolename=?";
            sql = "select sys_acl.id as id,sys_acl.code as code,sys_acl.name as name,sys_acl.acl_module_id as acl_module_id,sys_acl.url as url,sys_acl.type as type,sys_acl.status as status,sys_acl.seq as seq,sys_acl.remark as remark,sys_acl.operator as operator,sys_acl.operate_time as operate_time,sys_acl.operate_ip as operate_ip,user_info.id as userid,sys_role.name as rolename from ((((user_info join sys_role_user on (user_info.id=sys_role_user.user_id)) join sys_role on (sys_role.id=sys_role_user.role_id)) join sys_role_acl on (sys_role_acl.role_id=sys_role.id)) join sys_acl on (sys_acl.id=sys_role_acl.acl_id))  where user_info.id=? and sys_role.name=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setString(2,name);
            rs = ps.executeQuery();
            while (rs.next()) {
                Acl acl = Acl.builder()
                        .id(rs.getInt(1)).code(rs.getString(2))
                        .name(rs.getString(3)).aclModuleId(rs.getInt(4))
                        .url(rs.getString(5)).type(rs.getInt(6))
                        .status(rs.getInt(7)).seq(rs.getInt(8))
                        .remark(rs.getString(9)).operator(rs.getString(10))
                        .operate_time(rs.getTimestamp(11)).operate_ip(rs.getString(12))
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
     * 查询所有用户信息
     *
     * @return List<User>
     */
    @Override
    public List<User> find() {
        List<User> list = new ArrayList<>();
        try {
            sql = "select * from user_info";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = User.builder().id(rs.getInt(1)).gmt_create(rs.getTimestamp(2)).gmt_modified(rs.getTimestamp(3))
                        .user_name(rs.getString(4)).password(rs.getString(5)).user_type(rs.getInt(6))
                        .description(rs.getString(7)).account_state(rs.getInt(8))
                        .build();
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 查询单个用户信息
     *
     * @param id 用户id
     * @return User
     */
    @Override
    public User findById(int id) {
        User user = null;
        try {
            sql = "select * from user_info where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                user = User.builder().id(rs.getInt(1)).gmt_create(rs.getTimestamp(2)).gmt_modified(rs.getTimestamp(3))
                        .user_name(rs.getString(4)).password(rs.getString(5)).user_type(rs.getInt(6))
                        .description(rs.getString(7)).account_state(rs.getInt(8))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return user;
    }


    /**
     * 删除用户信息
     *
     * @param userId 用户id
     */
    @Override
    public void delete(int userId) {
        try {
            sql = "delete from user_info where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 更新用户信息
     *
     * @param obj 用户记录
     */
    @Override
    public void update(Object obj) {
        User user = (User) obj;
        try {
            sql = "update user_info set gmt_create=?,gmt_modified=?,user_name=?,password=?,user_type=?,description=?,"
                    + "account_state=? where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setTimestamp(1, user.getGmt_create());
            ps.setTimestamp(2, user.getGmt_modified());
            ps.setString(3, user.getUser_name());
            ps.setString(4, user.getPassword());
            ps.setInt(5, user.getUser_type());
            ps.setString(6, user.getDescription());
            ps.setInt(7, user.getAccount_state());
            ps.setInt(8,user.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }


}
