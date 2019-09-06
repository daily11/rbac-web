package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.AclInfo;
import com.swust.demo.rbac.dto.AclModuleLevelDto;
import com.swust.demo.rbac.param.RoleAclViewParam;

import java.util.List;

public interface TreeService {

    /**
     * 获取权限模块层级树
     *
     * @return
     */
    public List<AclModuleLevelDto> aclModuleTree();

    /**
     * 获取用户权限
     *
     * @param id 用户id
     * @return List<Acl>
     */
    public List<AclInfo> userAcls(Long id);

    /**
     * 查询系统预定义给用户对应角色的权限
     *
     * @param userid 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    public List<AclInfo> findUserAclsBySystem(int userid, String name);

    /**
     * 查询用户自己的，非系统预定义的权限
     *
     * @param userid 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    public List<AclInfo> findUserAclsBySingle(int userid, String name);

    /**
     * 查询角色权限模块层级树
     *
     * @param rolename
     * @return
     */
    public List<AclModuleLevelDto> aclModuleTreeByRolename(String rolename);

    /**
     * 根据用户id和name获取权限模块层级树
     *
     * @return List<AclModuleLevelDto>
     */
    public List<AclModuleLevelDto> aclModuleTreeByUserIdAndname(int userid, String name);

    /**
     * 查询角色对应的权限
     *
     * @param rolename
     * @return
     */
    public List<RoleAclViewParam> selectRoleAclViewParam(String rolename);
}
