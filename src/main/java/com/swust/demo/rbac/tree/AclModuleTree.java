package com.swust.demo.rbac.tree;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Lists;
import com.google.common.collect.Multimap;
import com.swust.demo.rbac.bean.AclInfo;
import com.swust.demo.rbac.bean.AclModuleInfo;
import com.swust.demo.rbac.dao.AclInfoDao;
import com.swust.demo.rbac.dao.AclModuleInfoDao;
import com.swust.demo.rbac.dto.AclInfoDto;
import com.swust.demo.rbac.dto.AclModuleLevelDto;
import com.swust.demo.rbac.util.LevelUtil;
import org.apache.commons.collections.CollectionUtils;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

public class AclModuleTree {

    //权限模块数据持久化操作类
    AclModuleInfoDao aclModuleDao = new AclModuleInfoDao();
    //权限数据持久化操作类
    AclInfoDao aclDao = new AclInfoDao();

    /**
     * 获取权限模块层级树【对外提供的方法】
     *
     * @return List<AclModuleLevelDto>
     */
    public List<AclModuleLevelDto> aclModuleTree() {
        //查询所有权限模块信息
        List<AclModuleInfo> aclModuleList = aclModuleDao.select();
//        System.out.println(aclModuleList.toString());

        //将List<AclModule>转为List<AclModuleLevelDto>
        List<AclModuleLevelDto> dtoList = Lists.newArrayList();
        for (AclModuleInfo aclModule : aclModuleList) {
            dtoList.add(AclModuleLevelDto.adapt(aclModule));
        }
//        System.out.println(dtoList.toString());

        return aclModuleListToTree(dtoList);
    }

    /**
     * 1 获取权限模块层级树【业务逻辑操作】
     *
     * @param dtoList 权限模块集合
     * @return
     */
    public List<AclModuleLevelDto> aclModuleListToTree(List<AclModuleLevelDto> dtoList) {
        if (CollectionUtils.isEmpty(dtoList)) {
            return Lists.newArrayList();
        }
        //Multimap含义：  level -> [aclmodule1, aclmodule2, ...]， 相当于Map<String, List<Object>>，不同的是同一个String对应的value放进去，不会覆盖List<Object>，而会组装进入这个List中
        Multimap<String, AclModuleLevelDto> levelAclModuleMap = ArrayListMultimap.create();
        //根层级权限点集合
        List<AclModuleLevelDto> rootList = Lists.newArrayList();

        for (AclModuleLevelDto dto : dtoList) {
            //1.1 将每一个层级的权限模块信息组装成集合
            levelAclModuleMap.put(dto.getLevel(), dto);
            //1.2 组装根层级权限模块信息
            if (LevelUtil.ROOT.equals(dto.getLevel())) {
                rootList.add(dto);
            }
        }

        //1.3 根层级权限模块按照seq属性排序
        Collections.sort(rootList, new Comparator<AclModuleLevelDto>() {
            public int compare(AclModuleLevelDto o1, AclModuleLevelDto o2) {
                return o1.getSeq() - o2.getSeq();
            }
        });

//        System.out.println(rootList.toString());

        /**
         * 1.4 递归组装权限模块层级树
         * @param rootList            当前层级的权限模块集合
         * @param LevelUtil.ROOT      当前层级
         * @param levelAclModuleMap   各层级的权限模块集合
         */
        transformAclModuleTree(rootList, LevelUtil.ROOT, levelAclModuleMap);

//        System.out.println(rootList.toString());

        /**
         * 1.5 递归更新层级树，使其格式符合前端标准
         */
        for (int i = 0; i < rootList.size(); i++) {
            updateTree(rootList.get(i));
        }

        return rootList;
    }

