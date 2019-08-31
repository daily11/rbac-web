package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

/**
 * 角色实体，对应数据库中的角色表
 */
public class Role {
    //角色id
    private int id;
    //角色名
    private String name;
    //角色的类型，1：管理员角色，2：普通用户, 3：其他
    private int type;
    //状态，1：可用，0：冻结。
    private int status;
    //备注
    private String remark;
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
        //角色id
        private int id;
        //角色名
        private String name;
        //角色的类型，1：管理员角色，2：普通用户, 3：其他
        private int type;
        //状态，1：可用，0：冻结。
        private int status;
        //备注
        private String remark;
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

        public Builder name(String name) {
            this.name = name;
            return this;
        }

        public Builder type(int type) {
            this.type = type;
            return this;
        }

        public Builder status(int status) {
            this.status = status;
            return this;
        }

        public Builder remark(String remark) {
            this.remark = remark;
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

        public Role build() {
            Role role = new Role(id, name, type, status, remark, operator, operate_time, operate_ip);
            return role;
        }
    }

    public Role() {
    }

    public Role(int id, String name, int type, int status, String remark, String operator, Timestamp operate_time, String operate_ip) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.status = status;
        this.remark = remark;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
        return "Role{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type=" + type +
                ", status=" + status +
                ", remark='" + remark + '\'' +
                ", operator='" + operator + '\'' +
                ", operate_time=" + operate_time +
                ", operate_ip='" + operate_ip + '\'' +
                '}';
    }
}
