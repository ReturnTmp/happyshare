package cn.returntmp.happyshare.service.impl;

import cn.returntmp.happyshare.core.exception.BusinessException;
import cn.returntmp.happyshare.core.exception.ServiceException;
import cn.returntmp.happyshare.core.service.AbstractService;
import cn.returntmp.happyshare.dto.admin.TagDTO;
import cn.returntmp.happyshare.dto.admin.TopicDTO;
import cn.returntmp.happyshare.dto.admin.TopicTagDTO;
import cn.returntmp.happyshare.entity.Tag;
import cn.returntmp.happyshare.entity.Topic;
import cn.returntmp.happyshare.enumerate.FilePath;
import cn.returntmp.happyshare.mapper.TopicMapper;
import cn.returntmp.happyshare.service.TopicService;
import cn.returntmp.happyshare.util.XssUtils;
import cn.returntmp.happyshare.web.api.common.UploadController;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Condition;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author ronger
 */
@Service
public class TopicServiceImpl extends AbstractService<Topic> implements TopicService {

    @Resource
    private TopicMapper topicMapper;

    @Override
    public List<Topic> findTopicNav() {
        return topicMapper.selectTopicNav();
    }

    @Override
    public Topic findTopicByTopicUri(String topicUri) {
        Topic searchTopic = new Topic();
        searchTopic.setTopicUri(topicUri);
        return topicMapper.selectOne(searchTopic);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Topic saveTopic(Topic topic) throws ServiceException {
        Integer result;
        topic.setTopicDescriptionHtml(XssUtils.filterHtmlCode(topic.getTopicDescriptionHtml()));
        if (topic.getIdTopic() == null) {
            if (StringUtils.isBlank(topic.getTopicTitle())) {
                throw new IllegalArgumentException("标签名不能为空!");
            } else {
                Condition topicCondition = new Condition(Topic.class);
                topicCondition.createCriteria().andCondition("topic_title =", topic.getTopicTitle());
                List<Topic> topics = topicMapper.selectByCondition(topicCondition);
                if (!topics.isEmpty()) {
                    throw new BusinessException("专题 '" + topic.getTopicTitle() + "' 已存在!");
                }
            }
            if (StringUtils.isNotBlank(topic.getTopicIconPath()) && topic.getTopicIconPath().contains("base64")) {
                String topicIconPath = UploadController.uploadBase64File(topic.getTopicIconPath(), FilePath.TOPIC);
                topic.setTopicIconPath(topicIconPath);
            } else {
                topic.setTopicIconPath(topic.getTopicIconPath());
            }
            topic.setTopicNva(topic.getTopicNva());
            topic.setTopicStatus(topic.getTopicStatus());
            topic.setTopicSort(topic.getTopicSort());
            topic.setTopicDescription(topic.getTopicDescription());
            topic.setTopicDescriptionHtml(topic.getTopicDescriptionHtml());
            topic.setCreatedTime(new Date());
            topic.setUpdatedTime(topic.getCreatedTime());
            result = topicMapper.insertSelective(topic);
        } else {
            if (StringUtils.isNotBlank(topic.getTopicIconPath()) && topic.getTopicIconPath().contains("base64")) {
                String topicIconPath = UploadController.uploadBase64File(topic.getTopicIconPath(), FilePath.TOPIC);
                topic.setTopicIconPath(topicIconPath);
            }
            topic.setUpdatedTime(new Date());
            result = topicMapper.update(topic.getIdTopic(), topic.getTopicTitle(), topic.getTopicUri()
                    , topic.getTopicIconPath(), topic.getTopicNva(), topic.getTopicStatus()
                    , topic.getTopicSort(), topic.getTopicDescription(), topic.getTopicDescriptionHtml());
        }
        if (result == 0) {
            throw new ServiceException("操作失败!");
        }
        return topic;
    }

    @Override
    public List<Tag> findUnbindTagsById(Long idTopic, String tagTitle) {
        if (StringUtils.isBlank(tagTitle)) {
            tagTitle = "";
        }
        return topicMapper.selectUnbindTagsById(idTopic, tagTitle);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public TopicTagDTO bindTopicTag(TopicTagDTO topicTag) throws ServiceException {
        Integer result = topicMapper.insertTopicTag(topicTag.getIdTopic(), topicTag.getIdTag());
        if (result == 0) {
            throw new ServiceException("操作失败!");
        }
        return topicTag;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public TopicTagDTO unbindTopicTag(TopicTagDTO topicTag) throws ServiceException {
        Integer result = topicMapper.deleteTopicTag(topicTag.getIdTopic(), topicTag.getIdTag());
        if (result == 0) {
            throw new ServiceException("操作失败!");
        }
        return topicTag;
    }

    @Override
    public List<TagDTO> findTagsByTopicUri(String topicUri) {
        TopicDTO topic = topicMapper.selectTopicByTopicUri(topicUri);
        if (topic == null) {
            return null;
        }
        return topicMapper.selectTopicTag(topic.getIdTopic());
    }
}
