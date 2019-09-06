package com.swust.demo.rbac.test;

import com.swust.demo.rbac.bean.AclInfo;
import com.swust.demo.rbac.service.AclInfoService;
import com.swust.demo.rbac.service.impl.AclInfoServiceImpl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Random;

public class AclInfoServiceTest {

    static AclInfoService aclInfoService = new AclInfoServiceImpl();

    public static void main(String[] args) {
//        //1 添加记录测试
//        AclInfo aclInfo = AclInfo.builder()
//                .code("1")
//                .name("添加用户1")
//                .aclModuleId((long) 1)
//                .url("/delete")
//                .type(1)
//                .status(1)
//                .seq(1)
//                .remark("")
//                .gmtCreate(new Timestamp(System.currentTimeMillis()))
//                .gmtModified(new Timestamp(System.currentTimeMillis()))
//                .build();
//        aclInfoService.save(aclInfo);

//        //2 查询记录测试
//        //2.1 全部查询测试
//        List<AclInfo> list = aclInfoService.select();
//        System.out.println(list.toString());
//        //2.2 根据ID查询测试
//        AclInfo AclInfo = aclInfoService.selectById(1);
//        System.out.println(AclInfo.toString());

//        //3 更新记录测试
//        AclInfo aclInfo = aclInfoService.selectById(1);
//        aclInfo.setName("增加用户");
//        aclInfoService.update(aclInfo);

//        //4 删除记录
        aclInfoService.delete((long) 1);
    }
}
