package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.bean.UserRole;
import com.swust.demo.rbac.dao.UserRoleDao;
import com.swust.demo.rbac.param.UserRoleParam;
import com.swust.demo.rbac.util.IpUtil;
import com.swust.demo.rbac.util.ParamException;
import com.swust.demo.rbac.util.TimeUtil;

import java.util.List;

/**
 * 功能描述：用户角色业务逻辑操作类
 */
public class UserRoleBiz {
    //用户角色数据持久化操作类
    private UserRoleDao userRoleDao = new UserRoleDao();

    /**
     * 保存用户角色记录
     *
     * @param param 用户上传的参数对象
     */
    public void save(UserRoleParam param) {
        boolean flag = checkExist(param.getRoleId(), param.getUserId());
        if (flag) {
            throw new ParamException("用户角色表存在相同的记录！");
        }
        UserRole userRole = UserRole.builder()
                .roleId(param.getRoleId()).userId(param.getUserId()).operator(param.getOperatorName())
                .build();
        userRole.setOperate_ip(IpUtil.IP_PATH);
        userRole.setOperate_time(TimeUtil.getCurrentTimestamp());
        //用户角色对象入库
        userRoleDao.save(userRole);
        //TODO 操作记录入库！
    }

    /**
     * 检查用户角色记录是否存在
     *
     * @param roleId
     * @param userId
     * @return
     */
    private boolean checkExist(Integer roleId, Integer userId) {
        return userRoleDao.findByArg(roleId, userId).size() > 0;
    }

    /**
     * 查询所有的用户角色
     *
     * @return List<UserRole>
     */
    public List<UserRole> findAllUserRole() {
        return userRoleDao.find();
    }

    /**
     * 查询用户角色
     *
     * @param userRoleId 用户角色Id
     * @return UserRole
     */
    public UserRole findUserRoleById(int userRoleId) {
        return userRoleDao.findById(userRoleId);
    }

    /**
     * 删除用户角色记录
     *
     * @param userRoleId
     */
    public void delete(int userRoleId) {
        userRoleDao.delete(userRoleId);
    }

    /**
     * 删除用户角色记录
     *
     * @param userid 用户id
     */
    public void deleteByUserid(int userid) {
        userRoleDao.deleteByUserid(userid);
    }

    /**
     * 删除用户角色记录
     * @param roleId 角色id
     */
    public void deleteByRoleid(int roleId){
        userRoleDao.deleteByRoleid(roleId);
    }

    /**
     * 更新用户角色记录
     *
     * @param userRole 用户角色记录
     */
    public void update(UserRole userRole) {
        userRoleDao.update(userRole);
    }

    //删除用户id对应的用户角色记录

    /**
     * 绑定用户角色
     *
     * @param roleId
     * @param userIdList
     * @param operator
     */
    public void bindUserRole(int roleId, int[] userIdList, String operator) {
        //根据角色id，删除用户角色关联记录
        userRoleDao.deleteByRoleid(roleId);
        //新增用户角色记录
        for (int i = 0; i < userIdList.length; i++) {
            UserRole userRole = UserRole.builder().roleId(roleId).userId(userIdList[i]).operator(operator).build();
            userRole.setOperate_ip(IpUtil.IP_PATH);
            userRole.setOperate_time(TimeUtil.getCurrentTimestamp());
            userRoleDao.save(userRole);
        }
        //TODO 操作记录入库！
    }

}
