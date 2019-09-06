package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.AclInfo;

import java.util.List;

public interface AclInfoService {

    /**
     * 保存“权限”记录
     *
     * @param aclInfo 权限对象
     */
    public void save(AclInfo aclInfo);

    /**
     * 查询权限记录
     *
     * @return
     */
    public List<AclInfo> select();

    /**
     * 查询权限记录
     *
     * @param id 记录id
     * @return
     */
    public AclInfo selectById(Long id);

    /**
     * 更新权限记录
     *
     * @param obj 权限对象
     */
    public void update(Object obj);

    /**
     * 删除权限记录
     *
     * @param id 权限对象ID
     */
    public void delete(Long id);

    /**
     * 功能模块与功能点绑定
     *
     * @param ids          角色id集合
     * @param aclModuleId 角色模块id
     */
    public void updateSysAcl1(Long[] ids, Long aclModuleId);
}
