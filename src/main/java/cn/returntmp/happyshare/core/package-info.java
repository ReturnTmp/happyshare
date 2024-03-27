/**
 * 核心模块，提供常量、异常
 * 提供返回结果，返回消息，返回码，返回函数
 * <p>
 * 服务层（存储的均为公共服务层）：
 * <p>
 * log 日志，作为切片实现，日志分别记录仪交易记录，浏览数
 * redis 缓存，提供缓存服务
 * security 安全层，使用 shiro 框架，基于切片注解形式实现 用户信息权限 等功能
 */
package cn.returntmp.happyshare.core;