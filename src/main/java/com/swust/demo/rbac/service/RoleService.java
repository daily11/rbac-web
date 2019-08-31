package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.Role;
import com.swust.demo.rbac.biz.RoleBiz;
import com.swust.demo.rbac.param.RoleParam;

import java.util.List;

/**
 * 功能描述：对外提供的角色服务类
 */
public class RoleService {
    //角色业务逻辑操作类
    RoleBiz roleBiz = new RoleBiz();

    /**
     * 保存角色记录
     *
     * @param param 客户端上传的角色记录
     */
    public void saveRole(RoleParam param) {
        roleBiz.save(param);
    }

    /**
     * 删除角色记录
     *
     * @param roleId 角色id
     */
    public void deleteRole(int roleId) {
        roleBiz.delete(roleId);
    }

    /**
     * 删除角色记录
     *
     * @param roleName 角色名
     */
    public void deleteRoleByName(String roleName) {
        roleBiz.deleteRoleByName(roleName);
    }

    /**
     * 查询所有的角色
     *
     * @return List<Role>
     */
    public List<Role> findAllRole() {
        return roleBiz.findAllRole();
    }

    /**
     * 查询角色记录
     *
     * @param roleid 角色id
     * @return Role
     */
    public Role findRoleById(int roleid) {
        return roleBiz.findRoleById(roleid);
    }

    /**
     * 更新角色记录
     *
     * @param role 更新后的角色记录
     */
    public void updateRole(Role role) {
        roleBiz.update(role);
    }
}
