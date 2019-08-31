package com.swust.demo.rbac.test;


import com.google.gson.Gson;
import com.swust.demo.rbac.bean.Acl;
import com.swust.demo.rbac.service.AclService;

import java.util.List;

/**
 * 功能描述：权限服务类测试
 */
public class AclServiceTest {
    //查询权限点id
    public static int aclid = 4;

    public static void main(String[] args) {
        //权限服务类
        AclService aclService = new AclService();

        //查询所有的权限点
        List<Acl> list1 =  aclService.findAllAcl();
        Gson gson1 = new Gson();
        System.out.println("查询所有的权限点 测试结果："+gson1.toJson(list1));

        //根据权限点id，查询权限点
//        Acl acl = aclService.findAclById(aclid);
//        Gson gson2 = new Gson();
//        System.out.println("查询权限点 测试结果："+gson2.toJson(acl));

        //添加权限点
//        AclParam aclParam = AclParam.builder()
//                .name("测试角色1").operatorName("登录用户1").aclModuleId(2).url("sys/role/test1")
//                .type(2).status(1).seq(5).remark("hha")
//                .build();
//        aclService.saveAcl(aclParam);
//        System.out.println("保存权限点 测试结束");

        //修改权限点【修改备注】
//        Acl acl = aclService.findAclById(9);
//        acl.setRemark("登录用户1的备注");
//        aclService.updateAcl(acl);
//        System.out.println("修改权限点 测试结束");

//        删除权限点
//        aclService.deleteAcl(41);
//        System.out.println("删除权限点 测试结束");
    }
}
