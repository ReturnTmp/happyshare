package cn.returntmp.happyshare.entity;


import lombok.Data;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 文章详细内容
 *
 * @author ronger
 */
@Data
@Table(name = "system_article_content")
public class ArticleContent {

    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "JDBC")
    private Long idArticle;
    /**
     * 文章内容（md格式）
     */
    private String articleContent;
    /**
     * 文章内容（html格式）
     */
    private String articleContentHtml;

    private Date createdTime;

    private Date updatedTime;

}
