package com.swust.demo.rbac.test;

import com.swust.demo.rbac.dto.AclModuleLevelDto;
import com.swust.demo.rbac.service.TreeService;
import com.swust.demo.rbac.service.impl.TreeServiceImpl;

import java.util.List;

public class TreeServiceTest {
    static TreeServiceImpl treeService = new TreeServiceImpl();

    public static void main(String[] args) {
//        List<AclModuleLevelDto> treeList = treeService.aclModuleTree();
//        System.out.println(treeList.get(0).toString());

//        List<AclModuleLevelDto> list = treeService.aclModuleTreeByUserIdAndname(1, "cyx");
//        System.out.println(list);
    }

    public static void print(List<AclModuleLevelDto> list) {
        for (AclModuleLevelDto levelDto : list) {
            System.out.println(levelDto.getName());
            if (levelDto.getAclModuleList() != null) {
                print(levelDto.getAclModuleList());
            }
        }
    }
}
