package com.swust.demo.rbac.dto;

import com.swust.demo.rbac.bean.Acl;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.beans.BeanUtils;

/**
 * 功能描述：权限模块层级树需要的权限操作实体
 */
@Getter
@Setter
@ToString
public class AclDto extends Acl {

    // 是否要默认选中
    private boolean checked = false;

    // 是否有权限操作
    private boolean hasAcl = false;

    public static AclDto adapt(Acl acl) {
        AclDto dto = new AclDto();
        BeanUtils.copyProperties(acl, dto);
        return dto;
    }
}
