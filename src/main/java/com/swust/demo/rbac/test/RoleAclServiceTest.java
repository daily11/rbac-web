package com.swust.demo.rbac.test;

import com.swust.demo.rbac.service.RoleAclService;

/**
 * 功能描述：角色权限服务类测试
 */
public class RoleAclServiceTest {
    public static  int roleAclId = 12;

    public static void main(String[] args) {
        RoleAclService roleAclService = new RoleAclService();

        //查询所有的角色权限
//        List<RoleAcl> list1 =  roleAclService.findAllRoleAcl ();
//        Gson gson1 = new Gson();
//        System.out.println("查询所有的权限角色点 测试结果："+gson1.toJson(list1));

        //查询单个权限角色记录
//        RoleAcl roleAcl =  roleAclService.findRoleAclById (roleAclId);
//        Gson gson2 = new Gson();
//        System.out.println("查询单个权限角色点 测试结果："+gson2.toJson(roleAcl));

        //新增权限角色记录
//        RoleAclParam roleAclParam = RoleAclParam.builder()
//                .roleId(3).aclId(6).operatorName("登录用户1")
//                .build();
//        roleAclService.saveRoleAcl(roleAclParam);
//        System.out.println("保存角色权限点 测试结束");

        //修改权限角色记录【操作员修改为：登录用户1测试】
//        RoleAcl roleAcl =  roleAclService.findRoleAclById (13);
//        roleAcl.setOperator("登录用户1测试");
//        roleAclService.updateRoleAcl(roleAcl);
//        System.out.println("修改权限角色点 测试结束");

        //删除权限角色记录
//        roleAclService.deleteRoleAcl(13);
//        System.out.println("删除权限角色点 测试结束");

    }
}
