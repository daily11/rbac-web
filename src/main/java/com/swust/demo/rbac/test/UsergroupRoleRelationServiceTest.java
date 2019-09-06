package com.swust.demo.rbac.test;

import com.swust.demo.rbac.bean.UsergroupRoleRelation;
import com.swust.demo.rbac.service.UsergroupRoleRelationService;
import com.swust.demo.rbac.service.UsergroupRoleRelationService;
import com.swust.demo.rbac.service.impl.UsergroupRoleRelationServiceImpl;
import com.swust.demo.rbac.service.impl.UsergroupRoleRelationServiceImpl;

import java.sql.Timestamp;
import java.util.List;

public class UsergroupRoleRelationServiceTest {

    static UsergroupRoleRelationService usergroupRoleRelationService = new UsergroupRoleRelationServiceImpl();

    public static void main(String[] args) {
//        //1 添加记录测试
//        UsergroupRoleRelation usergroupRoleRelation = UsergroupRoleRelation.builder()
//                .userGroupId((long) 1)
//                .roleId((long) 2)
//                .gmtCreate(new Timestamp(System.currentTimeMillis()))
//                .gmtModified(new Timestamp(System.currentTimeMillis()))
//                .build();
//        usergroupRoleRelationService.save(usergroupRoleRelation);

//        //2 查询记录测试
//        //2.1 全部查询测试
//        List<UsergroupRoleRelation> list = usergroupRoleRelationService.select();
//        System.out.println(list.toString());
//        //2.2 根据ID查询测试
//        UsergroupRoleRelation UsergroupRoleRelation = usergroupRoleRelationService.selectById((long) 2);
//        System.out.println(UsergroupRoleRelation.toString());

//        //3 更新记录测试
//        UsergroupRoleRelation usergroupRoleRelation = usergroupRoleRelationService.selectById((long) 2);
//        usergroupRoleRelation.setGmtModified(new Timestamp(System.currentTimeMillis()));
//        usergroupRoleRelationService.update(usergroupRoleRelation);

//        //4 删除记录
        usergroupRoleRelationService.delete((long) 13);
    }
}
