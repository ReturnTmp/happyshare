package cn.returntmp.happyshare.service.impl;

import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import cn.returntmp.happyshare.core.service.AbstractService;
import cn.returntmp.happyshare.entity.LoginRecord;
import cn.returntmp.happyshare.mapper.LoginRecordMapper;
import cn.returntmp.happyshare.service.LoginRecordService;
import cn.returntmp.happyshare.util.Utils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * Created on 2022/1/14 8:48.
 *
 * @author ronger
 * @email ronger-x@outlook.com
 * @packageName cn.returntmp.happyshare.service.impl
 */
@Service
public class LoginRecordServiceImpl extends AbstractService<LoginRecord> implements LoginRecordService {

    @Resource
    private LoginRecordMapper loginRecordMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public LoginRecord saveLoginRecord(Long idUser) {
        HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
        String ip = Utils.getIpAddress(request);
        String ua = request.getHeader("user-agent");
        String fingerprint = request.getHeader("fingerprint");
        LoginRecord loginRecord = new LoginRecord();
        loginRecord.setIdUser(idUser);
        loginRecord.setLoginIp(ip);
        loginRecord.setLoginUa(ua);
        loginRecord.setLoginDeviceId(fingerprint);
        UserAgent userAgent = UserAgentUtil.parse(ua);
        loginRecord.setLoginOS(userAgent.getOs().toString());
        loginRecord.setLoginBrowser(userAgent.getBrowser().toString());
        loginRecord.setCreatedTime(new Date());
        loginRecordMapper.insertSelective(loginRecord);
        return loginRecord;
    }

    @Override
    public List<LoginRecord> findLoginRecordByIdUser(Integer idUser) {
        return loginRecordMapper.selectLoginRecordByIdUser(idUser);
    }
}
