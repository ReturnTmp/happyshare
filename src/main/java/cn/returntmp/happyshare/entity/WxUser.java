package cn.returntmp.happyshare.entity;


import lombok.Data;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 微信用户
 *
 * @author ronger
 */
@Data
@Table(name = "system_wx_user")
public class WxUser {

    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "JDBC")
    private Long idWxUser;

    private Boolean subscribe;

    private String openId;

    private String nickname;

    private String sexDesc;

    private Integer sex;

    private String language;

    private String city;

    private String province;

    private String country;

    private String headImgUrl;

    private Long subscribeTime;

    private String unionId;

    private String appId;

    private String actToken;
}
