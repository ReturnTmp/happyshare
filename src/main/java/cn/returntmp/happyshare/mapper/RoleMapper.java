package cn.returntmp.happyshare.mapper;

import cn.returntmp.happyshare.core.mapper.Mapper;
import cn.returntmp.happyshare.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper extends Mapper<Role> {

    List<Role> selectRoleByIdUser(@Param("id") Long id);

    Role selectRoleByInputCode(@Param("inputCode") String inputCode);

    Integer updateStatus(@Param("idRole") Long idRole, @Param("status") String status);

    Integer update(@Param("idRole") Long idRole, @Param("name") String name, @Param("inputCode") String inputCode, @Param("weights") Integer weights);
}