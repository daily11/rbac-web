package com.swust.demo.rbac.test;


import com.swust.demo.rbac.bean.AclModuleInfo;
import com.swust.demo.rbac.service.AclModuleInfoService;
import com.swust.demo.rbac.service.impl.AclModuleInfoServiceImpl;

import java.sql.Timestamp;
import java.util.List;

public class AclModuleInfoServiceImplTest {

    static AclModuleInfoService aclModuleInfoService = new AclModuleInfoServiceImpl();

    public static void main(String[] args) {
//        //1 添加记录测试
        AclModuleInfo AclModuleInfo = com.swust.demo.rbac.bean.AclModuleInfo.builder()
                .name("查询模块")
                .parentId((long) 1)
                .level("1.3")
                .seq(1)
                .status(1)
                .remark("asdf")
                .gmtCreate(new Timestamp(System.currentTimeMillis()))
                .gmtModified(new Timestamp(System.currentTimeMillis()))
                .build();
        aclModuleInfoService.save(AclModuleInfo);

//        //2 查询记录测试
//        //2.1 全部查询测试
//        List<AclModuleInfo> list = aclModuleInfoService.select();
//        System.out.println(list.toString());
//        //2.2 根据ID查询测试
//        AclModuleInfo AclModuleInfo = aclModuleInfoService.selectById(1);
//        System.out.println(AclModuleInfo.toString());

//        //3 更新记录测试
//        AclModuleInfo aclModuleInfo = aclModuleInfoService.selectById(3);
//        aclModuleInfo.setSeq(2);
//        aclModuleInfoService.update(aclModuleInfo);

//        //4 删除记录
//        aclModuleInfoService.delete((long) 2);
    }
}
