package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.UsergroupInfo;

import java.util.List;

public interface UsergroupInfoService {

    /**
     * 保存“用户组”记录
     *
     * @param usergroupInfo 用户组对象
     */
    public void save(UsergroupInfo usergroupInfo);

    /**
     * 查询用户组记录
     *
     * @return
     */
    public List<UsergroupInfo> select();

    /**
     * 查询用户组记录
     *
     * @param id 记录id
     * @return
     */
    public UsergroupInfo selectById(Long id);

    /**
     * 更新用户组记录
     *
     * @param obj 用户组对象
     */
    public void update(Object obj);

    /**
     * 删除用户组记录
     *
     * @param id 用户组对象ID
     */
    public void delete(Long id);
}
