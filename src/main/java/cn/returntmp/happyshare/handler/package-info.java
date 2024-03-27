/**
 * 配置事件监听处理，保证事件顺序执行
 * 包含账户，文章，评论，跟随等
 * <p>
 * 需要注意使用的事件监听注解为 @TransactionalEventListener，而不是 @EventListener
 * 目的是保证事件监听处理在事务不同阶段中触发执行
 */
package cn.returntmp.happyshare.handler;
