package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.Acl;
import com.swust.demo.rbac.biz.UserBiz;
import com.swust.demo.rbac.dto.AclModuleLevelDto;
import com.swust.demo.rbac.tree.AclModuleRoleTree;
import com.swust.demo.rbac.tree.AclModuleTree;
import com.swust.demo.rbac.tree.UserAclModuleTree;

import java.util.List;

/**
 * 功能描述：对外提供的权限层级树服务类
 * 1 查询权限模块层级树
 * 2 查询用户权限模块层级树
 * 3 查询用户的所有权限
 */
public class TreeService {
    //权限模块层级树相关
    AclModuleTree aclModuleTreeBiz = new AclModuleTree();
    //角色权限模块层级树相关
    AclModuleRoleTree aclModuleRoleTree = new AclModuleRoleTree();
    //用户权限相关
    UserBiz userBiz = new UserBiz();
    //用户权限模块层级树相关
    UserAclModuleTree userAclModuleTree = new UserAclModuleTree();

    /**
     * 获取权限模块层级树
     *
     * @return List<AclModuleLevelDto>
     */
    public List<AclModuleLevelDto> aclModuleTree() {
        return aclModuleTreeBiz.aclModuleTree();
    }

    /**
     * 查询角色权限模块层级树
     *
     * @param rolename
     * @return
     */
    public List<AclModuleLevelDto> aclModuleTreeByRolename(String rolename) {
        return aclModuleRoleTree.aclModuleTree(rolename);
    }

    /**
     * 根据用户id和name获取权限模块层级树
     *
     * @return List<AclModuleLevelDto>
     */
    public List<AclModuleLevelDto> aclModuleTreeByUserIdAndname(int userid, String name) {
        //1.获得全部树结构
        List<AclModuleLevelDto> aclModuleLevelDtoTree = aclModuleTreeBiz.aclModuleTree();
        //2.获得置为灰色的用户权限
        List<Acl> userAclsBySystem = userBiz.findUserAclsBySystem(userid, name);
        //3.获得可以勾选的用户权限
        List<Acl> userAclsBySingle = userBiz.findUserAclsBySingle(userid, name);

        //4.设置权限树某些叶子节点置为灰色
        List<AclModuleLevelDto> res = null;
        if (userAclsBySystem != null && userAclsBySystem.size() > 0) {
            for (Acl ac : userAclsBySystem) {
                int acId = ac.getId();
                String acName = ac.getName();
                res = getAclModuleLevelDtoFromTree(aclModuleLevelDtoTree, acId, acName);
            }
        } else {
            res = aclModuleLevelDtoTree;
        }

        //5.设置权限树某些叶子节点为可选
        List<AclModuleLevelDto> result = null;
        if (userAclsBySingle != null && userAclsBySingle.size() > 0) {
            for (Acl ac : userAclsBySingle) {
                int aId = ac.getId();
                String aName = ac.getName();
                result = getAclModuleLevelDtoFromTree2(res, aId, aName);
            }
        } else {
            result = res;
        }

        return result;
    }

    /**
     * 递归查询权限树结构的叶子节点是否可以置为灰色
     *
     * @param aclModuleLevelDtoTree 权限树结构
     * @param acId                  要置为灰色的叶子节点id
     * @param acName                要置为灰色的叶子节点name
     * @return
     */
    private List<AclModuleLevelDto> getAclModuleLevelDtoFromTree(List<AclModuleLevelDto> aclModuleLevelDtoTree, int acId, String acName) {
        for (AclModuleLevelDto dto : aclModuleLevelDtoTree) {
            if (dto.getAclModuleList() != null && dto.getAclModuleList().size() > 0) {
                getAclModuleLevelDtoFromTree(dto.getAclModuleList(), acId, acName);
            } else {
                int dtoId = dto.getId();
                String dtoName = dto.getName();
                if (dtoId == acId && dtoName.equals(acName)) {
                    dto.setZhiHui(true);
                }
            }
        }
        return aclModuleLevelDtoTree;
    }

    /**
     * 递归查询权限树结构的叶子节点是否可以选择
     *
     * @param res   权限树结构
     * @param aId   要置为可选的叶子节点id
     * @param aName 要置为可选的叶子节点name
     * @return
     */
    private List<AclModuleLevelDto> getAclModuleLevelDtoFromTree2(List<AclModuleLevelDto> res, int aId, String aName) {
        for (AclModuleLevelDto dto : res) {
            if (dto.getAclModuleList() != null && dto.getAclModuleList().size() > 0) {
                getAclModuleLevelDtoFromTree2(dto.getAclModuleList(), aId, aName);
            } else {
                int dtoId = dto.getId();
                String dtoName = dto.getName();
                if (dtoId == aId && dtoName.equals(aName)) {
                    dto.setGouXuan(true);
                }
            }
        }
        return res;
    }

    /**
     * 获取用户权限
     *
     * @param id 用户id
     * @return List<Acl>
     */
    public List<Acl> userAcls(int id) {
        return userBiz.findUserAcls(id);
    }

    /**
     * 查询系统预定义给用户对应角色的权限
     *
     * @param userid 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    public List<Acl> findUserAclsBySystem(int userid, String name) {
        return userBiz.findUserAclsBySystem(userid, name);
    }

    /**
     * 查询用户自己的，非系统预定义的权限
     *
     * @param userid 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    public List<Acl> findUserAclsBySingle(int userid, String name) {
        return userBiz.findUserAclsBySingle(userid, name);
    }

    /**
     * 获取用户的权限层级数
     *
     * @param userid 用户id
     */
    public List<AclModuleLevelDto> userAclModuleTree(int userid) {
        return userAclModuleTree.aclModuleTree(userid);
    }

}
