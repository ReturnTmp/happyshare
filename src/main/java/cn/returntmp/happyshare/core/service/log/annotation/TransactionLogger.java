package cn.returntmp.happyshare.core.service.log.annotation;

import cn.returntmp.happyshare.enumerate.TransactionEnum;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * @author ronger
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface TransactionLogger {

    TransactionEnum transactionType();

}
