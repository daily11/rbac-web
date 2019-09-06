package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.AclInfo;
import com.swust.demo.rbac.bean.AclModuleInfo;
import com.swust.demo.rbac.bean.RoleAclRelation;
import com.swust.demo.rbac.dao.AclInfoDao;
import com.swust.demo.rbac.dao.AclModuleInfoDao;
import com.swust.demo.rbac.dao.RoleAclRelationDao;
import com.swust.demo.rbac.util.LevelUtil;
import com.swust.demo.rbac.util.ParamException;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 功能描述：权限模块业务逻辑操作类
 */
public class AclModuleInfoBiz {
    //用户权限模块数据持久化操作类
    AclModuleInfoDao aclModuleInfoDao = new AclModuleInfoDao();
    //用户权限数据持久化操作类
    AclInfoDao aclInfoDao = new AclInfoDao();
//    //用户角色权限数据持久化操作类
//    RoleAclRelationDao roleAclRelationDao = new RoleAclRelationDao();

    /**
     * 保存“权限模块”记录
     *
     * @param aclModuleInfo 权限模块对象
     */
    public void save(AclModuleInfo aclModuleInfo) {
        //检测权限记录是否存在
        if (checkExist(aclModuleInfo.getName())) {
            throw new ParamException("同一层级下存在相同名称的权限模块");
        }
        //当前层级 = 父级部门层级+父级部门id
        aclModuleInfo.setLevel(LevelUtil.calculateLevel(
                LevelUtil.getAclModuleLevel(aclModuleInfoDao, aclModuleInfo.getParentId()), aclModuleInfo.getParentId()));
        aclModuleInfoDao.save(aclModuleInfo);
    }

    /**
     * 检查权限模块是否存在
     *
     * @param aclModuleName 权限模块名称
     * @return
     */
    private boolean checkExist(String aclModuleName) {
        AclModuleInfo aclModuleInfo = aclModuleInfoDao.selectByName(aclModuleName);
        return aclModuleInfo != null;
    }

    /**
     * 查询权限模块记录
     *
     * @return
     */
    public List<AclModuleInfo> select() {
        return aclModuleInfoDao.select();
    }

    /**
     * 查询权限模块记录
     *
     * @param id 记录id
     * @return
     */
    public AclModuleInfo selectById(Long id) {
        return aclModuleInfoDao.selectById(id);
    }

    /**
     * 更新权限模块记录
     *
     * @param obj 权限模块对象
     */
    public void update(Object obj) {
        aclModuleInfoDao.update(obj);
    }

    /**
     * 删除权限模块记录
     * 级联删除该模块下的    子权限模块 + 功能点
     *
     * @param aclModuleId 权限模块id
     */
    public void delete(Long aclModuleId) {
        AclModuleInfo deleteAclModule = null;
        //1 删除子权限模块对应的权限点
        //1.1 查询所有的权限模块信息
        List<AclModuleInfo> aclModuleList = aclModuleInfoDao.select();
        //1.2 查找到需要删除的子权限模块
        List<AclModuleInfo> sonAclModules = new ArrayList<>();
        for (int i = 0; i < aclModuleList.size(); i++) {
            String[] levelArr = aclModuleList.get(i).getLevel().split("\\.");//注意小数点是特殊字符，不能直接split，需要转义一下
            //1.2.1 根据需要删除的权限模块id，查询子权限模块层级中包含该id的权限模块
            for (String str : levelArr) {
                int idStr = Integer.parseInt(str);
                if (idStr == aclModuleId) {
                    sonAclModules.add(aclModuleList.get(i));
                }
            }
        }
        int sonAclModulesLen = sonAclModules.size();//需要删除的子权限模块集合长度
        //1.3 删除子权限模块权限点
        for (int i = 0; i < sonAclModulesLen; i++) {
            AclModuleInfo sonAclModule = sonAclModules.get(i);
            aclInfoDao.deleteByAclModuleId(sonAclModule.getId());
            //TODO 删除角色权限管理表对应权限点记录
        }
        //2  删除需要删除的权限模块记录对应的权限点
        aclInfoDao.deleteByAclModuleId(aclModuleId);
        //3  删除子权限模块
        for (int i = 0; i < sonAclModulesLen; i++) {
            AclModuleInfo sonAclModule = sonAclModules.get(i);
            aclModuleInfoDao.delete(sonAclModule.getId());
        }
        //4  删除该权限模块
        aclModuleInfoDao.delete(aclModuleId);
    }
}
