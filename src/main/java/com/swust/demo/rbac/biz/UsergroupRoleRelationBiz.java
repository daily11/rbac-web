package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.RoleInfo;
import com.swust.demo.rbac.bean.UserInfo;
import com.swust.demo.rbac.bean.UserUsergroupRelation;
import com.swust.demo.rbac.bean.UsergroupRoleRelation;
import com.swust.demo.rbac.dao.RoleAclRelationDao;
import com.swust.demo.rbac.dao.RoleInfoDao;
import com.swust.demo.rbac.dao.UserInfoDao;
import com.swust.demo.rbac.dao.UsergroupRoleRelationDao;
import com.swust.demo.rbac.util.ParamException;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 * 功能描述：用户组-角色 业务逻辑操作类
 */
public class UsergroupRoleRelationBiz {

    //用户组-角色 数据持久化操作类
    UsergroupRoleRelationDao usergroupRoleRelationDao = new UsergroupRoleRelationDao();
    RoleInfoDao roleInfoDao = new RoleInfoDao();
    UserInfoDao userInfoDao = new UserInfoDao();


    /**
     * 保存“用户组-角色”关联记录
     *
     * @param obj 用户组-角色 对象
     */
    public void save(Object obj) {
        usergroupRoleRelationDao.save(obj);
    }

    /**
     * 查询所有的用户组-角色 记录
     *
     * @return
     */
    public List<UsergroupRoleRelation> select() {
        return usergroupRoleRelationDao.select();
    }

    /**
     * 查询用户组-角色 记录
     *
     * @param id 记录id
     * @return
     */
    public UsergroupRoleRelation selectById(Long id) {
        return usergroupRoleRelationDao.selectById(id);
    }

    /**
     * 更新用户组-角色 记录
     *
     * @param obj 用户组-角色 对象
     */
    public void update(Object obj) {
        usergroupRoleRelationDao.update(obj);
    }

    /**
     * 删除用户组-角色 记录
     *
     * @param id 用户组-角色 对象ID
     */
    public void delete(Long id) {
        UsergroupRoleRelation usergroupRoleRelation = usergroupRoleRelationDao.selectById(id);
        if (usergroupRoleRelation != null) {
            long roleId = usergroupRoleRelation.getRoleId();
            RoleInfo roleInfo = roleInfoDao.selectById(roleId);
            if (roleInfo != null) {
                UserInfo userInfo = userInfoDao.selectByName(roleInfo.getName());
                if (userInfo != null) {
                    throw new ParamException("用户记录存在，用户组-角色关联记录不允许删除！");
                }
            }
        }

        usergroupRoleRelationDao.delete(id);
    }

    /**
     * 绑定用户角色
     *
     * @param roleId          角色id
     * @param usergroupIdList 用户组id集合
     */
    public void bindUserRole(Long roleId, Long[] usergroupIdList) {
        //根据角色id，删除用户组角色关联记录
        usergroupRoleRelationDao.deleteByRoleid(roleId);
        //新增用户组角色记录
        for (int i = 0; i < usergroupIdList.length; i++) {
            UsergroupRoleRelation userRole = UsergroupRoleRelation.builder()
                    .roleId(roleId)
                    .userGroupId(usergroupIdList[i])
                    .build();
            usergroupRoleRelationDao.save(userRole);
        }
    }
}
