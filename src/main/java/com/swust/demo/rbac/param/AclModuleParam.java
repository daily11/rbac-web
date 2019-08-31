package com.swust.demo.rbac.param;


/**
 * 功能描述：客户端上传的权限模块实体
 */
public class AclModuleParam {

    //权限模块id
    private Integer id;

    //登录用户名
    private String operatorName;

    //    @NotBlank(message = "权限模块名称不可以为空")
//    @Length(min = 2, max = 20, message = "权限模块名称长度需要在2~20个字之间")
    //权限模块名
    private String name;
    //父级权限模块id
    private Integer parentId = 1;

    //    @NotNull(message = "权限模块展示顺序不可以为空")
    //权限模块在当前层级下的顺序，由小到大
    private Integer seq;

    //    @NotNull(message = "权限模块状态不可以为空")
//    @Min(value = 0, message = "权限模块状态不合法")
//    @Max(value = 1, message = "权限模块状态不合法")
    //状态，1：正常，0：冻结
    private Integer status;

    //    @Length(max = 200, message = "权限模块备注需要在200个字之间")
    //备注
    private String remark;

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        //权限模块id
        private Integer id;
        //登录用户名
        private String operatorName;
        //权限模块名
        private String name;
        //父级权限模块id
        private Integer parentId = 1;
        //权限模块在当前层级下的顺序，由小到大
        private Integer seq;
        //状态，1：正常，0：冻结
        private Integer status;
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

        public Builder parentId(int parentId) {
            this.parentId = parentId;
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

        public AclModuleParam build() {
            AclModuleParam aclModuleParam = new AclModuleParam(id, operatorName, name, parentId, seq, status, remark);
            return aclModuleParam;
        }
    }

    public AclModuleParam() {
    }

    public AclModuleParam(Integer id, String operatorName, String name, Integer parentId, Integer seq, Integer status, String remark) {
        this.id = id;
        this.operatorName = operatorName;
        this.name = name;
        this.parentId = parentId;
        this.seq = seq;
        this.status = status;
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

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
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

    @Override
    public String toString() {
        return "AclModuleParam{" +
                "id=" + id +
                ", operatorName='" + operatorName + '\'' +
                ", name='" + name + '\'' +
                ", parentId=" + parentId +
                ", seq=" + seq +
                ", status=" + status +
                ", remark='" + remark + '\'' +
                '}';
    }
}
