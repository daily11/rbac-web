package com.swust.demo.rbac.dto;

import com.swust.demo.rbac.bean.AclInfo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.beans.BeanUtils;

/**
 * 功能描述：权限模块层级树需要的权限操作实体
 */
@Getter
@Setter
public class AclInfoDto extends AclInfo {

    // 是否要默认选中
    private boolean checked = false;

    // 是否有权限操作
    private boolean hasAcl = false;

    public static AclInfoDto adapt(AclInfo aclInfo) {
        AclInfoDto dto = new AclInfoDto();
        BeanUtils.copyProperties(aclInfo, dto);
        return dto;
    }

    @Override
    public String toString() {
        return "AclInfoDto{" +
                "checked=" + checked +
                ", hasAcl=" + hasAcl +
                ", id=" + this.getId() +
                ", code='" + this.getCode() + '\'' +
                ", name='" + this.getName() + '\'' +
                ", aclModuleId=" + this.getAclModuleId() +
                ", url='" + this.getUrl() + '\'' +
                ", type=" + this.getType() +
                ", status=" + this.getStatus() +
                ", seq=" + this.getSeq() +
                ", remark='" + this.getRemark() + '\'' +
                ", gmtCreate=" + this.getGmtCreate() +
                ", gmtModified=" + this.getGmtModified() +
                '}';
    }
}
