package com.swust.demo.rbac.service.impl;

import afu.org.checkerframework.checker.oigj.qual.O;
import com.swust.demo.rbac.bean.AclInfo;
import com.swust.demo.rbac.bean.UserInfo;
import com.swust.demo.rbac.biz.UserInfoBiz;
import com.swust.demo.rbac.service.UserInfoService;

import java.util.List;

public class UserInfoServiceImpl implements UserInfoService {

    UserInfoBiz userInfoBiz = new UserInfoBiz();

    /**
     * 保存“用户”记录
     *
     * @param userInfo 用户对象
     */
    @Override
    public void save(UserInfo userInfo) {
        userInfoBiz.save(userInfo);
    }

    /**
     * 查询用户记录
     *
     * @return
     */
    @Override
    public List<UserInfo> select() {
        return userInfoBiz.select();
    }

    /**
     * 查询用户记录
     *
     * @param id 记录id
     * @return
     */
    @Override
    public UserInfo selectById(Long id) {
        return userInfoBiz.selectById(id);
    }

    /**
     * 更新用户记录
     *
     * @param obj 权限对象
     */
    @Override
    public void update(Object obj) {
        userInfoBiz.update(obj);
    }

    /**
     * 删除用户记录
     *
     * @param id 权限对象ID
     */
    @Override
    public void delete(Long id) {
        userInfoBiz.delete(id);
    }

    /**
     * 查询当前用户的权限
     *
     * @param userId 用户id
     * @return List<AclInfo>
     */
    public List<AclInfo> selectUserAcls(Long userId) {
        return userInfoBiz.selectUserAcls(userId);
    }

    /**
     * 查询系统预定义给用户对应角色的权限
     *
     * @param userId 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    public List<AclInfo> selectUserAclsBySystem(int userId, String name) {
        return userInfoBiz.selectUserAclsBySystem(userId, name);
    }

    /**
     * 查询用户自己的，非系统预定义的权限
     *
     * @param userId 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    public List<AclInfo> selectUserAclsBySingle(int userId, String name) {
        return userInfoBiz.selectUserAclsBySingle(userId, name);
    }
}
