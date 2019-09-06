package com.swust.demo.rbac.dto;


import com.google.common.collect.Lists;
import com.swust.demo.rbac.bean.AclModuleInfo;
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
public class AclModuleLevelDto extends AclModuleInfo {
    //子权限模块集合
    private List<AclModuleLevelDto> aclModuleList = Lists.newArrayList();
    //当前权限模块下，对应的权限点集合
    private List<AclInfoDto> aclList = Lists.newArrayList();
    //唯一识别号
    private String idName;

    //前端页面是否设置为灰色【系统角色对应的权限置灰，当前用户不能设置置灰的权限！】
    private boolean zhiHui;
    //前端页面是否勾选
    private boolean gouXuan;

    public static AclModuleLevelDto adapt(AclModuleInfo aclModule) {
        AclModuleLevelDto dto = new AclModuleLevelDto();
        BeanUtils.copyProperties(aclModule, dto);
        dto.setIdName(dto.getName() + 10000);
        return dto;
    }

    @Override
    public String toString() {
        return "AclModuleLevelDto{" +
                "aclModuleList=" + aclModuleList +
                ", aclList=" + aclList +
                ", idName='" + idName + '\'' +
                ", zhiHui=" + zhiHui +
                ", gouXuan=" + gouXuan +
                ", id=" + this.getId() +
                ", name='" + this.getName() + '\'' +
                ", parentId=" + this.getParentId() +
                ", level='" + this.getLevel() + '\'' +
                ", seq=" + this.getSeq() +
                ", status=" + this.getStatus() +
                ", remark='" + this.getRemark() + '\'' +
                ", gmtCreate=" + this.getGmtCreate() +
                ", gmtModified=" + this.getGmtModified() +
                '}';
    }
}