package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

/**
 * 权限模块实体，对应数据库中的权限模块表
 */

public class AclModule {
    //权限模块id
    private int id;
    //权限模块名
    private String name;
    //父级权限模块id
    private Integer parentId;
    //权限模块层级
    private String level;
    //权限模块在当前层级下的顺序，由小到大
    private Integer seq;
    //状态，1：正常，0：冻结
    private Integer status;
    //备注
    private String remark;
    //操作员
    private String operator;
    //最后一次更新的时间
    private Timestamp operateTime;
    //最后一次更新者的ip地址
    private String operateIp;

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        //权限模块id
        private int id;
        //权限模块名
        private String name;
        //父级权限模块id
        private Integer parentId;
        //权限模块层级
        private String level;
        //权限模块在当前层级下的顺序，由小到大
        private Integer seq;
        //状态，1：正常，0：冻结
        private Integer status;
        //备注
        private String remark;
        //操作员
        private String operator;
        //最后一次更新的时间
        private Timestamp operateTime;
        //最后一次更新者的ip地址
        private String operateIp;

        public Builder id(int id) {
            this.id = id;
            return this;
        }

        public Builder name(String name) {
            this.name = name;
            return this;
        }

        public Builder parentId(int parentId) {
            this.parentId = parentId;
            return this;
        }

        public Builder level(String level) {
            this.level = level;
            return this;
        }

        public Builder seq(int seq) {
            this.seq = seq;
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

        public Builder operateTime(Timestamp operateTime) {
            this.operateTime = operateTime;
            return this;
        }

        public Builder operateIp(String operateIp) {
            this.operateIp = operateIp;
            return this;
        }

        public AclModule build() {
            AclModule aclModule = new AclModule(id, name, parentId, level, seq, status, remark, operator, operateTime, operateIp);
            return aclModule;
        }
    }

    public AclModule() {
    }

    public AclModule(int id, String name, Integer parentId, String level, Integer seq, Integer status, String remark, String operator, Timestamp operateTime, String operateIp) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
        this.level = level;
        this.seq = seq;
        this.status = status;
        this.remark = remark;
        this.operator = operator;
        this.operateTime = operateTime;
        this.operateIp = operateIp;
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

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
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

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public Timestamp getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Timestamp operateTime) {
        this.operateTime = operateTime;
    }

    public String getOperateIp() {
        return operateIp;
    }

    public void setOperateIp(String operateIp) {
        this.operateIp = operateIp;
    }

    @Override
    public String toString() {
        return "AclModule{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parentId=" + parentId +
                ", level='" + level + '\'' +
                ", seq=" + seq +
                ", status=" + status +
                ", remark='" + remark + '\'' +
                ", operator='" + operator + '\'' +
                ", operateTime=" + operateTime +
                ", operateIp='" + operateIp + '\'' +
                '}';
    }
}