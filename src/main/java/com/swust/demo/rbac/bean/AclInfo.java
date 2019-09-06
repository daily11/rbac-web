package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

/**
 * 权限实体，对应数据库中的权限表
 */
public class AclInfo {
    //权限id
    private Long id;
    //权限码
    private String code;
    //权限名
    private String name;
    //权限模块id
    private Long aclModuleId;
    //请求的url
    private String url;
    //类型，1：菜单，2：按钮，3：其他
    private Integer type;
    //状态，1：正常，0：冻结
    private Integer status;
    //权限在当前模块下的顺序，由小到大
    private Integer seq;
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
        //权限id
        private Long id;
        //权限码
        private String code;
        //权限名
        private String name;
        //权限模块id
        private Long aclModuleId;
        //请求的url
        private String url;
        //类型，1：菜单，2：按钮，3：其他
        private Integer type;
        //状态，1：正常，0：冻结
        private Integer status;
        //权限在当前模块下的顺序，由小到大
        private Integer seq;
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

        public Builder code(String code) {
            this.code = code;
            return this;
        }

        public Builder name(String name) {
            this.name = name;
            return this;
        }

        public Builder aclModuleId(Long aclModuleId) {
            this.aclModuleId = aclModuleId;
            return this;
        }

        public Builder url(String url) {
            this.url = url;
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

        public Builder seq(Integer seq) {
            this.seq = seq;
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

        public AclInfo build() {
            AclInfo aclInfo = new AclInfo(id, code, name, aclModuleId, url, type, status, seq, remark, gmtCreate, gmtModified);
            return aclInfo;
        }
    }

    public AclInfo() {
    }

    public AclInfo(Long id, String code, String name, Long aclModuleId, String url, Integer type, Integer status, Integer seq, String remark, Timestamp gmtCreate, Timestamp gmtModified) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.aclModuleId = aclModuleId;
        this.url = url;
        this.type = type;
        this.status = status;
        this.seq = seq;
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

    public Long getAclModuleId() {
        return aclModuleId;
    }

    public void setAclModuleId(Long aclModuleId) {
        this.aclModuleId = aclModuleId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
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
        return "AclInfo{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                ", aclModuleId=" + aclModuleId +
                ", url='" + url + '\'' +
                ", type=" + type +
                ", status=" + status +
                ", seq=" + seq +
                ", remark='" + remark + '\'' +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}
