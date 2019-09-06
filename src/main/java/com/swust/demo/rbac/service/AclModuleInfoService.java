package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.AclModuleInfo;

import java.util.List;

public interface AclModuleInfoService {

    /**
     * 保存“权限模块”记录
     *
     * @param aclModuleInfo 权限模块对象
     */
    public void save(AclModuleInfo aclModuleInfo);

    /**
     * 查询权限模块记录
     *
     * @return
     */
    public List<AclModuleInfo> select();

    /**
     * 查询权限模块记录
     *
     * @param id 记录id
     * @return
     */
    public AclModuleInfo selectById(Long id);

    /**
     * 更新权限模块记录
     *
     * @param obj 权限模块对象
     */
    public void update(Object obj);

    /**
     * 删除权限模块记录
     *
     * @param id 权限模块对象ID
     */
    public void delete(Long id);
}
