package com.swust.demo.rbac.service.impl;

import com.swust.demo.rbac.bean.UsergroupRoleRelation;
import com.swust.demo.rbac.biz.RoleAclRelationBiz;
import com.swust.demo.rbac.biz.UsergroupRoleRelationBiz;
import com.swust.demo.rbac.service.RoleAclRelationService;
import com.swust.demo.rbac.service.UsergroupRoleRelationService;

import java.util.List;

/**
 * 功能描述：对外提供的用户组-角色 服务类
 */
public class UsergroupRoleRelationServiceImpl implements UsergroupRoleRelationService {

    //用户组-角色 业务逻辑操作类
    UsergroupRoleRelationBiz usergroupRoleRelationBiz = new UsergroupRoleRelationBiz();

    /**
     * 保存“用户组-角色”关联记录
     *
     * @param obj 用户组-角色 对象
     */
    public void save(Object obj) {
        usergroupRoleRelationBiz.save(obj);
    }

    /**
     * 查询所有的用户组-角色 记录
     *
     * @return
     */
    public List<UsergroupRoleRelation> select() {
        return usergroupRoleRelationBiz.select();
    }

    /**
     * 查询用户组-角色 记录
     *
     * @param id 记录id
     * @return
     */
    public UsergroupRoleRelation selectById(Long id) {
        return usergroupRoleRelationBiz.selectById(id);
    }

    /**
     * 更新用户组-角色 记录
     *
     * @param obj 用户组-角色 对象
     */
    public void update(Object obj) {
        usergroupRoleRelationBiz.update(obj);
    }

    /**
     * 删除用户组-角色 记录
     *
     * @param id 用户组-角色 对象ID
     */
    public void delete(Long id) {
        usergroupRoleRelationBiz.delete(id);
    }

    /**
     * 绑定用户角色
     *
     * @param roleId 角色id
     * @param usergroupIdList 用户组id集合
     */
    public void bindUserRole(Long roleId, Long[] usergroupIdList) {
        usergroupRoleRelationBiz.bindUserRole(roleId, usergroupIdList);
    }
}
