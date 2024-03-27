package cn.returntmp.happyshare;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

/**
 * @author ronger
 */
@EnableAsync
@SpringBootApplication
public class HappyshareApplication {

    public static void main(String[] args) {
        SpringApplication.run(HappyshareApplication.class, args);
    }
}
