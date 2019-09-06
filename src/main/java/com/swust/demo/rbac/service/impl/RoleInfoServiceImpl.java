package com.swust.demo.rbac.service.impl;

import com.swust.demo.rbac.bean.RoleInfo;
import com.swust.demo.rbac.biz.AclInfoBiz;
import com.swust.demo.rbac.biz.RoleInfoBiz;
import com.swust.demo.rbac.service.AclInfoService;
import com.swust.demo.rbac.service.RoleInfoService;

import java.util.List;

/**
 * 功能描述：对外提供的角色服务类
 */
public class RoleInfoServiceImpl implements RoleInfoService {
    //角色业务逻辑操作类
    RoleInfoBiz roleInfoBiz = new RoleInfoBiz();

    /**
     * 保存“角色”记录
     *
     * @param roleInfo 角色对象
     */
    public void save(RoleInfo roleInfo) {
        roleInfoBiz.save(roleInfo);
    }

    /**
     * 查询所有角色记录
     *
     * @return
     */
    public List<RoleInfo> select() {
        return roleInfoBiz.select();
    }

    /**
     * 查询角色记录
     *
     * @param id 记录id
     * @return
     */
    public RoleInfo selectById(Long id) {
        return roleInfoBiz.selectById(id);
    }

    /**
     * 更新角色记录
     *
     * @param obj 角色对象
     */
    public void update(Object obj) {
        roleInfoBiz.update(obj);
    }

    /**
     * 删除角色记录
     *
     * @param id 角色对象ID
     */
    public void delete(Long id) {
        roleInfoBiz.delete(id);
    }
}
