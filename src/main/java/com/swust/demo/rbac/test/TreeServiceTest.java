package com.swust.demo.rbac.test;

import com.swust.demo.rbac.service.TreeService;

/**
 * 功能描述：权限层级树服务类
 */
public class TreeServiceTest {
    //测试的用户ID
    public static int userId = 4;

    public static void main(String[] args) {
        //权限层级树服务类
        TreeService treeService = new TreeService();

//        权限层级树测试
//        List<AclModuleLevelDto> list1 = treeService.aclModuleTree();
//        Gson gson1 = new Gson();
//        System.out.println("权限层级树 测试结果："+gson1.toJson(list1));

//        个人权限测试
//        List<Acl> list2 = treeService.userAcls(userId);
//        Gson gson2 = new Gson();
//        System.out.println("个人权限 测试结果："+gson2.toJson(list2));

        //个人角色权限测试
//        List<Acl> list4 = treeService.findUserAclsBySingle(userId,"xc");
//        Gson gson4 = new Gson();
//        System.out.println("个人权限 测试结果：" + gson4.toJson(list4));

        //个人权限层级树测试
//        List<AclModuleLevelDto> list3 = treeService.userAclModuleTree(userId);
//        Gson gson3 = new Gson();
//        System.out.println("个人权限层级树 测试结果："+gson3.toJson(list3));
    }
}
