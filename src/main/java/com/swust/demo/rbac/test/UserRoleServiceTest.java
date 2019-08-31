package com.swust.demo.rbac.test;

import com.swust.demo.rbac.service.UserRoleService;

/**
 * 功能描述：用户角色服务类测试
 */
public class UserRoleServiceTest {
    //查询用户角色用的用户角色id
    public static int userRoleId = 3;

    public static void main(String[] args) {
        UserRoleService userRoleService = new UserRoleService();

        //查询所有的用户角色
//        List<UserRole> list1 = userRoleService.findUserRole();
//        Gson gson1 = new Gson();
//        System.out.println("查询所有的用户角色 测试结果：" + gson1.toJson(list1));

        //查询用户角色
//        UserRole userRole = userRoleService.findUserRoleById(userRoleId);
//        Gson gson2 = new Gson();
//        System.out.println("查询权限点 测试结果：" + gson2.toJson(userRole));

        //新增用户角色
//        UserRoleParam userRoleParam = UserRoleParam.builder()
//                .roleId(1).userId(4).operatorName("登录用户1")
//                .build();
//        userRoleService.saveUserRole(userRoleParam);
//        System.out.println("保存用户角色 测试结束");

        //修改用户角色【更改操作员为：登录用户1测试】
//        UserRole userRole = userRoleService.findUserRoleById(4);
//        userRole.setOperator("登录用户1测试");
//        userRoleService.updateUserRole(userRole);
//        System.out.println("修改用户角色 测试结束");

        //删除用户角色
//        userRoleService.deleteUserRole(4);
//        System.out.println("删除用户角色 测试结束");
    }
}
