package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.UserRole;
import com.swust.demo.rbac.biz.UserRoleBiz;
import com.swust.demo.rbac.param.UserRoleParam;

import java.util.List;

/**
 * 功能描述：对外提供的用户角色服务类
 */
public class UserRoleService {
    //用户角色业务逻辑操作类
    UserRoleBiz userRoleBiz = new UserRoleBiz();

    /**
     * 保存用户角色记录
     *
     * @param param 客户端上传的用户角色记录
     */
    public void saveUserRole(UserRoleParam param) {
        userRoleBiz.save(param);
    }

    /**
     * 删除用户角色记录
     *
     * @param userRoleId 用户角色id
     */
    public void deleteUserRole(int userRoleId) {
        userRoleBiz.delete(userRoleId);
    }

    /**
     * 删除用户角色记录
     *
     * @param userid 用户id
     */
    public void deleteByUserid(int userid) {
        userRoleBiz.deleteByUserid(userid);
    }

    /**
     * 删除用户角色记录
     *
     * @param roleId 角色id
     */
    public void deleteByRoleid(int roleId) {
        userRoleBiz.deleteByRoleid(roleId);
    }

    /**
     * 查询所有的用户角色
     */
    public List<UserRole> findUserRole() {
        return userRoleBiz.findAllUserRole();
    }

    /**
     * 查询用户角色
     *
     * @param userRoleId 用户角色id
     */
    public UserRole findUserRoleById(int userRoleId) {
        return userRoleBiz.findUserRoleById(userRoleId);
    }

    /**
     * 更新用户角色记录
     *
     * @param userRole 更新后的用户角色记录
     */
    public void updateUserRole(UserRole userRole) {
        userRoleBiz.update(userRole);
    }

    /**
     * 绑定用户角色
     *
     * @param roleId
     * @param userIdList
     * @param operator
     */
    public void bindUserRole(int roleId, int[] userIdList, String operator) {
        userRoleBiz.bindUserRole(roleId, userIdList, operator);
    }
}
