package cn.returntmp.happyshare.web.api.follow;

import cn.returntmp.happyshare.core.result.GlobalResult;
import cn.returntmp.happyshare.core.result.GlobalResultGenerator;
import cn.returntmp.happyshare.entity.Follow;
import cn.returntmp.happyshare.entity.User;
import cn.returntmp.happyshare.service.FollowService;
import cn.returntmp.happyshare.util.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author ronger
 */
@RestController
@RequestMapping("/api/v1/follow")
@RequiresPermissions(value = "user")
public class FollowController {

    @Resource
    private FollowService followService;

    @GetMapping("/is-follow")
    public GlobalResult isFollow(@RequestParam Integer followingId, @RequestParam String followingType) {
        User tokenUser = UserUtils.getCurrentUserByToken();
        Boolean b = followService.isFollow(followingId, followingType, tokenUser.getIdUser());
        return GlobalResultGenerator.genSuccessResult(b);
    }

    @PostMapping
    public GlobalResult<Boolean> follow(@RequestBody Follow follow) {
        User tokenUser = UserUtils.getCurrentUserByToken();
        follow.setFollowerId(tokenUser.getIdUser());
        Boolean b = followService.follow(follow, tokenUser.getNickname());
        return GlobalResultGenerator.genSuccessResult(b);
    }

    @PostMapping("cancel-follow")
    public GlobalResult cancelFollow(@RequestBody Follow follow) {
        User tokenUser = UserUtils.getCurrentUserByToken();
        follow.setFollowerId(tokenUser.getIdUser());
        Boolean b = followService.cancelFollow(follow);
        return GlobalResultGenerator.genSuccessResult(b);
    }


}
