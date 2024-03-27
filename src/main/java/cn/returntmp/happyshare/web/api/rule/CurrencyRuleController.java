package cn.returntmp.happyshare.web.api.rule;

import cn.returntmp.happyshare.core.result.GlobalResult;
import cn.returntmp.happyshare.core.result.GlobalResultGenerator;
import cn.returntmp.happyshare.entity.CurrencyRule;
import cn.returntmp.happyshare.service.CurrencyRuleService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ronger
 */
@RestController
@RequestMapping("/api/v1/rule/currency")
public class CurrencyRuleController {

    @Resource
    private CurrencyRuleService currencyRuleService;

    @GetMapping("/list")
    public GlobalResult list() {
        List<CurrencyRule> list = currencyRuleService.findAll();
        return GlobalResultGenerator.genSuccessResult(list);
    }

}
