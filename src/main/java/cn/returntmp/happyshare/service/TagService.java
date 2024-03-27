package cn.returntmp.happyshare.service;

import cn.returntmp.happyshare.core.service.Service;
import cn.returntmp.happyshare.dto.LabelModel;
import cn.returntmp.happyshare.entity.Article;
import cn.returntmp.happyshare.entity.Tag;

import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * @author ronger
 */
public interface TagService extends Service<Tag> {

    /**
     * 保存文章标签
     *
     * @param article
     * @param articleContentHtml
     * @param userId
     * @return
     * @throws UnsupportedEncodingException
     */
    Integer saveTagArticle(Article article, String articleContentHtml, Long userId) throws UnsupportedEncodingException;

    /**
     * 清除未使用标签
     *
     * @return
     */
    boolean cleanUnusedTag();

    /**
     * 添加/更新标签
     *
     * @param tag
     * @return
     */
    Tag saveTag(Tag tag) throws Exception;

    /**
     * 获取标签列表
     *
     * @return
     */
    List<LabelModel> findTagLabels();
}
