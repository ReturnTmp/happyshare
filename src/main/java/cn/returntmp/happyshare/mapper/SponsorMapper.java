package cn.returntmp.happyshare.mapper;

import cn.returntmp.happyshare.core.mapper.Mapper;
import cn.returntmp.happyshare.entity.Sponsor;
import org.apache.ibatis.annotations.Param;

/**
 * @author ronger
 */
public interface SponsorMapper extends Mapper<Sponsor> {
    /**
     * 更新文章赞赏数
     *
     * @param idArticle
     * @return
     */
    Integer updateArticleSponsorCount(@Param("idArticle") Long idArticle);
}
