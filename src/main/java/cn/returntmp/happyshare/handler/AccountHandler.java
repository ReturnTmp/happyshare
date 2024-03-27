package cn.returntmp.happyshare.handler;

import cn.returntmp.happyshare.handler.event.AccountEvent;
import cn.returntmp.happyshare.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.event.TransactionalEventListener;

import javax.annotation.Resource;

/**
 * Created on 2022/8/24 14:44.
 *
 * @author ronger
 * @email ronger-x@outlook.com
 * @packageName cn.returntmp.happyshare.handler
 */
@Slf4j
@Component
public class AccountHandler {

    @Resource
    private UserMapper userMapper;

    @TransactionalEventListener
    public void processAccountLastOnlineTimeEvent(AccountEvent accountEvent) {
        userMapper.updateLastOnlineTimeByAccount(accountEvent.getAccount());
    }

}
