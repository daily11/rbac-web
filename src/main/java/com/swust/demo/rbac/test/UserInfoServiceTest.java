package com.swust.demo.rbac.test;

import com.swust.demo.rbac.bean.AclInfo;
import com.swust.demo.rbac.bean.UserInfo;
import com.swust.demo.rbac.dto.AclModuleLevelDto;
import com.swust.demo.rbac.service.UserInfoService;
import com.swust.demo.rbac.service.UserInfoService;
import com.swust.demo.rbac.service.impl.UserInfoServiceImpl;
import com.swust.demo.rbac.service.impl.UserInfoServiceImpl;

import java.sql.Timestamp;
import java.util.List;

public class UserInfoServiceTest {
    static UserInfoService userInfoService = new UserInfoServiceImpl();

    public static void main(String[] args) {
//        //1 添加记录测试
//        UserInfo userInfo = UserInfo.builder()
//                .userName("yang")
//                .password("123456")
//                .userType(1)
//                .description("yang")
//                .accountState(1)
//                .gmtCreate(new Timestamp(System.currentTimeMillis()))
//                .gmtModified(new Timestamp(System.currentTimeMillis()))
//                .build();
//        userInfoService.save(userInfo);

//        //2 查询记录测试
//        //2.1 全部查询测试
//        List<UserInfo> list = userInfoService.select();
//        System.out.println(list.toString());
//        //2.2 根据ID查询测试
//        UserInfo UserInfo = userInfoService.selectById((long) 1);
//        System.out.println(UserInfo.toString());

//        //3 更新记录测试
        UserInfo userInfo = userInfoService.selectById((long) 15);
        userInfo.setUserName("yang^_^");
        userInfoService.update(userInfo);

//        //4 删除记录
//        userInfoService.delete((long) 14);

//        //5 用户权限测试
//        List<AclInfo> list = userInfoService.selectUserAcls((long) 2);
//        System.out.println(list.toString());

//        //6 查询系统分配给用户的权限
//        List<AclInfo> list = userInfoService.selectUserAclsBySystem(1, "cyx");
//        System.out.println(list.toString());

//        //7 查询用户自定义的权限
//        List<AclInfo> list = userInfoService.selectUserAclsBySingle(1, "cyx");
//        System.out.println(list.toString());

    }
}
