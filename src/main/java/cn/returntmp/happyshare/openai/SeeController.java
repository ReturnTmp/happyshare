package cn.returntmp.happyshare.openai;

import cn.returntmp.happyshare.entity.User;
import cn.returntmp.happyshare.openai.service.SseService;
import cn.returntmp.happyshare.util.UserUtils;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import javax.annotation.Resource;

/**
 * Created on 2023/5/26 11:26.
 *
 * @author ronger
 * @email ronger-x@outlook.com
 * @desc : cn.returntmp.happyshare.openai
 */
@RestController
@RequestMapping("/api/v1/sse")
public class SeeController {

    @Resource
    private SseService sseService;

    @GetMapping(value = "/subscribe/{idUser}", produces = {MediaType.TEXT_EVENT_STREAM_VALUE})
    public SseEmitter subscribe(@PathVariable Long idUser) {
        return sseService.connect(idUser);
    }

    @GetMapping(value = "/close/{idUser}")
    public void close(@PathVariable Long idUser) {
        sseService.close(idUser);
    }

}
