package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.*;
import com.swust.demo.rbac.dao.*;
import com.swust.demo.rbac.util.ParamException;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：用户信息 业务逻辑操作类
 */
public class UserInfoBiz {
    //用户信息数据持久化操作类
    UserInfoDao userInfoDao = new UserInfoDao();
    //用户-用户组 信息数据持久化操作类
    UserUsergroupRelationDao userUsergroupRelationDao = new UserUsergroupRelationDao();
    //用户组 数据持久化操作类
    UsergroupInfoDao usergroupInfoDao = new UsergroupInfoDao();
    //角色 数据持久化操作类
    RoleInfoDao roleInfoDao = new RoleInfoDao();
    //用户组-角色 数据持久化操作类
    UsergroupRoleRelationDao usergroupRoleRelationDao = new UsergroupRoleRelationDao();

    UsergroupInfoBiz usergroupInfoBiz = new UsergroupInfoBiz();
    RoleInfoBiz roleInfoBiz = new RoleInfoBiz();

    /**
     * 保存“用户”记录
     *
     * @param userInfo 用户对象
     */
    public void save(UserInfo userInfo) {
        if (checkExist(userInfo.getUserName())) {
            throw new ParamException("用户名称已经存在");
        }
        //新增用户
        userInfoDao.save(userInfo);
        //新增私有用户组【用户组名就是用户名】
        UsergroupInfo usergroupInfo = UsergroupInfo.builder()
                .gmtCreate(new Timestamp(System.currentTimeMillis()))
                .gmtModified(new Timestamp(System.currentTimeMillis()))
                .groupName(userInfo.getUserName())
                .description(userInfo.getUserName() + "私有用户组")
                .groupKey("")
                .parentId((long) 1)
                .groupPath("")
                .groupType(1)
                .build();
        usergroupInfoDao.save(usergroupInfo);
        //新增私有角色【角色名就是用户名】
        RoleInfo roleInfo = RoleInfo.builder()
                .name(userInfo.getUserName())
                .type(1)
                .status(1)
                .remark(userInfo.getUserName() + "私有用户角色")
                .build();
        roleInfoDao.save(roleInfo);
        //新增用户-用户组关联记录
        usergroupInfo = usergroupInfoDao.selectByName(userInfo.getUserName());
        userInfo = userInfoDao.selectByName(userInfo.getUserName());
        UserUsergroupRelation userUsergroupRelation = UserUsergroupRelation.builder()
                .userGroupId(usergroupInfo.getId())
                .userId(userInfo.getId())
                .gmtCreate(new Timestamp(System.currentTimeMillis()))
                .gmtModified(new Timestamp(System.currentTimeMillis()))
                .build();
        userUsergroupRelationDao.save(userUsergroupRelation);
        //新增用户组-角色关联记录
        roleInfo = roleInfoDao.selectByName(userInfo.getUserName());
        UsergroupRoleRelation usergroupRoleRelation = UsergroupRoleRelation.builder()
                .userGroupId(usergroupInfo.getId())
                .roleId(roleInfo.getId())
                .gmtCreate(new Timestamp(System.currentTimeMillis()))
                .gmtModified(new Timestamp(System.currentTimeMillis()))
                .build();
        usergroupRoleRelationDao.save(usergroupRoleRelation);
    }

    /**
     * 检查用户是否存在
     *
     * @param userName 用户名称
     * @return
     */
    private boolean checkExist(String userName) {
        UserInfo userInfo = userInfoDao.selectByName(userName);
        return userInfo != null;
    }

    /**
     * 查询用户记录
     *
     * @return
     */
    public List<UserInfo> select() {
        return userInfoDao.select();
    }

    /**
     * 查询用户记录
     *
     * @param id 记录id
     * @return
     */
    public UserInfo selectById(Long id) {
        return userInfoDao.selectById(id);
    }

    /**
     * 更新用户记录
     *
     * @param obj 权限对象
     */
    public void update(Object obj) {
        UserInfo userInfo = (UserInfo) obj;
        UserInfo userInfoDB = userInfoDao.selectById(userInfo.getId());
        if (userInfoDB != null) {
            //如果用户名也跟新了，那么需要级联更新：用户组、角色表
            if (!userInfoDB.getUserName().equals(userInfo.getUserName())) {
                //更新用户组名
                UsergroupInfo usergroupInfo = usergroupInfoDao.selectByName(userInfoDB.getUserName());
                if (usergroupInfo != null) {
                    usergroupInfo.setGroupName(userInfo.getUserName());
                    usergroupInfo.setDescription(userInfo.getUserName() + "私有用户组");
                    usergroupInfoDao.update(usergroupInfo);
                }
                //更新角色名
                RoleInfo roleInfo = roleInfoDao.selectByName(userInfoDB.getUserName());
                if (roleInfo != null) {
                    roleInfo.setName(userInfo.getUserName());
                    roleInfo.setRemark(userInfo.getUserName() + "私有用户角色");
                    roleInfoDao.update(roleInfo);
                }
            }
            //更新用户记录
            userInfoDao.update(obj);
        }
    }

    /**
     * 删除用户记录
     *
     * @param id 用户对象ID
     */
    public void delete(Long id) {

        UserInfo userInfo = userInfoDao.selectById(id);
        String name = userInfo.getUserName();//用户名，也是私有用户组名，也是私有角色名

        //1 删除用户记录
        userInfoDao.delete(id);

        //2 删除私有用户组
        UsergroupInfo usergroupInfo = usergroupInfoDao.selectByName(name);
        usergroupInfoBiz.delete(usergroupInfo.getId());

        //2 删除私有角色记录
        RoleInfo roleInfo = roleInfoDao.selectByName(name);
        roleInfoBiz.delete(roleInfo.getId());
    }

    /**
     * 查询当前用户的权限
     *
     * @param userId 用户id
     * @return List<AclInfo>
     */
    public List<AclInfo> selectUserAcls(Long userId) {
        return userInfoDao.selectUserAcls(userId);
    }

    /**
     * 查询系统预定义给用户对应角色的权限
     *
     * @param userId 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    public List<AclInfo> selectUserAclsBySystem(int userId, String name) {
        return userInfoDao.selectUserAclsBySystem(userId, name);
    }

    /**
     * 查询用户自己的，非系统预定义的权限
     *
     * @param userId 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    public List<AclInfo> selectUserAclsBySingle(int userId, String name) {
        return userInfoDao.selectUserAclsBySingle(userId, name);
    }
}
