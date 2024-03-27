package cn.returntmp.happyshare.lucene.mapper;

import cn.returntmp.happyshare.dto.ArticleDTO;
import cn.returntmp.happyshare.lucene.model.ArticleLucene;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ArticleLuceneMapper
 *
 * @author suwen
 * @date 2021/2/3 10:00
 */
@Mapper
public interface ArticleLuceneMapper {

    /**
     * 加载所有文章内容
     *
     * @return
     */
    List<ArticleLucene> getAllArticleLucene();

    /**
     * 加载所有文章内容
     *
     * @param ids 文章id(半角逗号分隔)
     * @return
     */
    List<ArticleDTO> getArticlesByIds(@Param("ids") Long[] ids);


    /**
     * 加载文章内容
     *
     * @param id 文章id
     * @return
     */
    ArticleLucene getById(@Param("id") Long id);

}
