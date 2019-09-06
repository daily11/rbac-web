package com.swust.demo.rbac.service.impl;

import afu.org.checkerframework.checker.oigj.qual.O;
import com.swust.demo.rbac.bean.AclInfo;
import com.swust.demo.rbac.biz.RoleAclRelationBiz;
import com.swust.demo.rbac.biz.UserInfoBiz;
import com.swust.demo.rbac.dto.AclModuleLevelDto;
import com.swust.demo.rbac.param.RoleAclViewParam;
import com.swust.demo.rbac.service.TreeService;
import com.swust.demo.rbac.tree.AclModuleRoleTree;
import com.swust.demo.rbac.tree.AclModuleTree;

import java.util.List;

public class TreeServiceImpl implements TreeService {
    //权限模块层级树相关
    AclModuleTree aclModuleTree = new AclModuleTree();
    //角色权限模块层级树相关
    AclModuleRoleTree aclModuleRoleTree = new AclModuleRoleTree();
    //用户权限相关
    UserInfoBiz userInfoBiz = new UserInfoBiz();
    //角色权限逻辑操作相关
    RoleAclRelationBiz roleAclBiz = new RoleAclRelationBiz();

    /**
     * 获取权限模块层级树
     *
     * @return
     */
    @Override
    public List<AclModuleLevelDto> aclModuleTree() {
        return aclModuleTree.aclModuleTree();
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
        List<AclModuleLevelDto> aclModuleLevelDtoTree = aclModuleTree.aclModuleTree();
//        print(aclModuleLevelDtoTree);
        //2.获得置为灰色的用户权限
        List<AclInfo> userAclsBySystem = userInfoBiz.selectUserAclsBySystem(userid, name);
        //3.获得可以勾选的用户权限
        List<AclInfo> userAclsBySingle = userInfoBiz.selectUserAclsBySingle(userid, name);

        //4.设置权限树某些叶子节点置为灰色
        List<AclModuleLevelDto> res = null;
        if (userAclsBySystem != null && userAclsBySystem.size() > 0) {
            for (AclInfo ac : userAclsBySystem) {
                long acId = ac.getId();
                String acName = ac.getName();
                res = getAclModuleLevelDtoFromTree(aclModuleLevelDtoTree, acId, acName);
            }
        } else {
            res = aclModuleLevelDtoTree;
        }

        //5.设置权限树某些叶子节点为可选
        List<AclModuleLevelDto> result = null;
        if (userAclsBySingle != null && userAclsBySingle.size() > 0) {
            for (AclInfo ac : userAclsBySingle) {
                long aId = ac.getId();
                String aName = ac.getName();
                result = getAclModuleLevelDtoFromTree2(res, aId, aName);
            }
        } else {
            result = res;
        }

        return result;
    }

    public void print(List<AclModuleLevelDto> list) {
        for (AclModuleLevelDto levelDto : list) {
            System.out.println(levelDto.getName());
            if (levelDto.getAclModuleList() != null) {
                print(levelDto.getAclModuleList());
            }
        }
    }

    /**
     * 递归查询权限树结构的叶子节点是否可以置为灰色
     *
     * @param aclModuleLevelDtoTree 权限树结构
     * @param acId                  要置为灰色的叶子节点id
     * @param acName                要置为灰色的叶子节点name
     * @return
     */
    private List<AclModuleLevelDto> getAclModuleLevelDtoFromTree(List<AclModuleLevelDto> aclModuleLevelDtoTree, Long acId, String acName) {
        for (AclModuleLevelDto dto : aclModuleLevelDtoTree) {
            if (dto.getAclModuleList() != null && dto.getAclModuleList().size() > 0) {
                getAclModuleLevelDtoFromTree(dto.getAclModuleList(), acId, acName);
            } else {
                long dtoId = dto.getId();
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
    private List<AclModuleLevelDto> getAclModuleLevelDtoFromTree2(List<AclModuleLevelDto> res, Long aId, String aName) {
        for (AclModuleLevelDto dto : res) {
            if (dto.getAclModuleList() != null && dto.getAclModuleList().size() > 0) {
                getAclModuleLevelDtoFromTree2(dto.getAclModuleList(), aId, aName);
            } else {
                long dtoId = dto.getId();
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
    public List<AclInfo> userAcls(Long id) {
        return userInfoBiz.selectUserAcls(id);
    }

    /**
     * 查询系统预定义给用户对应角色的权限
     *
     * @param userid 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    public List<AclInfo> findUserAclsBySystem(int userid, String name) {
        return userInfoBiz.selectUserAclsBySystem(userid, name);
    }

    /**
     * 查询用户自己的，非系统预定义的权限
     *
     * @param userid 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    public List<AclInfo> findUserAclsBySingle(int userid, String name) {
        return userInfoBiz.selectUserAclsBySingle(userid, name);
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
