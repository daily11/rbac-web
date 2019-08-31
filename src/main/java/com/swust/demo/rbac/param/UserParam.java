package com.swust.demo.rbac.param;

/**
 * 功能描述：客户端上传的客户实体
 */
public class UserParam {
    //用户id
    private int id;
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

        public UserParam build() {
            return new UserParam(id, user_name, password, user_type, description, account_state);
        }
    }

    public UserParam() {
    }

    public UserParam(int id, String user_name, String password, int user_type, String description, int account_state) {
        this.id = id;
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
        return "UserParam{" +
                "id=" + id +
                ", user_name='" + user_name + '\'' +
                ", password='" + password + '\'' +
                ", user_type=" + user_type +
                ", description='" + description + '\'' +
                ", account_state=" + account_state +
                '}';
    }
}
