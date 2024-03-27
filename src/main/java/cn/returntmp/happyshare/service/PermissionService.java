package cn.returntmp.happyshare.service;

import cn.returntmp.happyshare.core.service.Service;
import cn.returntmp.happyshare.entity.Permission;
import cn.returntmp.happyshare.entity.User;

import java.util.List;


/**
 * @author CodeGenerator
 * @date 2018/05/29
 */
public interface PermissionService extends Service<Permission> {

    /**
     * 获取用户权限
     *
     * @param sysUser
     * @return
     */
    List<Permission> selectPermissionByUser(User sysUser);
}
