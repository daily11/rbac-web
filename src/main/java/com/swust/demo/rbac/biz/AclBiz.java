package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.bean.Acl;
import com.swust.demo.rbac.dao.AclDao;
import com.swust.demo.rbac.dao.RoleAclDao;
import com.swust.demo.rbac.param.AclParam;
import com.swust.demo.rbac.util.IpUtil;
import com.swust.demo.rbac.util.ParamException;
import com.swust.demo.rbac.util.TimeUtil;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 功能描述：权限业务逻辑操作类
 */
public class AclBiz {
    //日志业务逻辑操作类
    DBLogBiz logBiz = new DBLogBiz();
    //权限数据持久化操作类
    AclDao aclDao = new AclDao();
    //角色权限数据持久化操作类
    RoleAclDao roleAcl = new RoleAclDao();

    /**
     * 新增权限表
     *
     * @param param 客户端上传的新增的权限表参数
     * @return
     */
    public void save(AclParam param) {
        if (checkExist(param.getAclModuleId(), param.getName())) {
            throw new ParamException("当前权限模块下面存在相同名称的权限点");
        }

        Acl acl = Acl.builder().name(param.getName()).operator(param.getOperatorName()).aclModuleId(param.getAclModuleId()).url(param.getUrl())
                .type(param.getType()).status(param.getStatus()).seq(param.getSeq()).remark(param.getRemark()).build();
        acl.setCode(generateCode());
        acl.setOperate_ip(IpUtil.IP_PATH);
        acl.setOperate_time(TimeUtil.getCurrentTimestamp());

        //保存权限点
        aclDao.save(acl);
        //存储操作日志
        logBiz.saveAclLog(null, acl);
    }

    /**
     * 检查权限是否存在
     *
     * @param aclModuleId 权限所在的权限模块id
     * @param aclName     权限名称
     * @return
     */
    private boolean checkExist(Integer aclModuleId, String aclName) {
        return aclDao.findByArg(aclModuleId, aclName).size() > 0;
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
     * 查询所有的权限点
     *
     * @return
     */
    public List<Acl> findAllAcl() {
        return aclDao.find();
    }

    /**
     * 查询权限点
     *
     * @param aclid 权限id
     * @return
     */
    public Acl findAclById(int aclid) {
        return aclDao.findById(aclid);
    }

    /**
     * 删除权限点记录
     *
     * @param aclId 权限点id
     */
    public void delete(int aclId) {
        //删除权限点
        aclDao.delete(aclId);
        //删除 权限点+ 角色 记录
        roleAcl.deleteByAclId(aclId);
    }

    /**
     * 更新权限点
     *
     * @param acl 权限点记录
     */
    public void update(Acl acl) {
        aclDao.update(acl);
    }

}
