package com.swust.demo.rbac.tree;

import com.swust.demo.rbac.biz.RoleAclRelationBiz;
import com.swust.demo.rbac.dto.AclModuleLevelDto;
import com.swust.demo.rbac.param.RoleAclViewParam;

import java.util.List;

/**
 * 获取权限模块层级树
 *
 * @author chen
 */
public class AclModuleRoleTree {
    //权限模块层级树相关
    AclModuleTree aclModuleTreeBiz = new AclModuleTree();
    //角色权限逻辑操作相关
    RoleAclRelationBiz roleAclBiz = new RoleAclRelationBiz();

    /**
     * 查询角色权限模块层级树
     *
     * @param rolename
     * @return
     */
    public List<AclModuleLevelDto> aclModuleTree(String rolename) {
        //1 查询角色对应的权限
        List<RoleAclViewParam> roleAclList = selectRoleAclViewParam(rolename);
        //2 查询权限层级树
        List<AclModuleLevelDto> aclModuleTree = aclModuleTreeBiz.aclModuleTree();
        //3 遍历角色对应的权限，再遍历权限层级树，找到角色权限在权限层级树中的位置，设置gouXuan属性为true
        for (int i = 0; i < roleAclList.size(); i++) {
            //3.1 获取角色对应的当个权限
            RoleAclViewParam roleAclViewParam = roleAclList.get(i);
            //3.2 遍历权限层级树
            for (int j = 0; j < aclModuleTree.size(); j++) {
                AclModuleLevelDto aclModuleLevelDto = aclModuleTree.get(j);
                //3.2.1 循环遍历子权限模块，找到权限名字跟角色权限名字一样的，修改gouXuan属性为true
                findGouXuan(aclModuleLevelDto, roleAclViewParam.getAclName());
            }
        }
        return aclModuleTree;
    }

    /**
     * 循环遍历子权限模块，找到权限名字跟角色权限名字一样的，修改gouXuan属性为true
     *
     * @param aclModuleLevelDto
     */
    public void findGouXuan(AclModuleLevelDto aclModuleLevelDto, String aclName) {
        if (aclModuleLevelDto.getName().equals(aclName)) {
            aclModuleLevelDto.setGouXuan(true);
        } else {
            List<AclModuleLevelDto> list = aclModuleLevelDto.getAclModuleList();
            for (int i = 0; i < list.size(); i++) {
                findGouXuan(list.get(i), aclName);
            }
        }
    }

    /**
     * 查询角色对应的权限
     *
     * @param rolename
     * @return
     */
    public List<RoleAclViewParam> selectRoleAclViewParam(String rolename) {
        return roleAclBiz.selectRoleAclViewParam(rolename);
    }
}
