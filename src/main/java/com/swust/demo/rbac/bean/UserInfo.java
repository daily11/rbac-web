package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

/**
 * 用户实体，对应数据库中的用户表
 */

public class UserInfo {
    //用户id
    private Long id;
    //用户名
    private String userName;
    //用户密码
    private String password;
    //用户类型
    private Integer userType;
    //用户描述【巡查员、监理员等】
    private String description;
    //账户状态
    private Integer accountState;
    //表创建时间
    private Timestamp gmtCreate;
    //表更新的时间
    private Timestamp gmtModified;

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        //用户id
        private Long id;
        //用户名
        private String userName;
        //用户密码
        private String password;
        //用户类型
        private Integer userType;
        //用户描述【巡查员、监理员等】
        private String description;
        //账户状态
        private Integer accountState;
        //表创建时间
        private Timestamp gmtCreate;
        //表更新的时间
        private Timestamp gmtModified;

        public Builder id(Long id) {
            this.id = id;
            return this;
        }

        public Builder userName(String userName) {
            this.userName = userName;
            return this;
        }

        public Builder password(String password) {
            this.password = password;
            return this;
        }

        public Builder userType(Integer userType) {
            this.userType = userType;
            return this;
        }

        public Builder description(String description) {
            this.description = description;
            return this;
        }

        public Builder accountState(Integer accountState) {
            this.accountState = accountState;
            return this;
        }

        public Builder gmtCreate(Timestamp gmtCreate) {
            this.gmtCreate = gmtCreate;
            return this;
        }

        public Builder gmtModified(Timestamp gmtModified) {
            this.gmtModified = gmtModified;
            return this;
        }

        public UserInfo build() {
            UserInfo user = new UserInfo(id, userName, password, userType, description, accountState, gmtCreate, gmtModified);
            return user;
        }

    }

    public UserInfo() {
    }

    public UserInfo(Long id, String userName, String password, Integer userType, String description, Integer accountState, Timestamp gmtCreate, Timestamp gmtModified) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.userType = userType;
        this.description = description;
        this.accountState = accountState;
        this.gmtCreate = gmtCreate;
        this.gmtModified = gmtModified;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getAccountState() {
        return accountState;
    }

    public void setAccountState(Integer accountState) {
        this.accountState = accountState;
    }

    public Timestamp getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Timestamp gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Timestamp getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Timestamp gmtModified) {
        this.gmtModified = gmtModified;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", userType=" + userType +
                ", description='" + description + '\'' +
                ", accountState=" + accountState +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}
