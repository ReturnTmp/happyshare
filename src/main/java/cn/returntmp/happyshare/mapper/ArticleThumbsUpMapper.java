package cn.returntmp.happyshare.mapper;

import cn.returntmp.happyshare.core.mapper.Mapper;
import cn.returntmp.happyshare.entity.ArticleThumbsUp;
import org.apache.ibatis.annotations.Param;

/**
 * @author ronger
 */
public interface ArticleThumbsUpMapper extends Mapper<ArticleThumbsUp> {
    /**
     * 更新文章点赞数
     *
     * @param idArticle
     * @param thumbsUpNumber
     * @return
     */
    Integer updateArticleThumbsUpNumber(@Param("idArticle") Long idArticle, @Param("thumbsUpNumber") Integer thumbsUpNumber);
}
