package com.swust.demo.rbac.param;

/**
 * 功能描述：客户端上传的角色实体
 */
public class RoleParam {

    //角色id
    private Integer id;

    //登录用户名
    private String operatorName;

    //    @NotBlank(message = "角色名称不可以为空")
//    @Length(min = 2, max = 20, message = "角色名称长度需要在2-20个字之间")
    //角色名
    private String name;

    //    @Min(value = 1, message = "角色类型不合法")
//    @Max(value = 2, message = "角色类型不合法")
    //角色的类型，1：系统角色  2：个人角色
    private Integer type = 1;

    //    @NotNull(message = "角色状态不可以为空")
//    @Min(value = 0, message = "角色状态不合法")
//    @Max(value = 1, message = "角色状态不合法")
    //状态，1：可用，0：冻结。
    private Integer status;

    //    @Length(min = 0, max = 200, message = "角色备注长度需要在200个字符以内")
    //备注
    private String remark;

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        //角色id
        private Integer id;
        //登录用户名
        private String operatorName;
        //角色名
        private String name;
        //角色的类型，1：管理员角色，2：巡查员, 3：监理员  4：其他
        private Integer type = 1;
        //状态，1：可用，0：冻结。
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

        public RoleParam build() {
            return new RoleParam(id, operatorName, name, type, status, remark);
        }
    }

    public RoleParam() {
    }

    public RoleParam(Integer id, String operatorName, String name, Integer type, Integer status, String remark) {
        this.id = id;
        this.operatorName = operatorName;
        this.name = name;
        this.type = type;
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

    @Override
    public String toString() {
        return "RoleParam{" +
                "id=" + id +
                ", operatorName='" + operatorName + '\'' +
                ", name='" + name + '\'' +
                ", type=" + type +
                ", status=" + status +
                ", remark='" + remark + '\'' +
                '}';
    }
}
