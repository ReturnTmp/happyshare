package cn.returntmp.happyshare.mapper;

import cn.returntmp.happyshare.core.mapper.Mapper;
import cn.returntmp.happyshare.entity.Permission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PermissionMapper extends Mapper<Permission> {

    List<Permission> selectMenuByIdRole(@Param("role") Long role);
}