    /**
     * 更新层级树，使其格式符合前端标准
     *
     * @param aclModuleLevelDto
     */
    public void updateTree(AclModuleLevelDto aclModuleLevelDto) {

        //子权限模块
        List<AclModuleLevelDto> moduleList = aclModuleLevelDto.getAclModuleList();
        //子权限点
        List<AclInfoDto> aclList = aclModuleLevelDto.getAclList();

        /**
         * 1 如果aclList不为空，则将里面的对象转成AclModuleLevelDto格式，然后放到参数aclModuleLevelDto里面的子权限模块数组中
         */
        if (aclList.size() > 0) {
            for (int i = 0; i < aclList.size(); i++) {
                AclInfoDto aclDto = aclList.get(i);

                AclModuleLevelDto AclModuleLevelDtoJson = new AclModuleLevelDto();
                AclModuleLevelDtoJson.setId(aclDto.getId());
                //设置idName，唯一识别号
                AclModuleLevelDtoJson.setIdName("" + aclDto.getId());
                AclModuleLevelDtoJson.setName(aclDto.getName());
                AclModuleLevelDtoJson.setParentId((long) 1);
                AclModuleLevelDtoJson.setLevel("0.1");
                AclModuleLevelDtoJson.setSeq(1);
                AclModuleLevelDtoJson.setStatus(1);
                AclModuleLevelDtoJson.setRemark("");
                AclModuleLevelDtoJson.setGmtCreate(new Timestamp(System.currentTimeMillis()));
                AclModuleLevelDtoJson.setGmtModified(new Timestamp(System.currentTimeMillis()));

                moduleList.add(AclModuleLevelDtoJson);
            }
            //2 置空子权限点
            aclModuleLevelDto.setAclList(Lists.newArrayList());
        }

        /**
         * 3 如果moduleList不为空，则遍历里面的对象，找到子权限点，并执行子权限点向AclModuleLevelDto格式转换
         */
        if (moduleList.size() > 0) {
            for (int j = 0; j < moduleList.size(); j++) {
                AclModuleLevelDto aclModuleLevelDto1 = moduleList.get(j);
                //递归更新权限层级树，使其符合前端标准
                updateTree(aclModuleLevelDto1);
            }
        }

    }

    /**
     * 递归组装权限模块层级树
     *
     * @param rootList          当前层级的权限模块集合
     * @param level             当前层级
     * @param levelAclModuleMap 各层级的权限模块集合
     */
    public void transformAclModuleTree(List<AclModuleLevelDto> rootList, String level, Multimap<String, AclModuleLevelDto> levelAclModuleMap) {
        //2 遍历当前层级
        for (int i = 0; i < rootList.size(); i++) {
            //2.1 获取第i个层级权限模块
            AclModuleLevelDto dto = rootList.get(i);
            dto.setIdName(dto.getId() + "key");
            //2.2 获取第i个层级的下一个层级
            String nextLevel = LevelUtil.calculateLevel(level, dto.getId());
//            System.out.println(nextLevel);

            //2.3 获取第i个层级权限模块的下一个层级的所有子权限模块集合
            List<AclModuleLevelDto> tempList = (List<AclModuleLevelDto>) levelAclModuleMap.get(nextLevel);
            if (CollectionUtils.isNotEmpty(tempList)) {
                //2.4 子权限模块集合，按seq升序排列
                Collections.sort(tempList, new Comparator<AclModuleLevelDto>() {
                    public int compare(AclModuleLevelDto o1, AclModuleLevelDto o2) {
                        return o1.getSeq() - o2.getSeq();
                    }
                });

                //2.5 获取当前层级的子权限模块下的所有权限点，并将权限点组装到子权限模块中
                for (int j = 0; j < tempList.size(); j++) {
                    //2.5.1 获取权限模块
                    AclModuleLevelDto levelDto = tempList.get(j);
                    //2.5.2 获取权限模块id
                    long aclModuleId = levelDto.getId();
                    //2.5.3 根据“权限模块id”查询该权限模块下的所有“权限点”
                    List<AclInfo> aclList = aclDao.selectByModuleId(aclModuleId);
//                        System.out.println("aclModuleId=" + aclModuleId);
//                        System.out.println("aclList=" + aclList.toString());
                    //2.5.4 转换权限点格式
                    List<AclInfoDto> aclDtoList = Lists.newArrayList();
                    for (AclInfo acl : aclList) {
                        aclDtoList.add(AclInfoDto.adapt(acl));
                    }
                    //2.5.5 将权限点组装到子权限模块中
                    levelDto.setAclList(aclDtoList);
                }
                //2.6 重置当前层级的子权限模块
                dto.setAclModuleList(tempList);
                //递归计算子权限模块层级树
                transformAclModuleTree(tempList, nextLevel, levelAclModuleMap);
            }
        }
    }
}
