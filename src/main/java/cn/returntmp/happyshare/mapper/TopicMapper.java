package cn.returntmp.happyshare.mapper;

import cn.returntmp.happyshare.core.mapper.Mapper;
import cn.returntmp.happyshare.dto.admin.TagDTO;
import cn.returntmp.happyshare.dto.admin.TopicDTO;
import cn.returntmp.happyshare.entity.Tag;
import cn.returntmp.happyshare.entity.Topic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author ronger
 */
public interface TopicMapper extends Mapper<Topic> {
    /**
     * 获取导航主题
     *
     * @return
     */
    List<Topic> selectTopicNav();

    /**
     * @param topicUri
     * @return
     */
    TopicDTO selectTopicByTopicUri(@Param("topicUri") String topicUri);

    /**
     * @param idTopic
     * @return
     */
    List<TagDTO> selectTopicTag(@Param("idTopic") Integer idTopic);

    /**
     * 更新
     *
     * @param idTopic
     * @param topicTitle
     * @param topicUri
     * @param topicIconPath
     * @param topicNva
     * @param topicStatus
     * @param topicSort
     * @param topicDescription
     * @param topicDescriptionHtml
     * @return
     */
    Integer update(@Param("idTopic") Long idTopic, @Param("topicTitle") String topicTitle, @Param("topicUri") String topicUri, @Param("topicIconPath") String topicIconPath, @Param("topicNva") String topicNva, @Param("topicStatus") String topicStatus, @Param("topicSort") Integer topicSort, @Param("topicDescription") String topicDescription, @Param("topicDescriptionHtml") String topicDescriptionHtml);

    /**
     * @param idTopic
     * @param tagTitle
     * @return
     */
    List<Tag> selectUnbindTagsById(@Param("idTopic") Long idTopic, @Param("tagTitle") String tagTitle);

    Integer insertTopicTag(@Param("idTopic") Long idTopic, @Param("idTag") Long idTag);

    /**
     * @param idTopic
     * @param idTag
     * @return
     */
    Integer deleteTopicTag(@Param("idTopic") Long idTopic, @Param("idTag") Long idTag);
}
