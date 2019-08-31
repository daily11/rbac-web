package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

/**
 * 权限角色实体，对应数据库中的权限角色表
 */

public class RoleAcl {
    //权限模块id
    private int id;
    //角色id
    private int roleId;
    //权限点id
    private int aclId;
    //操作员
    private String operator;
    //最后一次更新的时间
    private Timestamp operate_time;
    //最后一次更新者的ip地址
    private String operate_ip;

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        //权限模块id
        private int id;
        //角色id
        private int roleId;
        //权限点id
        private int aclId;
        //操作员
        private String operator;
        //最后一次更新的时间
        private Timestamp operate_time;
        //最后一次更新者的ip地址
        private String operate_ip;

        public Builder id(int id) {
            this.id = id;
            return this;
        }

        public Builder roleId(int roleId) {
            this.roleId = roleId;
            return this;
        }

        public Builder aclId(int aclId) {
            this.aclId = aclId;
            return this;
        }

        public Builder operator(String operator) {
            this.operator = operator;
            return this;
        }

        public Builder operate_time(Timestamp operate_time) {
            this.operate_time = operate_time;
            return this;
        }

        public Builder operate_ip(String operate_ip) {
            this.operate_ip = operate_ip;
            return this;
        }

        public RoleAcl build() {
            RoleAcl roleAcl = new RoleAcl(id, roleId, aclId, operator, operate_time, operate_ip);
            return roleAcl;
        }
    }

    public RoleAcl() {
    }

    public RoleAcl(int id, int roleId, int aclId, String operator, Timestamp operate_time, String operate_ip) {
        this.id = id;
        this.roleId = roleId;
        this.aclId = aclId;
        this.operator = operator;
        this.operate_time = operate_time;
        this.operate_ip = operate_ip;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public Timestamp getOperate_time() {
        return operate_time;
    }

    public void setOperate_time(Timestamp operate_time) {
        this.operate_time = operate_time;
    }

    public String getOperate_ip() {
        return operate_ip;
    }

    public void setOperate_ip(String operate_ip) {
        this.operate_ip = operate_ip;
    }

    @Override
    public String toString() {
        return "RoleAcl{" +
                "id=" + id +
                ", roleId=" + roleId +
                ", aclId=" + aclId +
                ", operator='" + operator + '\'' +
                ", operate_time=" + operate_time +
                ", operate_ip='" + operate_ip + '\'' +
                '}';
    }
}
