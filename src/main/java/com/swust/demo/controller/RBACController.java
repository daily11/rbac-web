package com.swust.demo.controller;

import com.swust.demo.rbac.bean.*;
import com.swust.demo.rbac.dto.AclModuleLevelDto;
import com.swust.demo.rbac.service.*;
import com.swust.demo.rbac.service.impl.*;
import com.swust.demo.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Iterator;
import java.util.List;

@RequestMapping("/rbac")
@RestController
public class RBACController {
    //权限模块服务
    AclModuleInfoService aclModuleService = new AclModuleInfoServiceImpl();
    //权限点服务
    AclInfoService aclService = new AclInfoServiceImpl();
    //角色-权限点服务
    RoleAclRelationService roleAclService = new RoleAclRelationServiceImpl();
    //角色服务
    RoleInfoService roleService = new RoleInfoServiceImpl();
    //层级树服务
    TreeService treeService = new TreeServiceImpl();
    //用户组-角色服务
    UsergroupRoleRelationService userRoleService = new UsergroupRoleRelationServiceImpl();
    //用户服务
    UserInfoService userService = new UserInfoServiceImpl();
    //用户组服务
    UsergroupInfoService usergroupInfoService = new UsergroupInfoServiceImpl();
//    @Autowired
//    SysAclService sysAclService;

