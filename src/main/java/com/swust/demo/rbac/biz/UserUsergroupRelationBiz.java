package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.UserInfo;
import com.swust.demo.rbac.bean.UserUsergroupRelation;
import com.swust.demo.rbac.dao.UserInfoDao;
import com.swust.demo.rbac.dao.UserUsergroupRelationDao;
import com.swust.demo.rbac.util.ParamException;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：用户-用户组 业务逻辑操作类
 */
public class UserUsergroupRelationBiz {

    //用户-用户组 数据持久化操作类
    UserUsergroupRelationDao userUsergroupRelationDao = new UserUsergroupRelationDao();
    UserInfoDao userInfoDao = new UserInfoDao();

    /**
     * 保存“用户-用户组”关联记录
     *
     * @param obj 用户-用户组 对象
     */
    public void save(Object obj) {
        userUsergroupRelationDao.save(obj);
    }

    /**
     * 查询所有的用户-用户组 记录
     *
     * @return
     */
    public List<UserUsergroupRelation> select() {
        return userUsergroupRelationDao.select();
    }

    /**
     * 查询用户-用户组记录
     *
     * @param id 记录id
     * @return
     */
    public UserUsergroupRelation selectById(Long id) {
        return userUsergroupRelationDao.selectById(id);
    }

    /**
     * 更新用户-用户组 记录
     *
     * @param obj 用户-用户组 对象
     */
    public void update(Object obj) {
        userUsergroupRelationDao.update(obj);
    }

    /**
     * 删除用户-用户组 记录
     *
     * @param id 用户-用户组 对象ID
     */
    public void delete(Long id) {
        UserUsergroupRelation userUsergroupRelation = userUsergroupRelationDao.selectById(id);
        if(userUsergroupRelation!=null){
            long userId = userUsergroupRelation.getUserId();
            UserInfo userInfo = userInfoDao.selectById(userId);
            if(userInfo!=null){
                throw new ParamException("用户记录存在，用户-用户组关联记录不允许删除！");
            }
        }
        userUsergroupRelationDao.delete(id);
    }
}
