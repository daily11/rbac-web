package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.RoleInfo;
import com.swust.demo.rbac.dao.RoleInfoDao;

import java.util.List;

public interface RoleInfoService {

    /**
     * 保存“角色”记录
     *
     * @param roleInfo 角色对象
     */
    public void save(RoleInfo roleInfo);

    /**
     * 查询所有角色记录
     *
     * @return
     */
    public List<RoleInfo> select();

    /**
     * 查询角色记录
     *
     * @param id 记录id
     * @return
     */
    public RoleInfo selectById(Long id);

    /**
     * 更新角色记录
     *
     * @param obj 角色对象
     */
    public void update(Object obj);

    /**
     * 删除角色记录
     *
     * @param id 角色对象ID
     */
    public void delete(Long id);
}
