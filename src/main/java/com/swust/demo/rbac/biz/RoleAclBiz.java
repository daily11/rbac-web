package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.bean.RoleAcl;
import com.swust.demo.rbac.dao.RoleAclDao;
import com.swust.demo.rbac.param.RoleAclParam;
import com.swust.demo.rbac.param.RoleAclViewParam;
import com.swust.demo.rbac.util.IpUtil;
import com.swust.demo.rbac.util.ParamException;
import com.swust.demo.rbac.util.TimeUtil;

import java.util.List;

/**
 * 功能描述：角色权限业务逻辑操作类
 */
public class RoleAclBiz {
    //用户角色权限数据持久化操作类
    private RoleAclDao roleAclDao = new RoleAclDao();

    /**
     * 保存用户角色记录
     *
     * @param param 用户上传的参数对象
     */
    public void save(RoleAclParam param) {
        boolean flag = checkExist(param.getRoleId(), param.getAclId());
        if (flag) {
            throw new ParamException("角色权限表存在相同的记录！");
        }
        RoleAcl userRole = RoleAcl.builder()
                .roleId(param.getRoleId()).aclId(param.getAclId()).operator(param.getOperatorName())
                .build();
        userRole.setOperate_ip(IpUtil.IP_PATH);
        userRole.setOperate_time(TimeUtil.getCurrentTimestamp());
        //用户角色对象入库
        roleAclDao.save(userRole);
        //TODO 操作记录入库！
    }

    /**
     * 检查用户角色记录是否存在
     *
     * @param roleId
     * @param aclId
     * @return
     */
    private boolean checkExist(Integer roleId, Integer aclId) {
        return roleAclDao.findByArg(roleId, aclId).size() > 0;
    }

    /**
     * 查询所有的角色权限
     *
     * @return List<RoleAcl>
     */
    public List<RoleAcl> findAllRoleAcl() {
        return roleAclDao.find();
    }

    /**
     * 查询所有的角色权限，不同的是权限不再是id，而是具体名字
     * @param rolename 角色名
     * @return
     */
    public List<RoleAclViewParam> findAllRoleAcl(String rolename) {
        return roleAclDao.find(rolename);
    }

    /**
     * 查询角色权限
     *
     * @param roleAclId 角色权限id
     * @return RoleAcl
     */
    public RoleAcl findRoleAclById(int roleAclId) {
        return roleAclDao.findById(roleAclId);
    }

    /**
     * 删除角色权限记录
     *
     * @param roleAclId 角色权限id
     */
    public void delete(int roleAclId) {
        roleAclDao.delete(roleAclId);
    }

    /**
     * 更新角色权限记录
     *
     * @param roleAcl 角色权限记录
     */
    public void update(RoleAcl roleAcl) {
        roleAclDao.update(roleAcl);
    }

}
