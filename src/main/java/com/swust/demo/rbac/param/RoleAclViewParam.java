package com.swust.demo.rbac.param;

public class RoleAclViewParam {
    private int roleId;
    private int aclId;
    private String aclName;
    private String roleName;

    public RoleAclViewParam() {
    }

    public RoleAclViewParam(int roleId, int aclId, String aclName, String roleName) {
        this.roleId = roleId;
        this.aclId = aclId;
        this.aclName = aclName;
        this.roleName = roleName;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getAclId() {
        return aclId;
    }

    public void setAclId(int aclId) {
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
