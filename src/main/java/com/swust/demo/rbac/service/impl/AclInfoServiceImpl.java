package com.swust.demo.rbac.service.impl;

import com.swust.demo.rbac.bean.AclInfo;
import com.swust.demo.rbac.biz.AclInfoBiz;
import com.swust.demo.rbac.biz.RoleAclRelationBiz;
import com.swust.demo.rbac.service.AclInfoService;
import com.swust.demo.rbac.service.RoleAclRelationService;

import java.util.List;

/**
 * 功能描述：对外提供的权限服务类
 */
public class AclInfoServiceImpl implements AclInfoService {

    //角色权限业务逻辑操作类
    AclInfoBiz aclInfoBiz = new AclInfoBiz();

    /**
     * 保存“权限”记录
     *
     * @param aclInfo 权限对象
     */
    @Override
    public void save(AclInfo aclInfo) {
        aclInfoBiz.save(aclInfo);
    }

    /**
     * 查询权限记录
     *
     * @return
     */
    @Override
    public List<AclInfo> select() {
        return aclInfoBiz.select();
    }

    /**
     * 查询权限记录
     *
     * @param id 记录id
     * @return
     */
    @Override
    public AclInfo selectById(Long id) {
        return aclInfoBiz.selectById(id);
    }

    /**
     * 更新权限记录
     *
     * @param obj 权限对象
     */
    @Override
    public void update(Object obj) {
        aclInfoBiz.update(obj);
    }

    /**
     * 删除权限记录
     *
     * @param id 权限对象ID
     */
    @Override
    public void delete(Long id) {
        aclInfoBiz.delete(id);
    }

    /**
     * 功能模块与功能点绑定
     *
     * @param ids         角色id集合
     * @param aclModuleId 角色模块id
     */
    public void updateSysAcl1(Long[] ids, Long aclModuleId) {
        /**
         * 1 根据角色ID查询角色信息
         * 2 更新角色对应的角色模块id
         * 3 更新角色信息
         */
        for (long aclId : ids) {
            AclInfo aclInfo = aclInfoBiz.selectById(aclId);
            if (aclInfo != null) {
                aclInfo.setAclModuleId(aclModuleId);
                aclInfoBiz.update(aclInfo);
            }
        }
    }
}
