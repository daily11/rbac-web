package com.swust.demo.rbac.tree;

import com.google.gson.Gson;
import com.swust.demo.rbac.bean.Acl;
import com.swust.demo.rbac.biz.UserBiz;
import com.swust.demo.rbac.dto.AclDto;
import com.swust.demo.rbac.dto.AclModuleLevelDto;

import java.util.List;

/**
 * 功能描述：获取用户权限模块层级树
 */
public class UserAclModuleTree {

    //用户业务逻辑操作类
    UserBiz userBiz = new UserBiz();
    //权限模块层级树业务逻辑操作类
    AclModuleTree aclModuleTreeBiz = new AclModuleTree();

//	public static void main(String[] args){
//		UserAclModuleTree tree = new UserAclModuleTree();
//		List<AclModuleLevelDto> list =  tree.aclModuleTree(4);
//		Gson gson = new Gson();
//		Log.sop(gson.toJson(list));
//	}

    /**
     * 1 获取用户的权限层级树
     *
     * @param userid 用户id
     */
    public List<AclModuleLevelDto> aclModuleTree(int userid) {
        Gson gson = new Gson();

        //1.1 获取权限模块层级树
        List<AclModuleLevelDto> rootList = aclModuleTreeBiz.aclModuleTree();

        //1.2 查询用户userid对应的所有权限点集合
        List<Acl> aclList = userBiz.findUserAcls(userid);

        if (aclList.size() == 0) {
            return null;
        }

        //1.3 遍历用户权限点，将拥有用户权限点的权限模块层级树中对应的权限点属性hasAcl标记为true，
        // 这样客户端可以根据这个属性判断权限层级树中，用户是否拥有该权限点的属性
        for (int i = 0; i < aclList.size(); i++) {
            int aclId = aclList.get(i).getId();
            //遍历权限模块层级树，找到用户的权限点，并将属性hasAcl标记为true【默认false】
            for (int j = 0; j < rootList.size(); j++) {
                AclModuleLevelDto aclModule = rootList.get(j);
                find(aclModule, aclId);
            }
        }

        return rootList;
    }

    /**
     * 递归更新权限模块层级树中的权限点的属性hasAcl，一旦权限点的id与用户的权限的id同，则设置为true
     *
     * @param aclModule 权限模块层级树中的权限模块
     * @param aclId     用户的权限点id
     */
    public void find(AclModuleLevelDto aclModule, int aclId) {
        //获取子权限模块
        List<AclModuleLevelDto> aclModuleList = aclModule.getAclModuleList();
        //获取当前权限模块子权限点集合
        List<AclDto> aclList = aclModule.getAclList();
        //遍历子权限点，找到对应的权限点，将字段hasAcl标记为true，代表用户拥有该权限点
        for (AclDto acl : aclList) {
            if (acl.getId() == aclId) {
                acl.setHasAcl(true);
                return;
            }
        }
        //如果子权限点没有，那么去子权限模块中继续查找
        if (aclModuleList.size() == 0) {
            return;
        } else {
            for (AclModuleLevelDto subAclModule : aclModuleList) {
                find(subAclModule, aclId);
            }
        }
    }


}
