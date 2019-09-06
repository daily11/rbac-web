package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

/**
 * 用户组-角色实体，对应数据库中的用户组-角色关联表
 */
public class UsergroupRoleRelation {
    private Long id;
    //用户组id
    private Long userGroupId;
    //角色id
    private Long roleId;
    //表创建时间
    private Timestamp gmtCreate;
    //表更新的时间
    private Timestamp gmtModified;

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        private Long id;
        //用户组id
        private Long userGroupId;
        //角色id
        private Long roleId;
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

        public Builder userGroupId(Long userGroupId) {
            this.userGroupId = userGroupId;
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


        public UsergroupRoleRelation build() {
            UsergroupRoleRelation usergroupRoleRelation = new UsergroupRoleRelation(id, userGroupId, roleId, gmtCreate, gmtModified);
            return usergroupRoleRelation;
        }
    }

    public UsergroupRoleRelation() {
    }

    public UsergroupRoleRelation(Long id, Long userGroupId, Long roleId, Timestamp gmtCreate, Timestamp gmtModified) {
        this.id = id;
        this.userGroupId = userGroupId;
        this.roleId = roleId;
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

    public Long getUserGroupId() {
        return userGroupId;
    }

    public void setUserGroupId(Long userGroupId) {
        this.userGroupId = userGroupId;
    }

    @Override
    public String toString() {
        return "UsergroupRoleRelation{" +
                "id=" + id +
                ", userGroupId=" + userGroupId +
                ", roleId=" + roleId +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}
