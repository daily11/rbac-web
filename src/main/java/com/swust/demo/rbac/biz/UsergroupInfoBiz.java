package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.RoleInfo;
import com.swust.demo.rbac.bean.UserInfo;
import com.swust.demo.rbac.bean.UsergroupInfo;
import com.swust.demo.rbac.dao.*;
import com.swust.demo.rbac.util.LevelUtil;
import com.swust.demo.rbac.util.ParamException;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：用户组业务逻辑操作类
 */
public class UsergroupInfoBiz {

    //用户数据持久化操作类
    UserInfoDao userInfoDao = new UserInfoDao();
    //用户组数据持久化操作类
    UsergroupInfoDao usergroupInfoDao = new UsergroupInfoDao();
    //用户-用户组 数据持久化操作类
    UserUsergroupRelationDao userUsergroupRelationDao = new UserUsergroupRelationDao();
    //用户组-角色 数据持久化操作类
    UsergroupRoleRelationDao usergroupRoleRelationDao = new UsergroupRoleRelationDao();

    /**
     * 保存“用户组”记录
     *
     * @param usergroupInfo 用户组对象
     */
    public void save(UsergroupInfo usergroupInfo) {
        if (checkExist(usergroupInfo.getGroupName())) {
            throw new ParamException("用户组名称已经存在");
        }
        //当前层级 = 父级部门层级+父级部门id
        usergroupInfo.setGroupPath(LevelUtil.calculateLevel(
                LevelUtil.getUsergroupLevel(usergroupInfoDao, usergroupInfo.getParentId()), usergroupInfo.getParentId()));
        usergroupInfoDao.save(usergroupInfo);
    }

    /**
     * 检查用户组是否存在
     *
     * @param groupName 用户组名称
     * @return
     */
    private boolean checkExist(String groupName) {
        UsergroupInfo usergroupInfo = usergroupInfoDao.selectByName(groupName);
        return usergroupInfo != null;
    }

    /**
     * 查询用户组记录
     *
     * @return
     */
    public List<UsergroupInfo> select() {
        return usergroupInfoDao.select();
    }

    /**
     * 查询用户组记录
     *
     * @param id 记录id
     * @return
     */
    public UsergroupInfo selectById(Long id) {
        return usergroupInfoDao.selectById(id);
    }

    /**
     * 更新用户组记录
     *
     * @param obj 用户组对象
     */
    public void update(Object obj) {
        usergroupInfoDao.update(obj);
    }

    /**
     * 删除用户组记录
     *
     * @param id 用户组对象ID
     */
    public void delete(Long id) {
        UsergroupInfo usergroupInfo = usergroupInfoDao.selectById(id);
        if (usergroupInfo != null) {
            UserInfo userInfo = userInfoDao.selectByName(usergroupInfo.getGroupName());
            //用户记录存在，那么私有用户组不允许删除！
            if (userInfo != null) {
                throw new ParamException("用户记录存在，私有用户组不允许删除！");
            }
        }
        //删除用户组记录
        usergroupInfoDao.delete(id);
        //删除 用户-用户组 关联记录
        userUsergroupRelationDao.deleteByUsergroupId(id);
        //删除 用户组-角色 关联记录
        usergroupRoleRelationDao.deleteByUsergroupId(id);
    }
}
