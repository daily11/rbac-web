package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

/**
 * 角色实体，对应数据库中的角色表
 */
public class RoleInfo {
    //角色id
    private Long id;
    //角色名
    private String name;
    //角色的类型，1：管理员角色，2：普通用户, 3：其他
    private Integer type;
    //状态，1：可用，0：冻结。
    private Integer status;
    //备注
    private String remark;
    //表创建时间
    private Timestamp gmtCreate;
    //表更新的时间
    private Timestamp gmtModified;

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        //角色id
        private Long id;
        //角色名
        private String name;
        //角色的类型，1：管理员角色，2：普通用户, 3：其他
        private Integer type;
        //状态，1：可用，0：冻结。
        private Integer status;
        //备注
        private String remark;
        //表创建时间
        private Timestamp gmtCreate;
        //表更新的时间
        private Timestamp gmtModified;

        public Builder id(Long id) {
            this.id = id;
            return this;
        }

        public Builder name(String name) {
            this.name = name;
            return this;
        }

        public Builder type(Integer type) {
            this.type = type;
            return this;
        }

        public Builder status(Integer status) {
            this.status = status;
            return this;
        }

        public Builder remark(String remark) {
            this.remark = remark;
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

        public RoleInfo build() {
            RoleInfo role = new RoleInfo(id, name, type, status, remark, gmtCreate, gmtModified);
            return role;
        }
    }

    public RoleInfo() {
    }

    public RoleInfo(Long id, String name, Integer type, Integer status, String remark, Timestamp gmtCreate, Timestamp gmtModified) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.status = status;
        this.remark = remark;
        this.gmtCreate = gmtCreate;
        this.gmtModified = gmtModified;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
        return "RoleInfo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type=" + type +
                ", status=" + status +
                ", remark='" + remark + '\'' +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}
