package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

/**
 * 权限角色实体，对应数据库中的权限角色表
 */
public class RoleAclRelation {
    //权限模块id
    private Long id;
    //角色id
    private Long roleId;
    //权限点id
    private Long aclId;
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
        //角色id
        private Long roleId;
        //权限点id
        private Long aclId;
        //表创建时间
        private Timestamp gmtCreate;
        //表更新的时间
        private Timestamp gmtModified;

        public Builder id(Long id) {
            this.id = id;
            return this;
        }

        public Builder roleId(Long roleId) {
            this.roleId = roleId;
            return this;
        }

        public Builder aclId(Long aclId) {
            this.aclId = aclId;
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


        public RoleAclRelation build() {
            RoleAclRelation roleAclRelation = new RoleAclRelation(id, roleId, aclId, gmtCreate, gmtModified);
            return roleAclRelation;
        }
    }

    public RoleAclRelation() {
    }

    public RoleAclRelation(Long id, Long roleId, Long aclId, Timestamp gmtCreate, Timestamp gmtModified) {
        this.id = id;
        this.roleId = roleId;
        this.aclId = aclId;
        this.gmtCreate = gmtCreate;
        this.gmtModified = gmtModified;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getAclId() {
        return aclId;
    }

    public void setAclId(Long aclId) {
        this.aclId = aclId;
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
        return "RoleAclRelation{" +
                "id=" + id +
                ", roleId=" + roleId +
                ", aclId=" + aclId +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}
