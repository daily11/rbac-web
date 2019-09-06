package com.swust.demo.rbac.util;

import com.swust.demo.rbac.bean.AclModuleInfo;
import com.swust.demo.rbac.bean.UsergroupInfo;
import com.swust.demo.rbac.dao.AclModuleInfoDao;
import com.swust.demo.rbac.dao.UsergroupInfoDao;

/**
 * 功能描述：获取模块所属层级的工具类
 *
 * @author chen
 */
public class LevelUtil {

    public final static String SEPARATOR = ".";

    public final static String ROOT = "0";

    /**
     * 生成部门层级  =  父级部门层级 + 父级部门id
     *
     * @param parentLevel 父级部门层级
     * @param parentId    父级部门id
     * @return
     */
    public static String calculateLevel(String parentLevel, Long parentId) {
        if (parentLevel == null) {
            return ROOT;
        }
        return parentLevel + "." + parentId;
    }

    /**
     * 获取权限模块层级
     *
     * @param aclModuleDao
     * @param aclModuleId  权限模块
     * @return 权限模块层级
     */
    public static String getAclModuleLevel(AclModuleInfoDao aclModuleDao, Long aclModuleId) {
        AclModuleInfo aclModule = aclModuleDao.selectById(aclModuleId);
        if (aclModule == null) {
            return null;
        }
        return aclModule.getLevel();
    }

    public static String getUsergroupLevel(UsergroupInfoDao usergroupInfoDao, Long usergroupId) {
        UsergroupInfo usergroupInfo = usergroupInfoDao.selectById(usergroupId);
        if (usergroupInfo == null) {
            return null;
        }
        return usergroupInfo.getGroupPath();
    }
}
