package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.AclInfo;
import com.swust.demo.rbac.bean.UserInfo;

import java.util.List;

public interface UserInfoService {

    /**
     * 保存“用户”记录
     *
     * @param userInfo 用户对象
     */
    public void save(UserInfo userInfo);

    /**
     * 查询用户记录
     *
     * @return
     */
    public List<UserInfo> select();

    /**
     * 查询用户记录
     *
     * @param id 记录id
     * @return
     */
    public UserInfo selectById(Long id);

    /**
     * 更新用户记录
     *
     * @param obj 权限对象
     */
    public void update(Object obj);

    /**
     * 删除用户记录
     *
     * @param id 权限对象ID
     */
    public void delete(Long id);

    /**
     * 查询当前用户的权限
     *
     * @param userId 用户id
     * @return List<AclInfo>
     */
    public List<AclInfo> selectUserAcls(Long userId);

    /**
     * 查询系统预定义给用户对应角色的权限
     *
     * @param userId 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    public List<AclInfo> selectUserAclsBySystem(int userId, String name);

    /**
     * 查询用户自己的，非系统预定义的权限
     *
     * @param userId 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    public List<AclInfo> selectUserAclsBySingle(int userId, String name);
}
