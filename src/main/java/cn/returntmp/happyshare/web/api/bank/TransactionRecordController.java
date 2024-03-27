package cn.returntmp.happyshare.web.api.bank;

import cn.returntmp.happyshare.core.result.GlobalResult;
import cn.returntmp.happyshare.core.result.GlobalResultGenerator;
import cn.returntmp.happyshare.entity.TransactionRecord;
import cn.returntmp.happyshare.service.TransactionRecordService;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author ronger
 */
@RestController
@RequestMapping("/api/v1/transaction")
@RequiresRoles(value = {"blog_admin", "admin"}, logical = Logical.OR)
public class TransactionRecordController {

    @Resource
    private TransactionRecordService transactionRecordService;

    @PostMapping("/transfer")
    public GlobalResult<TransactionRecord> transfer(@RequestBody TransactionRecord transactionRecord) {
        transactionRecord = transactionRecordService.transfer(transactionRecord);
        return GlobalResultGenerator.genSuccessResult(transactionRecord);
    }

    @PostMapping("/newbie-rewards")
    public GlobalResult<TransactionRecord> newbieRewards(@RequestBody TransactionRecord transactionRecord) {
        transactionRecord = transactionRecordService.newbieRewards(transactionRecord);
        return GlobalResultGenerator.genSuccessResult(transactionRecord);
    }

}
