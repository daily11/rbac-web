package com.swust.demo.rbac.service;

import com.swust.demo.rbac.bean.User;
import com.swust.demo.rbac.biz.UserBiz;
import com.swust.demo.rbac.param.UserParam;

import java.util.List;

/**
 * 功能描述：对外提供的用户服务类
 */
public class UserService {
    //用户业务逻辑操作类
    UserBiz userBiz = new UserBiz();

    /**
     * 添加用户记录
     *
     * @param param 客户端上传的用户参数
     */
    public void saveUser(UserParam param) {
        userBiz.save(param);
    }

    /**
     * 删除用户记录
     *
     * @param userId 用户id
     */
    public void deleteUser(int userId) {
        userBiz.delete(userId);
    }

    /**
     * 查询所有用户信息
     */
    public List<User> findAllUser() {
        return userBiz.findAllUser();
    }

    /**
     * 查询用户信息
     *
     * @param userid 用户id
     */
    public User findUserById(int userid) {
        return userBiz.findUserById(userid);
    }

    /**
     * 更新用户信息
     *
     * @param user 修改后的用户记录
     */
    public void updateUser(User user) {
        userBiz.update(user);
    }

}
