package cn.returntmp.happyshare.handler;

import com.alibaba.fastjson.JSON;
import cn.returntmp.happyshare.core.constant.NotificationConstant;
import cn.returntmp.happyshare.entity.Comment;
import cn.returntmp.happyshare.handler.event.CommentEvent;
import cn.returntmp.happyshare.mapper.CommentMapper;
import cn.returntmp.happyshare.util.Html2TextUtil;
import cn.returntmp.happyshare.util.NotificationUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.event.TransactionalEventListener;

import javax.annotation.Resource;
import javax.mail.MessagingException;

/**
 * Created on 2022/8/17 7:38.
 *
 * @author ronger
 * @email ronger-x@outlook.com
 * @packageName cn.returntmp.happyshare.handler
 */
@Slf4j
@Component
public class CommentHandler {

    private static final int MAX_PREVIEW = 200;
    @Resource
    private CommentMapper commentMapper;

    @TransactionalEventListener
    public void processCommentCreatedEvent(CommentEvent commentEvent) throws MessagingException {
        log.info(String.format("开始执行评论发布事件：[%s]", JSON.toJSONString(commentEvent)));
        String commentContent = commentEvent.getContent();
        int length = commentContent.length();
        if (length > MAX_PREVIEW) {
            length = 200;
        }
        String commentPreviewContent = commentContent.substring(0, length);
        commentContent = Html2TextUtil.getContent(commentPreviewContent);
        // 判断是否是回复消息
        if (commentEvent.getCommentOriginalCommentId() != null && commentEvent.getCommentOriginalCommentId() != 0) {
            Comment originalComment = commentMapper.selectByPrimaryKey(commentEvent.getCommentOriginalCommentId());
            // 回复消息时,评论者不是上级评论作者则进行消息通知
            if (!commentEvent.getCommentAuthorId().equals(originalComment.getCommentAuthorId())) {
                NotificationUtils.saveNotification(originalComment.getCommentAuthorId(), commentEvent.getIdComment(), NotificationConstant.Comment, commentContent);
            }
        } else {
            // 评论者不是作者本人则进行消息通知
            if (!commentEvent.getCommentAuthorId().equals(commentEvent.getArticleAuthorId())) {
                NotificationUtils.saveNotification(commentEvent.getArticleAuthorId(), commentEvent.getIdComment(), NotificationConstant.Comment, commentContent);
            }
        }
    }
}