    /**
     * 保存功能模块
     *
     * @param param
     * @return
     */
    @RequestMapping("/saveAclModule")
    public Result saveAclModule(@RequestBody AclModuleInfo param) {
        try {
            aclModuleService.save(param);
            return this.findAllAclModule();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 删除功能模块
     *
     * @param aclModuleId
     * @return
     */
    @RequestMapping("/deleteAclModule")
    public Result deleteAclModule(Long aclModuleId) {
        try {
            aclModuleService.delete(aclModuleId);
            return this.findAllAclModule();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 更新功能模块
     *
     * @param aclModule
     * @return
     */
    @RequestMapping("/updateAclModule")
    public Result updateAclModule(@RequestBody AclModuleInfo aclModule) {
        try {
            aclModuleService.update(aclModule);
            return this.findAllAclModule();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 查询所有的功能模块
     *
     * @return
     */
    @RequestMapping("/findAllAclModule")
    public Result findAllAclModule() {
        try {
            List<AclModuleInfo> list = aclModuleService.select();
            return new Result(200, list, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 根据功能模块id查询功能模块
     *
     * @param aclModuleId
     * @return
     */
    @RequestMapping("/findAclModuleById")
    public Result findAclModuleById(Long aclModuleId) {
        try {
            AclModuleInfo aclModule = aclModuleService.selectById(aclModuleId);
            return new Result(200, aclModule, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 保存功能点
     * <p>
     * 超级管理员默认拥有添加的功能点权限，因此除了新增功能记录，还需要增加角色-功能点关联记录
     *
     * @param param 功能点记录
     * @return
     */
    @RequestMapping("/saveAcl")
    public Result saveAcl(@RequestBody AclInfo param) {
        long roleId = 60;//超级管理员对应的id
        try {
            //1 保存功能点
            aclService.save(param);
            //2 超级管理员【角色】添加该功能点权限
            //2.1 查询功能点集合
            List<AclInfo> aclList = aclService.select();
            //2.2 根据功能点名称，遍历功能点集合，找到功能点id
            for (int i = 0; i < aclList.size(); i++) {
                AclInfo acl = aclList.get(i);
                if (acl.getName().equals(param.getName())) {
                    param.setId(acl.getId());
                    break;
                }
            }
            //2.3 查询角色集合
            List<RoleInfo> roleList = roleService.select();
            //2.4 遍历角色集合，找到“超级管理员”角色对应的id
            for (int i = 0; i < roleList.size(); i++) {
                RoleInfo role = roleList.get(i);
                if (role.getName().equals("超级管理员")) {
                    roleId = role.getId();
                    break;
                }
            }
            //2.5 添加角色功能关联记录
            RoleAclRelation roleAclParam = RoleAclRelation.builder()
                    .aclId(param.getId())
                    .roleId(roleId)
                    .build();
            roleAclService.save(roleAclParam);

            return this.findAllAcl();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 删除功能点
     *
     * @param aclId
     * @return
     */
    @RequestMapping("/deleteAcl")
    public Result deleteAcl(Long aclId) {
        try {
            aclService.delete(aclId);
            return this.findAllAcl();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 查询所有功能点
     *
     * @return
     */
    @RequestMapping("/findAllAcl")
    public Result findAllAcl() {
        try {
            List<AclInfo> list = aclService.select();
            return new Result(200, list, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 根据功能点id查询功能点
     *
     * @param aclid
     * @return
     */
    @RequestMapping("/findAclById")
    public Result findAclById(Long aclid) {
        try {
            AclInfo acl = aclService.selectById(aclid);
            return new Result(200, acl, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 更新功能点
     *
     * @param acl
     * @return
     */
    @RequestMapping("/updateAcl")
    public Result updateAcl(@RequestBody AclInfo acl) {
        try {
            aclService.update(acl);
            return this.findAllAcl();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 保存角色功能关联记录
     *
     * @param param
     * @return
     */
    @RequestMapping("/saveRoleAcl")
    public Result saveRoleAcl(@RequestBody RoleAclRelation param) {
        try {
            roleAclService.save(param);
            return this.findAllRoleAcl();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 删除角色功能
     *
     * @param roleAclId
     * @return
     */
    @RequestMapping("/deleteRoleAcl")
    public Result deleteRoleAcl(Long roleAclId) {
        try {
            roleAclService.delete(roleAclId);
            return this.findAllRoleAcl();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 查询所有的角色功能
     *
     * @return
     */
    @RequestMapping("/findAllRoleAcl")
    public Result findAllRoleAcl() {
        try {
            List<RoleAclRelation> list = roleAclService.select();
            return new Result(200, list, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 根据角色功能id查询角色功能
     *
     * @param roleAclId
     * @return
     */
    @RequestMapping("/findRoleAclById")
    public Result findRoleAclById(Long roleAclId) {
        try {
            RoleAclRelation roleAcl = roleAclService.selectById(roleAclId);
            return new Result(200, roleAcl, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 更新角色功能
     *
     * @param roleAcl
     * @return
     */
    @RequestMapping("/updateRoleAcl")
    public Result updateRoleAcl(@RequestBody RoleAclRelation roleAcl) {
        try {
            roleAclService.update(roleAcl);
            return this.findAllRoleAcl();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 保存角色
     *
     * @param param
     * @return
     */
    @RequestMapping("/saveRole")
    public Result saveRole(@RequestBody RoleInfo param) {
        try {
            roleService.save(param);
            return this.findAllRole();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 删除角色
     *
     * @param roleId
     * @return
     */
    @RequestMapping("/deleteRole")
    public Result deleteRole(Long roleId) {
        try {
            roleService.delete(roleId);
            return this.findAllRole();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 根据角色查询角色功能
     *
     * @param roleName
     * @return
     */
    @RequestMapping("/fidRoleAclByRolename")
    public Result fidRoleAclByRolename(String roleName) {
        try {

            return new Result(200, treeService.selectRoleAclViewParam(roleName), "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 查询角色
     *
     * @return
     */
    @RequestMapping("/findAllRole")
    public Result findAllRole() {
        try {
            List<RoleInfo> list = roleService.select();
            return new Result(200, list, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 根据id查询角色
     *
     * @param roleId
     * @return
     */
    @RequestMapping("/findRoleById")
    public Result findRoleById(Long roleId) {
        try {
            RoleInfo role = roleService.selectById(roleId);
            return new Result(200, role, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 更新角色
     *
     * @param role
     * @return
     */
    @RequestMapping("/updateRole")
    public Result updateRole(@RequestBody RoleInfo role) {
        try {
            roleService.update(role);
            return this.findAllRole();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 查询层级树
     *
     * @return
     */
    @RequestMapping("/aclModuleTree")
    public Result aclModuleTree() {
        try {
            List<AclModuleLevelDto> list = treeService.aclModuleTree();
            return new Result(200, list, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 查询角色权限模块层级树
     *
     * @param roleName 角色名
     * @return
     */
    @RequestMapping("/aclModuleTreeByRolename")
    public Result aclModuleTreeByRolename(String roleName) {
        try {
            List<AclModuleLevelDto> list = treeService.aclModuleTreeByRolename(roleName);
            return new Result(200, list, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 根据用户id及用户名查询权限层级树
     *
     * @param userid
     * @param name
     * @return
     */
    @RequestMapping("/aclModuleTreeByUserIdAndname")
    public Result aclModuleTreeByUserIdAndname(int userid, String name) {
        try {
            List<AclModuleLevelDto> list = treeService.aclModuleTreeByUserIdAndname(userid, name);
            return new Result(200, list, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 根据id查询用户权限
     *
     * @param id
     * @return
     */
    @RequestMapping("/userAcls")
    public Result userAcls(Long id) {
        try {
            List<AclInfo> list = treeService.userAcls(id);
            return new Result(200, list, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 查询系统预定义给用户对应角色的权限
     *
     * @param userid 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    @RequestMapping("/findUserAclsBySystem")
    public Result findUserAclsBySystem(int userid, String name) {
        try {
            List<AclInfo> list = treeService.findUserAclsBySystem(userid, name);
            return new Result(200, list, "成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 查询用户自己的，非系统预定义的权限
     *
     * @param userid 用户di
     * @param name   用户名称【同时也是角色名称】
     * @return
     */
    @RequestMapping("/findUserAclsBySingle")
    public Result findUserAclsBySingle(int userid, String name) {
        try {
            List<AclInfo> list = treeService.findUserAclsBySingle(userid, name);
            return new Result(200, list, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 保存用户组角色关联记录
     *
     * @param param
     * @return
     */
    @RequestMapping("/saveUserRole")
    public Result saveUserRole(@RequestBody UsergroupRoleRelation param) {
        try {
            userRoleService.save(param);
            return this.findAllUserRole();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 绑定用户组-角色信息
     *
     * @param roleId     角色id
     * @param userIdList 需要绑定的用户组id集合
     * @return
     */
    @RequestMapping("/bindUserRole")
    public Result bindUserRole(Long roleId, Long[] userIdList) {
        try {
            userRoleService.bindUserRole(roleId, userIdList);
            return this.findAllUserRole();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 删除用户组角色关联记录
     *
     * @param userRoleId
     * @return
     */
    @RequestMapping("/deleteUserRole")
    public Result deleteUserRole(Long userRoleId) {
        try {
            userRoleService.delete(userRoleId);
            return this.findAllUserRole();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 查询用户组角色关联记录
     *
     * @return
     */
    @RequestMapping("/findAllUserRole")
    public Result findAllUserRole() {
        try {
            List<UsergroupRoleRelation> list = userRoleService.select();
            return new Result(200, list, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 根据id查询用户组角色关联记录
     *
     * @param userRoleId
     * @return
     */
    @RequestMapping("/findUserRoleById")
    public Result findUserRoleById(Long userRoleId) {
        try {
            UsergroupRoleRelation userRole = userRoleService.selectById(userRoleId);
            return new Result(200, userRole, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 更新用户组角色关联记录
     *
     * @param userRole
     * @return
     */
    @RequestMapping("/updateUserRole")
    public Result updateUserRole(@RequestBody UsergroupRoleRelation userRole) {
        try {
            userRoleService.update(userRole);
            return this.findAllUserRole();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 保存用户组
     *
     * @param param
     * @return
     */
    @RequestMapping("/saveUsergroup")
    public Result saveUsergroup(@RequestBody UsergroupInfo param) {
        try {
            usergroupInfoService.save(param);
            return this.findAllUser();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 删除用户组
     *
     * @param usergroupId
     * @return
     */
    @RequestMapping("/deleteUsergroup")
    public Result deleteUsergroup(Long usergroupId) {
        try {
            usergroupInfoService.delete(usergroupId);
            return this.findAllUser();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 查询所有的用户组信息
     *
     * @return
     */
    @RequestMapping("/findAllUsergroup")
    public Result findAllUsergroup() {
        try {
            List<UsergroupInfo> list = usergroupInfoService.select();
            return new Result(200, list, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 根据id查询用户组
     *
     * @param usergroupId
     * @return
     */
    @RequestMapping("/findUsergroupById")
    public Result findUsergroupById(Long usergroupId) {
        try {
            UsergroupInfo user = usergroupInfoService.selectById(usergroupId);
            return new Result(200, user, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 更新用户组
     *
     * @param usergroupInfo
     * @return
     */
    @RequestMapping("/updateUsergroup")
    public Result updateUser(@RequestBody UsergroupInfo usergroupInfo) {
        try {
            usergroupInfoService.update(usergroupInfo);
            return this.findAllUser();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }


    /**
     * 保存用户
     *
     * @param param
     * @return
     */
    @RequestMapping("/saveUser")
    public Result saveUser(@RequestBody UserInfo param) {
        try {
            userService.save(param);
            return this.findAllUser();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 删除用户
     *
     * @param userId
     * @return
     */
    @RequestMapping("/deleteUser")
    public Result deleteUser(Long userId) {
        try {
            userService.delete(userId);
            return this.findAllUser();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 查询用户
     *
     * @return
     */
    @RequestMapping("/findAllUser")
    public Result findAllUser() {
        try {
            List<UserInfo> list = userService.select();
            return new Result(200, list, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 根据id查询用户
     *
     * @param userId
     * @return
     */
    @RequestMapping("/findUserById")
    public Result findUserById(Long userId) {
        try {
            UserInfo user = userService.selectById(userId);
            return new Result(200, user, "成功");
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 更新用户
     *
     * @param user
     * @return
     */
    @RequestMapping("/updateUser")
    public Result updateUser(@RequestBody UserInfo user) {
        try {
            userService.update(user);
            return this.findAllUser();
        } catch (Exception e) {
            return new Result(500, e.getStackTrace(), "失败");
        }
    }

    /**
     * 功能模块与功能点绑定
     *
     * @param ids         角色id集合
     * @param aclModuleId 角色模块id
     * @return
     */
    @RequestMapping("/bondAclModule")
    public Result bondAclModule(Long[] ids, Long aclModuleId) {
        if (ids == null || ids.length < 1 || aclModuleId == null)
            return new Result(500, null, "输入参数错误");
        aclService.updateSysAcl1(ids, aclModuleId);
        return this.findAllAcl();
    }

}
