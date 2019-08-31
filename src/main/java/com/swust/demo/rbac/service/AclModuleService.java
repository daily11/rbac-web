package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.AclModule;
import com.swust.demo.rbac.biz.AclModuleBiz;
import com.swust.demo.rbac.param.AclModuleParam;

import java.util.List;

/**
 * 功能描述：对外提供的权限模块服务类
 */
public class AclModuleService {
    //权限模块业务逻辑操作类
    AclModuleBiz aclModuleBiz = new AclModuleBiz();

    /**
     * 保存权限模块记录
     *
     * @param param 客户端权限模块记录
     */
    public void saveAclModule(AclModuleParam param) {
        aclModuleBiz.save(param);
    }

    /**
     * 删除权限模块记录
     *
     * @param aclModuleId 权限模块id
     */
    public void deleteAclModule(int aclModuleId) {
        //删除功能模块
        aclModuleBiz.delete(aclModuleId);
    }

    /**
     * 更新权限模块记录
     *
     * @param aclModule 权限模块记录
     */
    public void updateAclModule(AclModule aclModule) {
        aclModuleBiz.update(aclModule);
    }

    /**
     * 查询所有的权限模块
     */
    public List<AclModule> findAllAclModule() {
        return aclModuleBiz.findAllAclModule();
    }

    /**
     * 查询单个权限模块
     *
     * @param aclModuleId 权限模块id
     * @return AclModule
     */
    public AclModule findAclModuleById(int aclModuleId) {
        return aclModuleBiz.findAclModuleById(aclModuleId);
    }
}
