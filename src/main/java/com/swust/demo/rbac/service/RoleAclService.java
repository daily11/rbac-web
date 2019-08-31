package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.RoleAcl;
import com.swust.demo.rbac.biz.RoleAclBiz;
import com.swust.demo.rbac.param.RoleAclParam;
import com.swust.demo.rbac.param.RoleAclViewParam;
import com.swust.demo.rbac.tree.AclModuleRoleTree;

import java.util.List;

/**
 * 功能描述：对外提供的角色权限服务类
 */
public class RoleAclService {
    //角色权限业务逻辑操作类
    RoleAclBiz roleAclBiz = new RoleAclBiz();
    //角色权限相关
    AclModuleRoleTree aclModuleRoleTree = new AclModuleRoleTree();

    /**
     * 查询角色对应的权限
     * @param roleName
     * @return
     */
    public List<RoleAclViewParam> fidRoleAclByRolename(String roleName){
        return aclModuleRoleTree.findAllRoleAcl(roleName);
    }

    /**
     * 添加角色权限记录
     *
     * @param param 客户端上传的角色权限记录
     */
    public void saveRoleAcl(RoleAclParam param) {
        roleAclBiz.save(param);
    }

    /**
     * 删除角色权限记录
     *
     * @param roleAclId 角色权限id
     */
    public void deleteRoleAcl(int roleAclId) {
        roleAclBiz.delete(roleAclId);
    }

    /**
     * 查询所有的角色权限
     */
    public List<RoleAcl> findAllRoleAcl() {
        return roleAclBiz.findAllRoleAcl();
    }

    /**
     * 查询角色权限
     *
     * @param roleAclId 角色权限id
     */
    public RoleAcl findRoleAclById(int roleAclId) {
        return roleAclBiz.findRoleAclById(roleAclId);
    }

    /**
     * 更新角色权限记录
     *
     * @param roleAcl 已更新好的角色权限记录
     */
    public void updateRoleAcl(RoleAcl roleAcl) {
        roleAclBiz.update(roleAcl);
    }
}
