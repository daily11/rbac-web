package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.bean.*;
import com.swust.demo.rbac.dao.AclDao;
import com.swust.demo.rbac.dao.AclModuleDao;
import com.swust.demo.rbac.param.AclModuleParam;
import com.swust.demo.rbac.util.*;

import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：权限模块业务逻辑操作类
 */
public class AclModuleBiz {
    //日志业务逻辑操作类
    DBLogBiz logBiz = new DBLogBiz();
    //权限模块数据持久化操作类
    AclModuleDao aclModuleDao = new AclModuleDao();
    //权限点数据持久化操作类
    AclDao aclDao = new AclDao();

    /**
     * 新增权限模块
     *
     * @param param 客户端上传的新增的权限模块参数
     * @return
     */
    public void save(AclModuleParam param) {
        boolean flag = checkExist(param.getParentId(), param.getName());
        if (flag) {
            throw new ParamException("同一层级下存在相同名称的权限模块");
        }
        //要插入数据库的一条部门记录
        AclModule aclModule = AclModule.builder().name(param.getName()).operator(param.getOperatorName()).parentId(param.getParentId())
                .seq(param.getSeq()).status(param.getStatus()).remark(param.getRemark()).build();
        //当前层级 = 父级部门层级+父级部门id
        aclModule.setLevel(LevelUtil.calculateLevel(
                LevelUtil.getAclModuleLevel(aclModuleDao, param.getParentId()), param.getParentId()));
        aclModule.setOperateIp(IpUtil.IP_PATH);
        aclModule.setOperateTime(TimeUtil.getCurrentTimestamp());
//        Log.sop(dept.toString());

        //保存权限模块
        aclModuleDao.save(aclModule);
        //存储操作日志
        logBiz.saveAclModuleLog(null, aclModule);
    }


    /**
     * 检查权限模块是否存在
     *
     * @param parentId      上级权限模块id
     * @param aclModuleName 权限模块名称
     * @return
     */
    private boolean checkExist(Integer parentId, String aclModuleName) {
        return aclModuleDao.findByArg(parentId, aclModuleName).size() > 0;
    }

    /**
     * 查询所有的权限模块
     *
     * @return
     */
    public List<AclModule> findAllAclModule() {
        return aclModuleDao.find();
    }

    /**
     * 查询权限模块
     *
     * @param aclModuleId 权限模块id
     * @return AclModule
     */
    public AclModule findAclModuleById(int aclModuleId) {
        return aclModuleDao.findById(aclModuleId);
    }

    /**
     * 删除权限模块记录
     * 级联删除该模块下的    子权限模块 + 功能点
     *
     * @param aclModuleId 权限模块id
     */
    public void delete(int aclModuleId) {
        AclModule deleteAclModule = null;
        //1 删除子权限模块对应的权限点
        //1.1 查询所有的权限模块信息
        List<AclModule> aclModuleList = aclModuleDao.find();
        //1.2 查找到需要删除的子权限模块
        List<AclModule> sonAclModules = new ArrayList<>();
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
            AclModule sonAclModule = sonAclModules.get(i);
            aclDao.deleteByAclModuleId(sonAclModule.getId());
        }
        //2  删除需要删除的权限模块记录对应的权限点
        aclDao.deleteByAclModuleId(aclModuleId);
        //3  删除子权限模块
        for (int i = 0; i < sonAclModulesLen; i++) {
            AclModule sonAclModule = sonAclModules.get(i);
            aclModuleDao.delete(sonAclModule.getId());
        }
        //4  删除该权限模块
        aclModuleDao.delete(aclModuleId);
    }

    /**
     * 更新权限模块记录
     *
     * @param aclModule 权限模块记录
     */
    public void update(AclModule aclModule) {
        aclModuleDao.update(aclModule);
    }


}
