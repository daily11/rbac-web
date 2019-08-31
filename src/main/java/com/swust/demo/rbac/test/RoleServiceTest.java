package com.swust.demo.rbac.test;


import com.swust.demo.rbac.service.RoleService;

/**
 * 功能描述：角色服务类测试
 */
public class RoleServiceTest {
    //查询测试用角色id
    public static int roleId = 3;

    public static void main(String[] args) {
        RoleService roleService = new RoleService();

        //查询所有的角色
//        List<Role> list1 = roleService.findAllRole();
//        Gson gson1 = new Gson();
//        System.out.println("查询所有的角色点 测试结果："+gson1.toJson(list1));

        //查询单个角色记录
//        Role role = roleService.findRoleById(roleId);
//        Gson gson2 = new Gson();
//        System.out.println("查询单个角色 测试结果："+gson2.toJson(role));

        //新增角色记录
//        RoleParam roleParam = RoleParam.builder()
//                .name("监理员1").operatorName("登录用户1").status(1).type(3).remark("监理员1")
//                .build();
//        roleService.saveRole(roleParam);
//        System.out.println("保存单个角色记录 测试结束");

        //修改角色记录【修改备注为：监理员1测试】
//        Role role = roleService.findRoleById(4);
//        role.setRemark("监理员1测试");
//        roleService.updateRole(role);
//        System.out.println("修改角色记录 测试结束");

        //删除角色记录
//        roleService.deleteRole(4);
//        System.out.println("删除角色记录 测试结束");
    }
}
