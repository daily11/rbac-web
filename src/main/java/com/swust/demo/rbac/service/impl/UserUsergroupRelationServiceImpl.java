package com.swust.demo.rbac.service.impl;

import com.swust.demo.rbac.bean.UserUsergroupRelation;
import com.swust.demo.rbac.biz.UserUsergroupRelationBiz;
import com.swust.demo.rbac.dao.UserUsergroupRelationDao;
import com.swust.demo.rbac.service.UserUsergroupRelationService;

import java.util.List;

/**
 * 功能描述：对外提供的用户-用户组 服务类
 */
public class UserUsergroupRelationServiceImpl implements UserUsergroupRelationService {

    //用户-用户组 业务逻辑操作类
    UserUsergroupRelationBiz userUsergroupRelationBiz = new UserUsergroupRelationBiz();

    /**
     * 保存“用户-用户组”关联记录
     *
     * @param obj 用户-用户组 对象
     */
    public void save(Object obj) {
        userUsergroupRelationBiz.save(obj);
    }

    /**
     * 查询所有的用户-用户组 记录
     *
     * @return
     */
    public List<UserUsergroupRelation> select() {
        return userUsergroupRelationBiz.select();
    }

    /**
     * 查询用户-用户组记录
     *
     * @param id 记录id
     * @return
     */
    public UserUsergroupRelation selectById(Long id) {
        return userUsergroupRelationBiz.selectById(id);
    }

    /**
     * 更新用户-用户组 记录
     *
     * @param obj 用户-用户组 对象
     */
    public void update(Object obj) {
        userUsergroupRelationBiz.update(obj);
    }

    /**
     * 删除用户-用户组 记录
     */
    public void delete(Long id) {
        userUsergroupRelationBiz.delete(id);
    }
}
