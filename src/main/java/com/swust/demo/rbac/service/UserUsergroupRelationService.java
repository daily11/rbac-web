package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.UserUsergroupRelation;

import java.util.List;

public interface UserUsergroupRelationService {

    /**
     * 保存“用户-用户组”关联记录
     *
     * @param obj 用户-用户组 对象
     */
    public void save(Object obj);

    /**
     * 查询所有的用户-用户组 记录
     *
     * @return
     */
    public List<UserUsergroupRelation> select();

    /**
     * 查询用户-用户组记录
     *
     * @param id 记录id
     * @return
     */
    public UserUsergroupRelation selectById(Long id);

    /**
     * 更新用户-用户组 记录
     *
     * @param obj 用户-用户组 对象
     */
    public void update(Object obj);

    /**
     * 删除用户-用户组 记录
     *
     * @param id 用户-用户组 对象ID
     */
    public void delete(Long id);
}
