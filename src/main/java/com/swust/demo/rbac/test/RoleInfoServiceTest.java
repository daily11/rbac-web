package com.swust.demo.rbac.test;

import com.swust.demo.rbac.bean.RoleInfo;
import com.swust.demo.rbac.service.AclInfoService;
import com.swust.demo.rbac.service.RoleInfoService;
import com.swust.demo.rbac.service.impl.AclInfoServiceImpl;
import com.swust.demo.rbac.service.impl.RoleInfoServiceImpl;

import java.sql.Timestamp;
import java.util.List;

public class RoleInfoServiceTest {

    static RoleInfoService roleInfoService = new RoleInfoServiceImpl();

    public static void main(String[] args) {
//        //1 添加记录测试
//        RoleInfo aclInfo = RoleInfo.builder()
//                .name("巡查员")
//                .type(2)
//                .status(1)
//                .remark("222")
//                .gmtCreate(new Timestamp(System.currentTimeMillis()))
//                .gmtModified(new Timestamp(System.currentTimeMillis()))
//                .build();
//        roleInfoService.save(aclInfo);

//        //2 查询记录测试
//        //2.1 全部查询测试
//        List<RoleInfo> list = roleInfoService.select();
//        System.out.println(list.toString());
//        //2.2 根据ID查询测试
//        RoleInfo AclInfo = roleInfoService.selectById((long) 1);
//        System.out.println(AclInfo.toString());

//        //3 更新记录测试
//        RoleInfo aclInfo = roleInfoService.selectById(2);
//        aclInfo.setRemark("aasdfadf");
//        roleInfoService.update(aclInfo);

//        //4 删除记录
        roleInfoService.delete((long) 13);
    }
}