package com.swust.demo.rbac.param;

/**
 * 功能描述：客户端上传的权限实体
 */
public class AclParam {
    //权限点id
    private Integer id;

    //登录用户名
    private String operatorName;

    //    @NotBlank(message = "权限点名称不可以为空")
//    @Length(min = 2, max = 20, message = "权限点名称长度需要在2-20个字之间")
    //权限名
    private String name;

    //    @NotNull(message = "必须指定权限模块")
    //权限模块id
    private Integer aclModuleId;

    //    @Length(min = 6, max = 100, message = "权限点URL长度需要在6-100个字符之间")
    //请求路径url
    private String url;

    //    @NotNull(message = "必须指定权限点的类型")
//    @Min(value = 1, message = "权限点类型不合法")
//    @Max(value = 3, message = "权限点类型不合法")
    //类型，1：菜单，2：按钮，3：其他
    private Integer type;

    //    @NotNull(message = "必须指定权限点的状态")
//    @Min(value = 0, message = "权限点状态不合法")
//    @Max(value = 1, message = "权限点状态不合法")
    //状态，1：正常，0：冻结
    private Integer status;

    //    @NotNull(message = "必须指定权限点的展示顺序")
    //权限在当前模块下的顺序，由小到大
    private Integer seq;

    //    @Length(min = 0, max = 200, message = "权限点备注长度需要在200个字符以内")
    //备注
    private String remark;

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        //权限点id
        private Integer id;
        //登录用户名
        private String operatorName;
        //权限名
        private String name;
        //权限模块id
        private Integer aclModuleId;
        //请求路径url
        private String url;
        //类型，1：菜单，2：按钮，3：其他
        private Integer type;
        //状态，1：正常，0：冻结
        private Integer status;
        //权限在当前模块下的顺序，由小到大
        private Integer seq;
        //备注
        private String remark;

        public Builder id(int id) {
            this.id = id;
            return this;
        }

        public Builder operatorName(String operatorName) {
            this.operatorName = operatorName;
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

        public AclParam build() {
            return new AclParam(id, operatorName, name, aclModuleId, url, type, status, seq, remark);
        }
    }

    public AclParam() {
    }

    public AclParam(Integer id, String operatorName, String name, Integer aclModuleId, String url, Integer type, Integer status, Integer seq, String remark) {
        this.id = id;
        this.operatorName = operatorName;
        this.name = name;
        this.aclModuleId = aclModuleId;
        this.url = url;
        this.type = type;
        this.status = status;
        this.seq = seq;
        this.remark = remark;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAclModuleId() {
        return aclModuleId;
    }

    public void setAclModuleId(Integer aclModuleId) {
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

    @Override
    public String toString() {
        return "AclParam{" +
                "id=" + id +
                ", operatorName='" + operatorName + '\'' +
                ", name='" + name + '\'' +
                ", aclModuleId=" + aclModuleId +
                ", url='" + url + '\'' +
                ", type=" + type +
                ", status=" + status +
                ", seq=" + seq +
                ", remark='" + remark + '\'' +
                '}';
    }
}


