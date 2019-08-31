package com.swust.demo.rbac.test;

import com.swust.demo.rbac.service.AclModuleService;

/**
 * 功能说明：权限模块功能测试
 */
public class AclModuleServiceTest {
    //测试用权限模块id
    public static int aclModuleId = 3;

    public static void main(String[] args) {
        //权限模块服务类
        AclModuleService aclModuleService = new AclModuleService();

        //查询所有的权限模块
//        List<AclModule> list1 = aclModuleService.findAllAclModule();
//        Gson gson1 = new Gson();
//        System.out.println("查询所有的权限模块 测试结果：" + gson1.toJson(list1));

        //查询单个权限模块
//        AclModule aclModule = aclModuleService.findAclModuleById(aclModuleId);
//        Gson gson2 = new Gson();
//        System.out.println("查询单个权限模块 测试结果：" + gson2.toJson(aclModule));

        //增加一个权限管理模块
//        AclModuleParam aclModuleParam = AclModuleParam.builder()
//                .name("用户管理1").operatorName("登录用户1").parentId(3)
//                .seq(1).status(1).remark("用户管理模块1")
//                .build();
//        aclModuleService.saveAclModule(aclModuleParam);
//        System.out.println("保存权限模块 测试结束");

        //修改权限管理模块
//        AclModule aclModule = aclModuleService.findAclModuleById(4);
//        aclModule.setRemark("用户管理模块1测试");
//        aclModuleService.updateAclModule(aclModule);
//        System.out.println("修改权限模块 测试结束");

        //删除权限管理模块
//        aclModuleService.deleteAclModule(4);
//        System.out.println("删除权限模块 测试结束");
    }
}
