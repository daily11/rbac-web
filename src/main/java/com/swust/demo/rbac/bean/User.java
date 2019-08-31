package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

/**
 * 用户实体，对应数据库中的用户表
 */

public class User {
    //用户id
    private int id;
    //表创建时间
    private Timestamp gmt_create;
    //表更新时间
    private Timestamp gmt_modified;
    //用户名
    private String user_name;
    //用户密码
    private String password;
    //用户类型
    private int user_type;
    //用户描述【巡查员、监理员等】
    private String description;
    //账户状态
    private int account_state;

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        //用户id
        private int id;
        //表创建时间
        private Timestamp gmt_create;
        //表更新时间
        private Timestamp gmt_modified;
        //用户名
        private String user_name;
        //用户密码
        private String password;
        //用户类型
        private int user_type;
        //用户描述【巡查员、监理员等】
        private String description;
        //账户状态
        private int account_state;

        public Builder id(int id) {
            this.id = id;
            return this;
        }

        public Builder gmt_create(Timestamp gmt_create) {
            this.gmt_create = gmt_create;
            return this;
        }

        public Builder gmt_modified(Timestamp gmt_modified) {
            this.gmt_modified = gmt_modified;
            return this;
        }

        public Builder user_name(String user_name) {
            this.user_name = user_name;
            return this;
        }

        public Builder password(String password) {
            this.password = password;
            return this;
        }

        public Builder user_type(int user_type) {
            this.user_type = user_type;
            return this;
        }

        public Builder description(String description) {
            this.description = description;
            return this;
        }

        public Builder account_state(int account_state) {
            this.account_state = account_state;
            return this;
        }

        public User build() {
            User user = new User(id, gmt_create, gmt_modified, user_name, password, user_type, description, account_state);
            return user;
        }

    }

    public User() {
    }

    public User(int id, Timestamp gmt_create, Timestamp gmt_modified, String user_name, String password, int user_type, String description, int account_state) {
        this.id = id;
        this.gmt_create = gmt_create;
        this.gmt_modified = gmt_modified;
        this.user_name = user_name;
        this.password = password;
        this.user_type = user_type;
        this.description = description;
        this.account_state = account_state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getGmt_create() {
        return gmt_create;
    }

    public void setGmt_create(Timestamp gmt_create) {
        this.gmt_create = gmt_create;
    }

    public Timestamp getGmt_modified() {
        return gmt_modified;
    }

    public void setGmt_modified(Timestamp gmt_modified) {
        this.gmt_modified = gmt_modified;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getUser_type() {
        return user_type;
    }

    public void setUser_type(int user_type) {
        this.user_type = user_type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAccount_state() {
        return account_state;
    }

    public void setAccount_state(int account_state) {
        this.account_state = account_state;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", gmt_create=" + gmt_create +
                ", gmt_modified=" + gmt_modified +
                ", user_name='" + user_name + '\'' +
                ", password='" + password + '\'' +
                ", user_type=" + user_type +
                ", description='" + description + '\'' +
                ", account_state=" + account_state +
                '}';
    }
}
