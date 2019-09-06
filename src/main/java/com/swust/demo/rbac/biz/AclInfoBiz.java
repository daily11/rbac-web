package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.AclInfo;
import com.swust.demo.rbac.bean.RoleAclRelation;
import com.swust.demo.rbac.dao.AclInfoDao;
import com.swust.demo.rbac.dao.RoleAclRelationDao;
import com.swust.demo.rbac.util.ParamException;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 功能描述：权限业务逻辑操作类
 */
public class AclInfoBiz {
    //权限数据持久化操作类
    AclInfoDao aclInfoDao = new AclInfoDao();
    //角色权限数据持久化操作类
    RoleAclRelationDao roleAclRelationDao = new RoleAclRelationDao();

    /**
     * 保存“权限”记录
     *
     * @param aclInfo 权限对象
     */
    public void save(AclInfo aclInfo) {
        //检测权限记录是否存在
        if (checkExist(aclInfo.getName())) {
            throw new ParamException("当前权限模块下面存在相同名称的权限点");
        }
        //生成权限码
        aclInfo.setCode(generateCode());
        //保存记录
        aclInfoDao.save(aclInfo);
    }

    /**
     * 检查权限是否存在
     *
     * @param aclName 权限名称
     * @return
     */
    private boolean checkExist(String aclName) {
        AclInfo aclInfo = aclInfoDao.selectByName(aclName);
        return aclInfo != null;
    }

    /**
     * 生成权限码
     *
     * @return
     */
    public String generateCode() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        return dateFormat.format(new Date()) + "_" + (int) (Math.random() * 100);
    }

    /**
     * 查询权限记录
     *
     * @return
     */
    public List<AclInfo> select() {
        return aclInfoDao.select();
    }

    /**
     * 查询权限记录
     *
     * @param id 记录id
     * @return
     */
    public AclInfo selectById(Long id) {
        return aclInfoDao.selectById(id);
    }

    /**
     * 更新权限记录
     *
     * @param obj 权限对象
     */
    public void update(Object obj) {
        aclInfoDao.update(obj);
    }

    /**
     * 删除权限记录
     *
     * @param id 权限对象ID
     */
    public void delete(Long id) {
        //删除权限记录
        aclInfoDao.delete(id);
        //删除 权限点+ 角色 记录
        roleAclRelationDao.deleteByAclId(id);
    }

    public void deleteByAclModuleId(Long aclModuleId){
        aclInfoDao.deleteByAclModuleId(aclModuleId);
    }
}
