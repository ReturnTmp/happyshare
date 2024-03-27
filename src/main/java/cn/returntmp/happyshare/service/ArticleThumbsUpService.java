package cn.returntmp.happyshare.service;

import cn.returntmp.happyshare.core.service.Service;
import cn.returntmp.happyshare.entity.ArticleThumbsUp;

/**
 * 点赞
 *
 * @author ronger
 */
public interface ArticleThumbsUpService extends Service<ArticleThumbsUp> {
    /**
     * 点赞
     *
     * @param articleThumbsUp
     * @return
     */
    int thumbsUp(ArticleThumbsUp articleThumbsUp);
}
