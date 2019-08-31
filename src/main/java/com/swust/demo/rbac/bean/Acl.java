package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

/**
 * 权限实体，对应数据库中的权限表
 */
public class Acl {
    //权限id
    private int id;
    //权限码
    private String code;
    //权限名
    private String name;
    //权限模块id
    private int aclModuleId;
    //请求的url
    private String url;
    //类型，1：菜单，2：按钮，3：其他
    private int type;
    //状态，1：正常，0：冻结
    private int status;
    //权限在当前模块下的顺序，由小到大
    private int seq;
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
        //权限id
        private int id;
        //权限码
        private String code;
        //权限名
        private String name;
        //权限模块id
        private int aclModuleId;
        //请求的url
        private String url;
        //类型，1：菜单，2：按钮，3：其他
        private int type;
        //状态，1：正常，0：冻结
        private int status;
        //权限在当前模块下的顺序，由小到大
        private int seq;
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

        public Builder code(String code) {
            this.code = code;
            return this;
        }

        public Builder name(String name) {
            this.name = name;
            return this;
        }

        public Builder aclModuleId(int aclModuleId) {
            this.aclModuleId = aclModuleId;
            return this;
        }

        public Builder url(String url) {
            this.url = url;
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

        public Builder seq(int seq) {
            this.seq = seq;
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

        public Acl build() {
            Acl acl = new Acl(id, code, name, aclModuleId, url, type, status, seq, remark, operator, operate_time, operate_ip);
            return acl;
        }
    }

    public Acl() {
    }

    public Acl(int id, String code, String name, int aclModuleId, String url, int type, int status, int seq, String remark, String operator, Timestamp operate_time, String operate_ip) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.aclModuleId = aclModuleId;
        this.url = url;
        this.type = type;
        this.status = status;
        this.seq = seq;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAclModuleId() {
        return aclModuleId;
    }

    public void setAclModuleId(int aclModuleId) {
        this.aclModuleId = aclModuleId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
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
        return "Acl{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                ", aclModuleId=" + aclModuleId +
                ", url='" + url + '\'' +
                ", type=" + type +
                ", status=" + status +
                ", seq=" + seq +
                ", remark='" + remark + '\'' +
                ", operator='" + operator + '\'' +
                ", operate_time=" + operate_time +
                ", operate_ip='" + operate_ip + '\'' +
                '}';
    }
}
