package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.bean.RoleAclRelation;
import com.swust.demo.rbac.dao.RoleAclRelationDao;
import com.swust.demo.rbac.param.RoleAclViewParam;

import java.util.List;

/**
 * 功能描述：角色权限业务逻辑操作类
 */
public class RoleAclRelationBiz {
    //用户角色权限数据持久化操作类
    RoleAclRelationDao roleAclRelationDao = new RoleAclRelationDao();

    /**
     * 保存“角色权限”关联记录
     *
     * @param obj 用户角色对象
     */
    public void save(Object obj) {
        roleAclRelationDao.save(obj);
    }

    /**
     * 查询所有的角色权限记录
     *
     * @return
     */
    public List<RoleAclRelation> select() {
        return roleAclRelationDao.select();
    }

    /**
     * 查询角色权限记录
     *
     * @param id 记录id
     * @return
     */
    public RoleAclRelation selectById(Long id) {
        return roleAclRelationDao.selectById(id);
    }

    /**
     * 更新角色权限记录
     *
     * @param obj 角色权限对象
     */
    public void update(Object obj) {
        roleAclRelationDao.update(obj);
    }

    /**
     * 删除角色权限记录
     *
     * @param id 角色权限对象ID
     */
    public void delete(Long id) {
        roleAclRelationDao.delete(id);
    }


    /**
     * 查询角色对应的权限
     *
     * @param rolename
     * @return
     */
    public List<RoleAclViewParam> selectRoleAclViewParam(String rolename) {
        return roleAclRelationDao.selectRoleAclViewParam(rolename);
    }
}
