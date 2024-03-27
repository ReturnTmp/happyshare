package cn.returntmp.happyshare.service;

import cn.returntmp.happyshare.base.BaseServiceTest;
import cn.returntmp.happyshare.dto.NotificationDTO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import javax.mail.MessagingException;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * javaMail测试
 */
class JavaMailServiceTest extends BaseServiceTest {

    private static final String REALITY_EMAIL = "3055871692@qq.com";
    @Autowired
    private JavaMailService javaMailService;

    @Test
    void sendEmailCode() throws MessagingException {
        assertEquals(1, javaMailService.sendEmailCode(REALITY_EMAIL));
    }

    @Test
    void sendForgetPasswordEmail() throws MessagingException {
        assertEquals(1, javaMailService.sendForgetPasswordEmail(REALITY_EMAIL));
    }

    @Test
    void sendNotification() throws MessagingException {
        assertEquals(0, javaMailService.sendNotification(new NotificationDTO()));

    }
}
