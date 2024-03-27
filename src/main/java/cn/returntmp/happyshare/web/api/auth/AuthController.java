package cn.returntmp.happyshare.web.api.auth;

import com.alibaba.fastjson2.JSONObject;
import cn.returntmp.happyshare.auth.TokenManager;
import cn.returntmp.happyshare.core.result.GlobalResult;
import cn.returntmp.happyshare.core.result.GlobalResultGenerator;
import cn.returntmp.happyshare.dto.BankAccountDTO;
import cn.returntmp.happyshare.dto.TokenUser;
import cn.returntmp.happyshare.entity.User;
import cn.returntmp.happyshare.service.BankAccountService;
import cn.returntmp.happyshare.service.UserService;
import cn.returntmp.happyshare.util.BeanCopierUtil;
import cn.returntmp.happyshare.util.UserUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Objects;

/**
 * @author ronger
 */
@RestController
@RequestMapping("/api/v1/auth")
public class AuthController {

    @Resource
    private UserService userService;
    @Resource
    TokenManager tokenManager;
    @Resource
    private BankAccountService bankAccountService;

    @PostMapping("/login")
    public GlobalResult<TokenUser> login(@RequestBody User user) {
        TokenUser tokenUser = userService.login(user.getAccount(), user.getPassword());
        return GlobalResultGenerator.genSuccessResult(tokenUser);
    }

    @PostMapping("/refresh-token")
    public GlobalResult<TokenUser> refreshToken(@RequestBody TokenUser tokenUser) {
        tokenUser = userService.refreshToken(tokenUser.getRefreshToken());
        return GlobalResultGenerator.genSuccessResult(tokenUser);
    }

    @PostMapping("/logout")
    public GlobalResult logout() {
        User user = UserUtils.getCurrentUserByToken();
        if (Objects.nonNull(user)) {
            tokenManager.deleteToken(user.getAccount());
        }
        return GlobalResultGenerator.genSuccessResult();
    }

    @GetMapping("/user")
    public GlobalResult<JSONObject> user() {
        User user = UserUtils.getCurrentUserByToken();
        TokenUser tokenUser = new TokenUser();
        BeanCopierUtil.copy(user, tokenUser);
        tokenUser.setScope(userService.findUserPermissions(user));
        BankAccountDTO bankAccountDTO = bankAccountService.findBankAccountByIdUser(user.getIdUser());
        if (Objects.nonNull(bankAccountDTO)) {
            tokenUser.setBankAccount(bankAccountDTO.getBankAccount());
        }
        JSONObject object = new JSONObject();
        object.put("user", tokenUser);
        return GlobalResultGenerator.genSuccessResult(object);
    }

}
