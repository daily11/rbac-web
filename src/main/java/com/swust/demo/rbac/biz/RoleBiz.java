package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.bean.Role;
import com.swust.demo.rbac.dao.RoleAclDao;
import com.swust.demo.rbac.dao.RoleDao;
import com.swust.demo.rbac.dao.UserRoleDao;
import com.swust.demo.rbac.param.RoleParam;
import com.swust.demo.rbac.util.IpUtil;
import com.swust.demo.rbac.util.ParamException;
import com.swust.demo.rbac.util.TimeUtil;

import java.util.List;

/**
 * 功能描述：角色业务逻辑操作类
 */
public class RoleBiz {
    //日志业务逻辑操作类
    DBLogBiz logBiz = new DBLogBiz();
    //角色数据持久化操作类
    RoleDao roleDao = new RoleDao();
    //角色用户数据持久化操作类
    UserRoleDao userRoleDao = new UserRoleDao();
    //角色权限点数据持久化操作类
    RoleAclDao roleAclDao = new RoleAclDao();

    /**
     * 新增用户
     *
     * @param param 客户端上传的新增的用户参数
     * @return
     */
    public void save(RoleParam param) {
        if (checkExist(param.getName())) {
            throw new ParamException("角色名称已经存在");
        }
        Role role = Role.builder().name(param.getName()).operator(param.getOperatorName()).status(param.getStatus()).type(param.getType())
                .remark(param.getRemark()).build();
        role.setOperate_time(TimeUtil.getCurrentTimestamp());
        role.setOperate_ip(IpUtil.IP_PATH);

        //保存角色信息
        roleDao.save(role);
        //存储操作日志
        logBiz.saveRoleLog(null, role);
    }

    /**
     * 查询角色名称是否已被占用
     *
     * @param name 角色名称
     * @return
     */
    private boolean checkExist(String name) {
        if (roleDao.findByArg(name).size() > 0) {
            return true;
        }
        return false;
    }

    /**
     * 查询所有的角色信息
     *
     * @return List<Role>
     */
    public List<Role> findAllRole() {
        return roleDao.find();
    }

    /**
     * 查询角色信息
     *
     * @param roleid 角色id
     * @return
     */
    public Role findRoleById(int roleid) {
        return roleDao.findById(roleid);
    }

    /**
     * 删除角色记录
     *
     * @param roleId 角色id
     */
    public void delete(int roleId) {
        //1 删除角色记录
        roleDao.delete(roleId);
        //2 删除角色用户关联表
        userRoleDao.deleteByRoleid(roleId);
        //3 删除角色权限点关联表
        roleAclDao.deleteByRoleId(roleId);
    }

    /**
     * 删除角色记录
     *
     * @param roleName 角色名
     */
    public void deleteRoleByName(String roleName) {
        roleDao.deleteRoleByName(roleName);
    }

    /**
     * 更新角色
     *
     * @param role 角色
     */
    public void update(Role role) {
        roleDao.update(role);
    }

}
