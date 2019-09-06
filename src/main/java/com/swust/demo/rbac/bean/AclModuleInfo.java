package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

/**
 * 权限模块实体，对应数据库中的权限模块表
 */

public class AclModuleInfo {
    //权限模块id
    private Long id;
    //权限模块名
    private String name;
    //父级权限模块id
    private Long parentId;
    //权限模块层级
    private String level;
    //权限模块在当前层级下的顺序，由小到大
    private Integer seq;
    //状态，1：正常，0：冻结
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
        //权限模块id
        private Long id;
        //权限模块名
        private String name;
        //父级权限模块id
        private Long parentId;
        //权限模块层级
        private String level;
        //权限模块在当前层级下的顺序，由小到大
        private Integer seq;
        //状态，1：正常，0：冻结
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

        public Builder parentId(Long parentId) {
            this.parentId = parentId;
            return this;
        }

        public Builder level(String level) {
            this.level = level;
            return this;
        }

        public Builder seq(Integer seq) {
            this.seq = seq;
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

        public AclModuleInfo build() {
            AclModuleInfo aclModule = new AclModuleInfo(id, name, parentId, level, seq, status, remark, gmtCreate, gmtModified);
            return aclModule;
        }
    }

    public AclModuleInfo() {
    }

    public AclModuleInfo(Long id, String name, Long parentId, String level, Integer seq, Integer status, String remark, Timestamp gmtCreate, Timestamp gmtModified) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
        this.level = level;
        this.seq = seq;
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

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
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
        return "AclModuleInfo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parentId=" + parentId +
                ", level='" + level + '\'' +
                ", seq=" + seq +
                ", status=" + status +
                ", remark='" + remark + '\'' +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}