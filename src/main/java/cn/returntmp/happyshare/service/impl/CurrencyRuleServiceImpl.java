package cn.returntmp.happyshare.service.impl;

import cn.returntmp.happyshare.core.service.AbstractService;
import cn.returntmp.happyshare.entity.CurrencyRule;
import cn.returntmp.happyshare.mapper.CurrencyRuleMapper;
import cn.returntmp.happyshare.service.CurrencyRuleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author ronger
 */
@Service
public class CurrencyRuleServiceImpl extends AbstractService<CurrencyRule> implements CurrencyRuleService {

    @Resource
    private CurrencyRuleMapper currencyRuleMapper;

}
