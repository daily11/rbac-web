package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.UsergroupRoleRelation;

import java.util.List;

public interface UsergroupRoleRelationService {
    /**
     * 保存“用户组-角色”关联记录
     *
     * @param obj 用户组-角色 对象
     */
    public void save(Object obj);

    /**
     * 查询所有的用户组-角色 记录
     *
     * @return
     */
    public List<UsergroupRoleRelation> select();

    /**
     * 查询用户组-角色 记录
     *
     * @param id 记录id
     * @return
     */
    public UsergroupRoleRelation selectById(Long id);

    /**
     * 更新用户组-角色 记录
     *
     * @param obj 用户组-角色 对象
     */
    public void update(Object obj);

    /**
     * 删除用户组-角色 记录
     *
     * @param id 用户组-角色 对象ID
     */
    public void delete(Long id);

    /**
     * 绑定用户角色
     *
     * @param roleId 角色id
     * @param usergroupIdList 用户组id集合
     */
    public void bindUserRole(Long roleId, Long[] usergroupIdList) ;
}
