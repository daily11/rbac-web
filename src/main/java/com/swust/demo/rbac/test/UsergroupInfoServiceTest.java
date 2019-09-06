package com.swust.demo.rbac.test;

import com.swust.demo.rbac.bean.UsergroupInfo;
import com.swust.demo.rbac.service.UsergroupInfoService;
import com.swust.demo.rbac.service.impl.UsergroupInfoServiceImpl;

import java.sql.Timestamp;
import java.util.List;

public class UsergroupInfoServiceTest {
    static UsergroupInfoService usergroupInfoService = new UsergroupInfoServiceImpl();

    public static void main(String[] args) {
//        //1 添加记录测试
//        UsergroupInfo usergroupInfo = UsergroupInfo.builder()
//                .groupName("用户组11")
//                .description("b")
//                .groupKey("b")
//                .parentId((long) 16)
//                .groupPath("b")
//                .groupType(2)
//                .gmtCreate(new Timestamp(System.currentTimeMillis()))
//                .gmtModified(new Timestamp(System.currentTimeMillis()))
//                .build();
//        usergroupInfoService.save(usergroupInfo);

//        //2 查询记录测试
//        //2.1 全部查询测试
//        List<UsergroupInfo> list = usergroupInfoService.select();
//        System.out.println(list.toString());
//        //2.2 根据ID查询测试
//        UsergroupInfo UsergroupInfo = usergroupInfoService.selectById((long) 4);
//        System.out.println(UsergroupInfo.toString());

//        //3 更新记录测试
//        UsergroupInfo usergroupInfo = usergroupInfoService.selectById((long) 4);
//        usergroupInfo.setGroupName("c");
//        usergroupInfoService.update(usergroupInfo);

//        //4 删除记录
//        usergroupInfoService.delete((long) 19);
    }
}
