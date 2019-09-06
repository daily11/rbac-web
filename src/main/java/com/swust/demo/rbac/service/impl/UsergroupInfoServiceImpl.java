package com.swust.demo.rbac.service.impl;

import com.swust.demo.rbac.bean.UsergroupInfo;
import com.swust.demo.rbac.biz.AclInfoBiz;
import com.swust.demo.rbac.biz.UsergroupInfoBiz;
import com.swust.demo.rbac.service.AclInfoService;
import com.swust.demo.rbac.service.UsergroupInfoService;

import java.util.List;

/**
 * 功能描述：对外提供的用户组服务类
 */
public class UsergroupInfoServiceImpl implements UsergroupInfoService {

    //用户组业务逻辑操作类
    UsergroupInfoBiz usergroupInfoBiz = new UsergroupInfoBiz();

    /**
     * 保存“用户组”记录
     *
     * @param usergroupInfo 用户组对象
     */
    public void save(UsergroupInfo usergroupInfo) {
        usergroupInfoBiz.save(usergroupInfo);
    }

    /**
     * 查询用户组记录
     *
     * @return
     */
    public List<UsergroupInfo> select() {
        return usergroupInfoBiz.select();
    }

    /**
     * 查询用户组记录
     *
     * @param id 记录id
     * @return
     */
    public UsergroupInfo selectById(Long id) {
        return usergroupInfoBiz.selectById(id);
    }

    /**
     * 更新用户组记录
     *
     * @param obj 用户组对象
     */
    public void update(Object obj) {
        usergroupInfoBiz.update(obj);
    }

    /**
     * 删除用户组记录
     *
     * @param id 用户组对象ID
     */
    public void delete(Long id) {
        usergroupInfoBiz.delete(id);
    }
}
