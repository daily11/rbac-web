package com.swust.demo.rbac.service.impl;

import com.swust.demo.rbac.bean.RoleAclRelation;
import com.swust.demo.rbac.biz.RoleAclRelationBiz;
import com.swust.demo.rbac.service.RoleAclRelationService;

import java.util.List;

/**
 * 功能描述：对外提供的角色权限服务类
 */
public class RoleAclRelationServiceImpl implements RoleAclRelationService {

    //角色权限业务逻辑操作类
    RoleAclRelationBiz roleAclRelationBiz = new RoleAclRelationBiz();

    /**
     * 保存“角色权限”关联记录
     *
     * @param obj 用户角色对象
     */
    @Override
    public void save(Object obj) {
        roleAclRelationBiz.save(obj);
    }

    /**
     * 查询所有的角色权限记录
     *
     * @return
     */
    @Override
    public List<RoleAclRelation> select() {
        return roleAclRelationBiz.select();
    }

    /**
     * 查询角色权限记录
     *
     * @param id 记录id
     * @return
     */
    @Override
    public RoleAclRelation selectById(Long id) {
        return roleAclRelationBiz.selectById(id);
    }

    /**
     * 更新角色权限记录
     *
     * @param obj 角色权限对象
     */
    @Override
    public void update(Object obj) {
        roleAclRelationBiz.update(obj);
    }

    /**
     * 删除角色权限记录
     *
     * @param id 角色权限对象ID
     */
    @Override
    public void delete(Long id) {
        roleAclRelationBiz.delete(id);
    }

}
