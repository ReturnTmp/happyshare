package cn.returntmp.happyshare.mapper;

import cn.returntmp.happyshare.core.mapper.Mapper;
import cn.returntmp.happyshare.entity.UserExtend;
import org.apache.ibatis.annotations.Param;

/**
 * @author ronger
 */
public interface UserExtendMapper extends Mapper<UserExtend> {
    /**
     * 获取用户扩展信息
     *
     * @param account
     * @return
     */
    UserExtend selectUserExtendByAccount(@Param("account") String account);
}
