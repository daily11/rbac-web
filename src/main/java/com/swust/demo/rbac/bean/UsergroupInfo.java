package com.swust.demo.rbac.bean;

import java.sql.Timestamp;

public class UsergroupInfo {
    private Long id;
    private String groupName;
    private String description;
    private String groupKey;
    private Long parentId;
    private String groupPath;
    private Integer groupType;
    private Timestamp gmtCreate;
    private Timestamp gmtModified;

    public static Builder builder() {
        return new UsergroupInfo.Builder();
    }

    public static class Builder {
        private Long id;
        private String groupName;
        private String description;
        private String groupKey;
        private Long parentId;
        private String groupPath;
        private Integer groupType;
        private Timestamp gmtCreate;
        private Timestamp gmtModified;

        public Builder id(Long id) {
            this.id = id;
            return this;
        }

        public Builder groupName(String groupName) {
            this.groupName = groupName;
            return this;
        }

        public Builder description(String description) {
            this.description = description;
            return this;
        }

        public Builder groupKey(String groupKey) {
            this.groupKey = groupKey;
            return this;
        }

        public Builder parentId(Long parentId) {
            this.parentId = parentId;
            return this;
        }

        public Builder groupPath(String groupPath) {
            this.groupPath = groupPath;
            return this;
        }

        public Builder groupType(Integer groupType) {
            this.groupType = groupType;
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

        public UsergroupInfo build() {
            UsergroupInfo usergroupInfo = new UsergroupInfo(id, groupName, description, groupKey, parentId, groupPath, groupType, gmtCreate, gmtModified);
            return usergroupInfo;
        }
    }

    public UsergroupInfo() {
    }

    public UsergroupInfo(Long id, String groupName, String description, String groupKey, Long parentId, String groupPath, Integer groupType, Timestamp gmtCreate, Timestamp gmtModified) {
        this.id = id;
        this.groupName = groupName;
        this.description = description;
        this.groupKey = groupKey;
        this.parentId = parentId;
        this.groupPath = groupPath;
        this.groupType = groupType;
        this.gmtCreate = gmtCreate;
        this.gmtModified = gmtModified;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGroupKey() {
        return groupKey;
    }

    public void setGroupKey(String groupKey) {
        this.groupKey = groupKey;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getGroupPath() {
        return groupPath;
    }

    public void setGroupPath(String groupPath) {
        this.groupPath = groupPath;
    }

    public Integer getGroupType() {
        return groupType;
    }

    public void setGroupType(Integer groupType) {
        this.groupType = groupType;
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
        return "UsergroupInfo{" +
                "id=" + id +
                ", groupName='" + groupName + '\'' +
                ", description='" + description + '\'' +
                ", groupKey='" + groupKey + '\'' +
                ", parentId=" + parentId +
                ", groupPath='" + groupPath + '\'' +
                ", groupType=" + groupType +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}
