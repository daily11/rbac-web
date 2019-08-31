package com.swust.demo.rbac.biz;

import com.swust.demo.rbac.bean.Acl;
import com.swust.demo.rbac.bean.User;
import com.swust.demo.rbac.dao.UserDao;
import com.swust.demo.rbac.param.UserParam;
import com.swust.demo.rbac.util.TimeUtil;

import java.util.List;

/**
 * 功能描述：用户业务逻辑操作类
 */
public class UserBiz {
    //日志业务逻辑操作类
    DBLogBiz logBiz = new DBLogBiz();
    //用户数据持久化操作类
    UserDao userDao = new UserDao();

    /**
     * 查询当前用户的权限
     *
     * @param userid
     */
    public List<Acl> findUserAcls(int userid) {
        return userDao.findUserAcls(userid);
    }

    /**
     * 查询系统预定义给用户对应角色的权限
     * @param userid 用户di
     * @param name 用户名称【同时也是角色名称】
     * @return
     */
    public List<Acl> findUserAclsBySystem(int userid,String name) {
        return userDao.findUserAclsBySystem(userid,name);
    }

    /**
     * 查询系统预定义给用户对应角色的权限
     * @param userid 用户di
     * @param name 用户名称【同时也是角色名称】
     * @return
     */
    public List<Acl> findUserAclsBySingle(int userid,String name) {
        return userDao.findUserAclsBySingle(userid,name);
    }


    /**
     * 新增用户
     *
     * @param param 客户端上传的新增的用户参数
     * @return
     */
    public void save(UserParam param) {
        User user = User.builder().user_name(param.getUser_name()).password(param.getPassword())
                .user_type(param.getUser_type()).description(param.getDescription())
                .account_state(param.getAccount_state())
                .build();
        user.setGmt_modified(TimeUtil.getCurrentTimestamp());

        //保存用户信息
        userDao.save(user);
        //存储操作日志
        logBiz.saveUserLog(null, user);
    }


    /**
     * 查询所有用户信息
     *
     * @return List<User>
     */
    public List<User> findAllUser() {
        return userDao.find();
    }

    /**
     * 查询用户信息
     *
     * @param userid 用户id
     * @return
     */
    public User findUserById(int userid) {
        return userDao.findById(userid);
    }

    /**
     * 删除用户信息
     *
     * @param userId 用户id
     */
    public void delete(int userId) {
        userDao.delete(userId);
    }

    /**
     * 更新用户信息
     *
     * @param user 用户记录
     */
    public void update(User user) {
        userDao.update(user);
    }

}
