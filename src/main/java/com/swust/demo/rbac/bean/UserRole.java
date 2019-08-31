package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

/**
 * 用户角色实体，对应数据库中的用户角色表
 */

public class UserRole {
    //用户角色id
    private int id;
    //角色id
    private int roleId;
    //用户id
    private int userId;
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
        //用户角色id
        private int id;
        //角色id
        private int roleId;
        //用户id
        private int userId;
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

        public Builder userId(int userId) {
            this.userId = userId;
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

        public UserRole build() {
            UserRole userRole = new UserRole(id, roleId, userId, operator, operate_time, operate_ip);
            return userRole;
        }

    }

    public UserRole() {
    }

    public UserRole(int id, int roleId, int userId, String operator, Timestamp operate_time, String operate_ip) {
        this.id = id;
        this.roleId = roleId;
        this.userId = userId;
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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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
        return "UserRole{" +
                "id=" + id +
                ", roleId=" + roleId +
                ", userId=" + userId +
                ", operator='" + operator + '\'' +
                ", operate_time=" + operate_time +
                ", operate_ip='" + operate_ip + '\'' +
                '}';
    }
}
