package cn.returntmp.happyshare.service;

import cn.returntmp.happyshare.core.service.Service;
import cn.returntmp.happyshare.entity.LoginRecord;

import java.util.List;

/**
 * Created on 2022/1/14 8:47.
 *
 * @author ronger
 * @email ronger-x@outlook.com
 * @packageName cn.returntmp.happyshare.service
 */
public interface LoginRecordService extends Service<LoginRecord> {
    /**
     * 保存登录记录
     *
     * @param idUser
     * @return
     */
    LoginRecord saveLoginRecord(Long idUser);

    /**
     * 获取用户登录记录
     *
     * @param idUser
     * @return
     */
    List<LoginRecord> findLoginRecordByIdUser(Integer idUser);
}
