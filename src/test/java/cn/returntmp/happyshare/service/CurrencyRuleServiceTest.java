package cn.returntmp.happyshare.service;

import cn.returntmp.happyshare.base.BaseServiceTest;
import cn.returntmp.happyshare.entity.CurrencyRule;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class CurrencyRuleServiceTest extends BaseServiceTest {

    @Autowired
    private CurrencyRuleService currencyRuleService;

    @Test
    void currencyService() {
        List<CurrencyRule> all = currencyRuleService.findAll();
        assertEquals(0, all.size());
    }

}