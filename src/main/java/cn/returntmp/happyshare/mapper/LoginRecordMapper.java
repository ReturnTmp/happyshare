package cn.returntmp.happyshare.mapper;

import cn.returntmp.happyshare.core.mapper.Mapper;
import cn.returntmp.happyshare.entity.LoginRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created on 2022/1/14 8:46.
 *
 * @author ronger
 * @email ronger-x@outlook.com
 * @packageName cn.returntmp.happyshare.mapper
 */
public interface LoginRecordMapper extends Mapper<LoginRecord> {
    /**
     * 获取用户登录记录
     *
     * @param idUser
     * @return
     */
    List<LoginRecord> selectLoginRecordByIdUser(@Param("idUser") Integer idUser);
}
