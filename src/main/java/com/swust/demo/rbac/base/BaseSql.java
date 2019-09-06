package com.swust.demo.rbac.base;

import java.util.List;

/**
 * 数据库操作基类
 *
 * @author chen
 */
public interface BaseSql {
    //TODO 数据库连接方式，采用合成复用方案，关联DBUtil，而不是继承DBUtil

    /**
     * 保存记录
     *
     * @param obj
     */
    public abstract void save(Object obj);

    /**
     * 删除记录
     *
     * @param id
     */
    public abstract void delete(Long id);

    /**
     * 更新记录
     *
     * @param obj
     */
    public abstract void update(Object obj);

    /**
     * 查询所有记录
     *
     * @return List<Object>
     */
    public abstract List select();

    /**
     * 查询某个记录
     *
     * @param id 记录id
     * @return
     */
    public abstract Object selectById(Long id);
}
