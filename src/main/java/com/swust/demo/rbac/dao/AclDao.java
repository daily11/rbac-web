package com.swust.demo.rbac.dao;

import com.swust.demo.rbac.base.BaseMySql;
import com.swust.demo.rbac.bean.Acl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能描述：权限数据持久化操作类
 */
public class AclDao extends BaseMySql {

    /**
     * 保存权限点
     *
     * @param obj 权限点
     */
    @Override
    public void save(Object obj) {
        Acl acl = (Acl) obj;
        try {
            sql = "insert into sys_acl(code,name,acl_module_id,url,type,status,seq,remark,operator,operate_time,operate_ip)"
                    + " values (?,?,?,?,?,?,?,?,?,?,?)";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, acl.getCode());
            ps.setString(2, acl.getName());
            ps.setInt(3, acl.getAclModuleId());
            ps.setString(4, acl.getUrl());
            ps.setInt(5, acl.getType());
            ps.setInt(6, acl.getStatus());
            ps.setInt(7, acl.getSeq());
            ps.setString(8, acl.getRemark());
            ps.setString(9, acl.getOperator());
            ps.setTimestamp(10, acl.getOperate_time());
            ps.setString(11, acl.getOperate_ip());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 查询权限信息
     *
     * @return List<Acl>
     */
    @Override
    public List<Acl> find() {
        List<Acl> list = new ArrayList<>();
        try {
            sql = "select * from sys_acl";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Acl acl = Acl.builder().id(rs.getInt(1)).code(rs.getString(2))
                        .name(rs.getString(3)).aclModuleId(rs.getInt(4))
                        .url(rs.getString(5)).type(rs.getInt(6)).status(rs.getInt(7))
                        .seq(rs.getInt(8)).remark(rs.getString(9))
                        .operator(rs.getString(10)).operate_time(rs.getTimestamp(11))
                        .operate_ip(rs.getString(12))
                        .build();
                list.add(acl);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 查询权限信息
     *
     * @param id 权限id
     * @return Acl
     */
    @Override
    public Acl findById(int id) {
        Acl acl = null;
        try {
            sql = "select * from sys_acl where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                acl = Acl.builder().id(rs.getInt(1)).code(rs.getString(2))
                        .name(rs.getString(3)).aclModuleId(rs.getInt(4))
                        .url(rs.getString(5)).type(rs.getInt(6)).status(rs.getInt(7))
                        .seq(rs.getInt(8)).remark(rs.getString(9))
                        .operator(rs.getString(10)).operate_time(rs.getTimestamp(11))
                        .operate_ip(rs.getString(12))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return acl;
    }

    /**
     * 查询权限信息
     *
     * @param acl_module_id 权限所在的权限模块id
     * @return List<Acl>
     */
    public List<Acl> findByModuleId(int acl_module_id) {
        List<Acl> list = new ArrayList<Acl>();
        try {
            sql = "select * from sys_acl where acl_module_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, acl_module_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Acl acl = Acl.builder().id(rs.getInt(1)).code(rs.getString(2))
                        .name(rs.getString(3)).aclModuleId(rs.getInt(4))
                        .url(rs.getString(5)).type(rs.getInt(6)).status(rs.getInt(7))
                        .seq(rs.getInt(8)).remark(rs.getString(9))
                        .operator(rs.getString(10)).operate_time(rs.getTimestamp(11))
                        .operate_ip(rs.getString(12))
                        .build();
                list.add(acl);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 查询权限信息
     *
     * @param aclModuleId 权限所在的权限模块id
     * @param aclName     权限名称
     * @return List<Acl>
     */
    public List<Acl> findByArg(Integer aclModuleId, String aclName) {
        List<Acl> list = new ArrayList<>();
        try {
            sql = "select * from sys_acl where acl_module_id=? and name=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, aclModuleId);
            ps.setString(2, aclName);
            rs = ps.executeQuery();
            while (rs.next()) {
                Acl acl = Acl.builder().id(rs.getInt(1)).code(rs.getString(2))
                        .name(rs.getString(3)).aclModuleId(rs.getInt(4))
                        .url(rs.getString(5)).type(rs.getInt(6)).status(rs.getInt(7))
                        .seq(rs.getInt(8)).remark(rs.getString(9))
                        .operator(rs.getString(10)).operate_time(rs.getTimestamp(11))
                        .operate_ip(rs.getString(12))
                        .build();
                list.add(acl);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
        return list;
    }

    /**
     * 删除权限点记录
     *
     * @param aclId 权限点id
     */
    @Override
    public void delete(int aclId) {
        try {
            sql = "delete from sys_acl where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, aclId);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 删除权限点记录
     *
     * @param aclModuleId 权限模块id
     */
    public void deleteByAclModuleId(int aclModuleId) {
        try {
            sql = "delete from sys_acl where acl_module_id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, aclModuleId);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }

    /**
     * 更新权限点
     *
     * @param obj 权限点记录
     */
    @Override
    public void update(Object obj) {
        Acl acl = (Acl) obj;
        try {
            sql = "update sys_acl set code=?,name=?,acl_module_id=?,url=?,type=?,status=?,"
                    + "seq=?,remark=?,operator=?,operate_time=?,operate_ip=? where id=?";
            con = BaseMySql.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, acl.getCode());
            ps.setString(2, acl.getName());
            ps.setInt(3, acl.getAclModuleId());
            ps.setString(4, acl.getUrl());
            ps.setInt(5, acl.getType());
            ps.setInt(6, acl.getStatus());
            ps.setInt(7, acl.getSeq());
            ps.setString(8, acl.getRemark());
            ps.setString(9, acl.getOperator());
            ps.setTimestamp(10, acl.getOperate_time());
            ps.setString(11, acl.getOperate_ip());
            ps.setInt(12, acl.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseMySql.close(rs, ps, con);
        }
    }


}
