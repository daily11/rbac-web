package com.swust.demo.rbac.dto;


import com.google.common.collect.Lists;
import com.swust.demo.rbac.bean.AclModule;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.beans.BeanUtils;

import java.util.List;

/**
 * 功能描述：权限模块层级树实体类
 */
@Getter
@Setter
@ToString
public class AclModuleLevelDto extends AclModule {
    //子权限模块集合
    private List<AclModuleLevelDto> aclModuleList = Lists.newArrayList();
    //当前权限模块下，对应的权限点集合
    private List<AclDto> aclList = Lists.newArrayList();
    //唯一识别号
    private String idName;

    //是否设置为灰色
    private boolean zhiHui;
    //是否勾选
    private boolean gouXuan;

    public static AclModuleLevelDto adapt(AclModule aclModule) {
        AclModuleLevelDto dto = new AclModuleLevelDto();
        BeanUtils.copyProperties(aclModule, dto);
        dto.setIdName(dto.getName()+10000);
        return dto;
    }
}
//某个用户的权限层级树