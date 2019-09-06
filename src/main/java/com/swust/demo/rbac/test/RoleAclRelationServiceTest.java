package com.swust.demo.rbac.test;


import com.swust.demo.rbac.bean.RoleAclRelation;
import com.swust.demo.rbac.service.RoleAclRelationService;
import com.swust.demo.rbac.service.impl.RoleAclRelationServiceImpl;

import java.sql.Timestamp;
import java.util.List;

public class RoleAclRelationServiceTest {

    static RoleAclRelationService roleAclRelationService = new RoleAclRelationServiceImpl();

    public static void main(String[] args) {
//        //1 添加记录测试
//        RoleAclRelation roleAclRelation = RoleAclRelation.builder().aclId(1).roleId(2)
//                .gmtCreate(new Timestamp(System.currentTimeMillis()))
//                .gmtModified(new Timestamp(System.currentTimeMillis()))
//                .build();
//        roleAclRelationService.save(roleAclRelation);

//        //2 查询记录测试
//        //2.1 全部查询测试
//        List<RoleAclRelation> list = roleAclRelationService.select();
//        System.out.println(list.toString());
//        //2.2 根据ID查询测试
//        RoleAclRelation roleAclRelation = roleAclRelationService.selectById(2);
//        System.out.println(roleAclRelation.toString());

//        //3 更新记录测试
//        RoleAclRelation roleAclRelation = roleAclRelationService.selectById(2);
//        roleAclRelation.setGmtModified(new Timestamp(System.currentTimeMillis()));
//        roleAclRelationService.update(roleAclRelation);

//        //4 删除记录
//        roleAclRelationService.delete(2);
    }
}
