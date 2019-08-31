package com.swust.demo.rbac.param;

/**
 * 功能描述：客户端上传的用户角色实体
 */
public class UserRoleParam {
    //角色id
    private Integer roleId;

    //用户id
    private Integer userId;

    //登录用户名
    private String operatorName;

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        //角色id
        private Integer roleId;
        //用户id
        private Integer userId;
        //登录用户名
        private String operatorName;

        public Builder roleId(int roleId) {
            this.roleId = roleId;
            return this;
        }

        public Builder userId(int userId) {
            this.userId = userId;
            return this;
        }

        public Builder operatorName(String operatorName) {
            this.operatorName = operatorName;
            return this;
        }

        public UserRoleParam build() {
            return new UserRoleParam(roleId, userId, operatorName);
        }
    }

    public UserRoleParam() {
    }

    public UserRoleParam(Integer roleId, Integer userId, String operatorName) {
        this.roleId = roleId;
        this.userId = userId;
        this.operatorName = operatorName;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    @Override
    public String toString() {
        return "UserRoleParam{" +
                "roleId=" + roleId +
                ", userId=" + userId +
                ", operatorName='" + operatorName + '\'' +
                '}';
    }
}
