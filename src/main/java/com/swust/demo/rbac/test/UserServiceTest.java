package com.swust.demo.rbac.test;


import com.swust.demo.rbac.service.UserService;

public class UserServiceTest {
    public static int userId = 4;

    public static void main(String[] args) {
        UserService userService = new UserService();

        //查询所有用户信息
//        List<User> list1 =  userService.findAllUser();
//        Gson gson1 = new Gson();
//        System.out.println("查询所有的用户信息 测试结果："+gson1.toJson(list1));

        //查询单个用户信息
//        User user = userService.findUserById(userId);
//        Gson gson2 = new Gson();
//        System.out.println("查询单个用户信息 测试结果：" + gson2.toJson(user));

        //添加用户信息
//        UserParam userParam = UserParam.builder()
//                .user_name("t1").password("t1").user_type(6203).description("巡查员")
//                .account_state(1)
//                .build();
//        userService.saveUser(userParam);
//        System.out.println("保存用户信息 测试结束");

        //修改用户信息【密码设置为t11】
//        User user = userService.findUserById(94);
//        user.setPassword("t11");
//        System.out.println(user);
//        userService.updateUser(user);
//        System.out.println("修改用户信息 测试结束");

        //删除用户信息
//        userService.deleteUser(94);
//        System.out.println("删除用户信息 测试结束");
    }
}
