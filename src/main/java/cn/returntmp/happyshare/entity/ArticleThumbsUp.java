package cn.returntmp.happyshare.entity;


import lombok.Data;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 文章点赞表
 *
 * @author ronger
 */
@Data
@Table(name = "system_article_thumbs_up")
public class ArticleThumbsUp implements Serializable, Cloneable {
    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "JDBC")
    private Long idArticleThumbsUp;
    /**
     * 文章表主键
     */
    private Long idArticle;
    /**
     * 用户表主键
     */
    private Long idUser;
    /**
     * 点赞时间
     */
    private Date thumbsUpTime;
}
