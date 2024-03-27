package cn.returntmp.happyshare.auth;

import cn.returntmp.happyshare.util.UserUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;

/**
 * @author ronger
 */
public class BaseHashedCredentialsMatcher extends HashedCredentialsMatcher {

    /**
     * 检查给定的身份验证令牌是否与身份验证信息匹配
     *
     * @param token
     * @param info
     * @return
     */
    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        UserUtils.getTokenUser(token.getCredentials().toString());
        // 暂时不做密码校验
        return true;
    }
}
