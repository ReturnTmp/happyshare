package cn.returntmp.happyshare.core.service.log;

import cn.returntmp.happyshare.core.result.GlobalResult;
import cn.returntmp.happyshare.core.service.log.annotation.TransactionLogger;
import cn.returntmp.happyshare.entity.User;
import cn.returntmp.happyshare.enumerate.TransactionEnum;
import cn.returntmp.happyshare.service.TransactionRecordService;
import cn.returntmp.happyshare.util.UserUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.lang.reflect.Method;
import java.util.Objects;

/**
 * @author ronger
 */
@Aspect
@Component
public class TransactionAspect {

    Logger logger = LoggerFactory.getLogger(TransactionAspect.class);

    @Resource
    private TransactionRecordService transactionRecordService;

    @Pointcut("@annotation(cn.returntmp.happyshare.core.service.log.annotation.TransactionLogger)")
    public void pointCut() {
    }

    /**
     * 保存交易操作日志
     *
     * @param joinPoint 连接点
     * @return 方法执行结果
     * @throws Throwable 调用出错
     */
    @AfterReturning(value = "pointCut()", returning = "obj")
    public void save(JoinPoint joinPoint, Object obj) throws Exception {
        logger.info("保存交易记录 start ...");
        /**
         * 解析Log注解
         */
        String methodName = joinPoint.getSignature().getName();
        Method method = currentMethod(joinPoint, methodName);
        TransactionLogger log = method.getAnnotation(TransactionLogger.class);
        if (Objects.nonNull(log)) {
            User user = UserUtils.getCurrentUserByToken();
            GlobalResult globalResult = (GlobalResult) obj;
            if (globalResult.isSuccess()) {
                if (TransactionEnum.Answer.equals(log.transactionType())) {
                    if (globalResult.getData().equals(true)) {
                        transactionRecordService.bankTransfer(user.getIdUser(), TransactionEnum.CorrectAnswer);
                    } else {
                        transactionRecordService.bankTransfer(user.getIdUser(), TransactionEnum.Answer);
                    }
                }
            }
        }
        logger.info("保存交易记录 end ...");
    }

    /**
     * 获取当前执行的方法
     *
     * @param joinPoint  连接点
     * @param methodName 方法名称
     * @return 方法
     */
    private Method currentMethod(JoinPoint joinPoint, String methodName) {
        /**
         * 获取目标类的所有方法，找到当前要执行的方法
         */
        Method[] methods = joinPoint.getTarget().getClass().getMethods();
        Method resultMethod = null;
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                resultMethod = method;
                break;
            }
        }
        return resultMethod;
    }
}
