package cn.returntmp.happyshare.service.impl;


import cn.returntmp.happyshare.core.exception.ServiceException;
import cn.returntmp.happyshare.core.exception.TransactionException;
import cn.returntmp.happyshare.core.service.AbstractService;
import cn.returntmp.happyshare.dto.ArticleDTO;
import cn.returntmp.happyshare.entity.Sponsor;
import cn.returntmp.happyshare.entity.TransactionRecord;
import cn.returntmp.happyshare.enumerate.TransactionCode;
import cn.returntmp.happyshare.enumerate.TransactionEnum;
import cn.returntmp.happyshare.mapper.SponsorMapper;
import cn.returntmp.happyshare.service.ArticleService;
import cn.returntmp.happyshare.service.SponsorService;
import cn.returntmp.happyshare.service.TransactionRecordService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;

/**
 * @author ronger
 */
@Service
public class SponsorServiceImpl extends AbstractService<Sponsor> implements SponsorService {

    @Resource
    private SponsorMapper sponsorMapper;
    @Resource
    private ArticleService articleService;
    @Resource
    private TransactionRecordService transactionRecordService;

    @Override
    @Transactional(rollbackFor = ServiceException.class)
    public boolean sponsorship(Sponsor sponsor) throws ServiceException {
        TransactionEnum transactionEnum = TransactionEnum.findTransactionEnum(sponsor.getDataType());
        BigDecimal money = BigDecimal.valueOf(transactionEnum.getMoney());
        sponsor.setSponsorshipMoney(money);
        sponsor.setSponsorshipTime(new Date());
        sponsorMapper.insertSelective(sponsor);
        // 赞赏金额划转
        if (transactionEnum.isArticleSponsor()) {
            ArticleDTO articleDTO = articleService.findArticleDTOById(sponsor.getDataId(), 1);
            TransactionRecord transactionRecord = transactionRecordService.userTransfer(articleDTO.getArticleAuthorId(), sponsor.getSponsor(), transactionEnum);
            if (Objects.isNull(transactionRecord.getIdTransactionRecord())) {
                throw new TransactionException(TransactionCode.INSUFFICIENT_BALANCE);
            }
            // 更新文章赞赏数
            int result = sponsorMapper.updateArticleSponsorCount(articleDTO.getIdArticle());
            if (result == 0) {
                throw new ServiceException("操作失败!");
            }
        }
        return true;
    }
}
