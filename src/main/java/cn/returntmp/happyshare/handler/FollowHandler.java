package cn.returntmp.happyshare.handler;

import com.alibaba.fastjson.JSON;
import cn.returntmp.happyshare.core.constant.NotificationConstant;
import cn.returntmp.happyshare.handler.event.FollowEvent;
import cn.returntmp.happyshare.util.NotificationUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.event.TransactionalEventListener;

import javax.mail.MessagingException;

/**
 * Created on 2023/4/28 16:07.
 *
 * @author ronger
 * @email ronger-x@outlook.com
 * @desc : cn.returntmp.happyshare.handler
 */
@Slf4j
@Component
public class FollowHandler {
    @TransactionalEventListener
    public void processFollowEvent(FollowEvent followEvent) throws MessagingException {
        log.info(String.format("执行关注相关事件: [%s]", JSON.toJSONString(followEvent)));
        // 发送系统通知
        NotificationUtils.saveNotification(followEvent.getFollowingId(), followEvent.getIdFollow(), NotificationConstant.Follow, followEvent.getSummary());
        log.info("执行完成关注相关事件...");
    }
}
