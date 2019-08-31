package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

/**
 * 操作日志实体，对应数据库中的操作日志表
 */

public class SysLog {
    //日志id
    private Integer id;
    //权限更新的类型，1：部门，2：用户，3：权限模块，4：权限，5：角色，6：角色用户关系，7：角色权限关系
    private Integer type;
    //基于type后指定的对象id，比如用户、权限、角色等表的主键
    private Integer targetId;
    //旧值
    private String oldValue;
    //新值
    private String newValue;
    //操作员
    private String operator;
    //最后一次更新时间
    private Timestamp operateTime;
    //最后一次更新者的ip地址
    private String operateIp;
    //当前是否复原过，0：没有，1：复原过
    private Integer status;

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        //日志id
        private Integer id;
        //权限更新的类型，1：部门，2：用户，3：权限模块，4：权限，5：角色，6：角色用户关系，7：角色权限关系
        private Integer type;
        //基于type后指定的对象id，比如用户、权限、角色等表的主键
        private Integer targetId;
        //旧值
        private String oldValue;
        //新值
        private String newValue;
        //操作员
        private String operator;
        //最后一次更新时间
        private Timestamp operateTime;
        //最后一次更新者的ip地址
        private String operateIp;
        //当前是否复原过，0：没有，1：复原过
        private Integer status;

        public Builder id(int id) {
            this.id = id;
            return this;
        }

        public Builder type(int type) {
            this.type = type;
            return this;
        }

        public Builder targetId(int targetId) {
            this.targetId = targetId;
            return this;
        }

        public Builder oldValue(String oldValue) {
            this.oldValue = oldValue;
            return this;
        }

        public Builder newValue(String newValue) {
            this.newValue = newValue;
            return this;
        }

        public Builder operator(String operator) {
            this.operator = operator;
            return this;
        }

        public Builder operate_time(Timestamp operateTime) {
            this.operateTime = operateTime;
            return this;
        }

        public Builder operate_ip(String operateIp) {
            this.operateIp = operateIp;
            return this;
        }

        public Builder status(int status) {
            this.status = status;
            return this;
        }

        public SysLog build() {
            SysLog sysLog = new SysLog(id, type, targetId, oldValue, newValue, operator, operateTime, operateIp, status);
            return sysLog;
        }

    }


    public SysLog() {
    }

    public SysLog(Integer id, Integer type, Integer targetId, String oldValue, String newValue, String operator, Timestamp operateTime, String operateIp, Integer status) {
        this.id = id;
        this.type = type;
        this.targetId = targetId;
        this.oldValue = oldValue;
        this.newValue = newValue;
        this.operator = operator;
        this.operateTime = operateTime;
        this.operateIp = operateIp;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getTargetId() {
        return targetId;
    }

    public void setTargetId(Integer targetId) {
        this.targetId = targetId;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
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
        this.operateIp = operateIp == null ? null : operateIp.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getOldValue() {
        return oldValue;
    }

    public void setOldValue(String oldValue) {
        this.oldValue = oldValue == null ? null : oldValue.trim();
    }

    public String getNewValue() {
        return newValue;
    }

    public void setNewValue(String newValue) {
        this.newValue = newValue == null ? null : newValue.trim();
    }

    @Override
    public String toString() {
        return "SysLog{" +
                "id=" + id +
                ", type=" + type +
                ", targetId=" + targetId +
                ", oldValue='" + oldValue + '\'' +
                ", newValue='" + newValue + '\'' +
                ", operator='" + operator + '\'' +
                ", operateTime=" + operateTime +
                ", operateIp='" + operateIp + '\'' +
                ", status=" + status +
                '}';
    }
}
