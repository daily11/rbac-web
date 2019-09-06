package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.bean.*;
import com.swust.demo.rbac.dao.RoleAclRelationDao;
import com.swust.demo.rbac.dao.RoleInfoDao;
import com.swust.demo.rbac.dao.UserInfoDao;
import com.swust.demo.rbac.dao.UsergroupRoleRelationDao;
import com.swust.demo.rbac.util.ParamException;

import javax.management.relation.Role;
import java.util.List;

/**
 * 功能描述：角色业务逻辑操作类
 */
public class RoleInfoBiz {
    //用户数据持久化操作类
    UserInfoDao userInfoDao = new UserInfoDao();
    //角色数据持久化操作类
    RoleInfoDao roleInfoDao = new RoleInfoDao();
    //角色-权限点 数据持久化操作类
    RoleAclRelationDao roleAclRelationDao = new RoleAclRelationDao();
    //用户组-角色 数据持久化操作类
    UsergroupRoleRelationDao usergroupRoleRelationDao = new UsergroupRoleRelationDao();

    /**
     * 保存“角色”记录
     *
     * @param roleInfo 角色对象
     */
    public void save(RoleInfo roleInfo) {
        if (checkExist(roleInfo.getName())) {
            throw new ParamException("角色名称已经存在");
        }
        roleInfoDao.save(roleInfo);
    }

    /**
     * 检查角色是否存在
     *
     * @param roleName 角色名称
     * @return
     */
    private boolean checkExist(String roleName) {
        RoleInfo roleInfo = roleInfoDao.selectByName(roleName);
        return roleInfo != null;
    }

    /**
     * 查询所有角色记录
     *
     * @return
     */
    public List<RoleInfo> select() {
        return roleInfoDao.select();
    }

    /**
     * 查询角色记录
     *
     * @param id 记录id
     * @return
     */
    public RoleInfo selectById(Long id) {
        return roleInfoDao.selectById(id);
    }

    /**
     * 更新角色记录
     *
     * @param obj 角色对象
     */
    public void update(Object obj) {
        roleInfoDao.update(obj);
    }

    /**
     * 删除角色记录
     *
     * @param id 角色对象ID
     */
    public void delete(Long id) {
        RoleInfo roleInfo = roleInfoDao.selectById(id);
        if (roleInfo != null) {
            UserInfo userInfo = userInfoDao.selectByName(roleInfo.getName());
            //用户记录存在，那么私有角色不允许删除！
            if (userInfo != null) {
                throw new ParamException("用户记录存在，私有角色不允许删除！");
            }
        }

        //1 删除角色记录
        roleInfoDao.delete(id);
        //2 删除角色用户组关联表
        usergroupRoleRelationDao.deleteByRoleid(id);
        //3 删除角色权限点关联表
        roleAclRelationDao.deleteByRoleId(id);
    }
}
