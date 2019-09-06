package com.swust.demo.rbac.param;

public class RoleAclViewParam {
    private Long roleId;
    private Long aclId;
    private String aclName;
    private String roleName;

    public RoleAclViewParam() {
    }

    public RoleAclViewParam(Long roleId, Long aclId, String aclName, String roleName) {
        this.roleId = roleId;
        this.aclId = aclId;
        this.aclName = aclName;
        this.roleName = roleName;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getAclId() {
        return aclId;
    }

    public void setAclId(Long aclId) {
        this.aclId = aclId;
    }

    public String getAclName() {
        return aclName;
    }

    public void setAclName(String aclName) {
        this.aclName = aclName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return "RoleAclViewParam{" +
                "roleId=" + roleId +
                ", aclId=" + aclId +
                ", aclName='" + aclName + '\'' +
                ", roleName='" + roleName + '\'' +
                '}';
    }
}
