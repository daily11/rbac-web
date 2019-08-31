package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.Acl;
import com.swust.demo.rbac.biz.AclBiz;
import com.swust.demo.rbac.param.AclParam;

import java.util.List;

/**
 * 功能描述：对外提供的权限服务类
 */
public class AclService {
    //权限业务逻辑类
    AclBiz aclBiz = new AclBiz();

    /**
     * 添加权限点
     */
    public void saveAcl(AclParam param) {
        aclBiz.save(param);
    }

    /**
     * 删除权限点记录
     *
     * @param aclId 权限点id
     */
    public void deleteAcl(int aclId) {
        aclBiz.delete(aclId);
    }

    /**
     * 查询所有的权限点
     */
    public List<Acl> findAllAcl() {
        return aclBiz.findAllAcl();
    }

    /**
     * 查询权限点
     *
     * @param aclid 权限id
     */
    public Acl findAclById(int aclid) {
        return aclBiz.findAclById(aclid);
    }

    /**
     * 更新权限点记录
     *
     * @param acl 更新后的权限点记录
     */
    public void updateAcl(Acl acl) {
        aclBiz.update(acl);
    }
}
