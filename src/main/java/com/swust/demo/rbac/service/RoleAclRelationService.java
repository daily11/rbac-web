package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.RoleAclRelation;

import java.util.List;

public interface RoleAclRelationService {

    /**
     * 保存“角色权限”关联记录
     *
     * @param obj 用户角色对象
     */
    public void save(Object obj);

    /**
     * 查询所有的角色权限记录
     *
     * @return
     */
    public List<RoleAclRelation> select();

    /**
     * 查询角色权限记录
     *
     * @param id 记录id
     * @return
     */
    public RoleAclRelation selectById(Long id);

    /**
     * 更新角色权限记录
     *
     * @param obj 角色权限对象
     */
    public void update(Object obj);

    /**
     * 删除角色权限记录
     *
     * @param id 角色权限对象ID
     */
    public void delete(Long id);
}
