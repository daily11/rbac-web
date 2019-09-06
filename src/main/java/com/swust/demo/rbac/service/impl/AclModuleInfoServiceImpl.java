package com.swust.demo.rbac.service.impl;

import com.swust.demo.rbac.bean.AclModuleInfo;
import com.swust.demo.rbac.biz.AclInfoBiz;
import com.swust.demo.rbac.biz.AclModuleInfoBiz;
import com.swust.demo.rbac.dao.AclModuleInfoDao;
import com.swust.demo.rbac.service.AclModuleInfoService;

import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：对外提供的权限模块服务类
 */
public class AclModuleInfoServiceImpl implements AclModuleInfoService {

    //权限模块业务逻辑操作类
    AclModuleInfoBiz aclModuleInfoBiz = new AclModuleInfoBiz();

    /**
     * 保存“权限模块”记录
     *
     * @param aclModuleInfo 权限模块对象
     */
    @Override
    public void save(AclModuleInfo aclModuleInfo) {
        aclModuleInfoBiz.save(aclModuleInfo);
    }

    /**
     * 查询权限模块记录
     *
     * @return
     */
    @Override
    public List<AclModuleInfo> select() {
        return aclModuleInfoBiz.select();
    }

    /**
     * 查询权限模块记录
     *
     * @param id 记录id
     * @return
     */
    @Override
    public AclModuleInfo selectById(Long id) {
        return aclModuleInfoBiz.selectById(id);
    }

    /**
     * 更新权限模块记录
     *
     * @param obj 权限模块对象
     */
    @Override
    public void update(Object obj) {
        aclModuleInfoBiz.update(obj);
    }

    /**
     * 删除权限模块记录
     * 级联删除该模块下的    子权限模块 + 功能点
     *
     * @param aclModuleId 权限模块id
     */
    public void delete(Long aclModuleId) {
        aclModuleInfoBiz.delete(aclModuleId);
    }
}
