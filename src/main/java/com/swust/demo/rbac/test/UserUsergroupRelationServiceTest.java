package com.swust.demo.rbac.test;

import com.swust.demo.rbac.bean.UserUsergroupRelation;
import com.swust.demo.rbac.service.UserUsergroupRelationService;
import com.swust.demo.rbac.service.UserUsergroupRelationService;
import com.swust.demo.rbac.service.impl.UserUsergroupRelationServiceImpl;
import com.swust.demo.rbac.service.impl.UserUsergroupRelationServiceImpl;

import java.sql.Timestamp;
import java.util.List;

public class UserUsergroupRelationServiceTest {
    
    static UserUsergroupRelationService userUsergroupRelationService = new UserUsergroupRelationServiceImpl();

    public static void main(String[] args) {
//        //1 添加记录测试
//        UserUsergroupRelation userUsergroupRelation = UserUsergroupRelation.builder()
//                .userId((long) 2)
//                .userGroupId((long) 3)
//                .gmtCreate(new Timestamp(System.currentTimeMillis()))
//                .gmtModified(new Timestamp(System.currentTimeMillis()))
//                .build();
//        userUsergroupRelationService.save(userUsergroupRelation);

//        //2 查询记录测试
//        //2.1 全部查询测试
//        List<UserUsergroupRelation> list = userUsergroupRelationService.select();
//        System.out.println(list.toString());
//        //2.2 根据ID查询测试
//        UserUsergroupRelation UserUsergroupRelation = userUsergroupRelationService.selectById((long) 4);
//        System.out.println(UserUsergroupRelation.toString());

//        //3 更新记录测试
//        UserUsergroupRelation userUsergroupRelation = userUsergroupRelationService.selectById((long) 4);
//        userUsergroupRelation.setGmtModified(new Timestamp(System.currentTimeMillis()));
//        userUsergroupRelationService.update(userUsergroupRelation);

//        //4 删除记录
//        userUsergroupRelationService.delete((long) 16);
    }
}
