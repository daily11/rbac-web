package com.swust.demo.rbac.param;

/**
 * 功能描述：客户端上传的角色权限实体
 */
public class RoleAclParam {

    //角色id
    private Integer roleId;

    //用户id
    private Integer aclId;

    //登录用户名
    private String operatorName;

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        //角色id
        private Integer roleId;
        //用户id
        private Integer aclId;
        //登录用户名
        private String operatorName;

        public Builder roleId(int roleId) {
            this.roleId = roleId;
            return this;
        }

        public Builder aclId(int aclId) {
            this.aclId = aclId;
            return this;
        }

        public Builder operatorName(String operatorName) {
            this.operatorName = operatorName;
            return this;
        }

        public RoleAclParam build() {
            return new RoleAclParam(roleId, aclId, operatorName);
        }
    }

    public RoleAclParam() {
    }

    public RoleAclParam(Integer roleId, Integer aclId, String operatorName) {
        this.roleId = roleId;
        this.aclId = aclId;
        this.operatorName = operatorName;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getAclId() {
        return aclId;
    }

    public void setAclId(Integer aclId) {
        this.aclId = aclId;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    @Override
    public String toString() {
        return "RoleAclParam{" +
                "roleId=" + roleId +
                ", aclId=" + aclId +
                ", operatorName='" + operatorName + '\'' +
                '}';
    }
}
