package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

public class UserUsergroupRelation {
    private Long id;
    //用户id
    private Long userId;
    //用户组id
    private Long userGroupId;
    //表创建时间
    private Timestamp gmtCreate;
    //表更新的时间
    private Timestamp gmtModified;

    public UserUsergroupRelation() {
    }

    public UserUsergroupRelation(Long id, Long userId, Long userGroupId, Timestamp gmtCreate, Timestamp gmtModified) {
        this.id = id;
        this.userId = userId;
        this.userGroupId = userGroupId;
        this.gmtCreate = gmtCreate;
        this.gmtModified = gmtModified;
    }

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        private Long id;
        //用户id
        private Long userId;
        //用户组id
        private Long userGroupId;
        //表创建时间
        private Timestamp gmtCreate;
        //表更新的时间
        private Timestamp gmtModified;

        public Builder id(Long id) {
            this.id = id;
            return this;
        }

        public Builder userId(Long userId) {
            this.userId = userId;
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


        public UserUsergroupRelation build() {
            UserUsergroupRelation userUsergroupRelation = new UserUsergroupRelation(id, userId, userGroupId, gmtCreate, gmtModified);
            return userUsergroupRelation;
        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserGroupId() {
        return userGroupId;
    }

    public void setUserGroupId(Long userGroupId) {
        this.userGroupId = userGroupId;
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
        return "UserUsergroupRelation{" +
                "id=" + id +
                ", userId=" + userId +
                ", userGroupId=" + userGroupId +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}
