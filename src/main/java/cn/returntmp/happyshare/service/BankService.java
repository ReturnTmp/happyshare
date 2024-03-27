package cn.returntmp.happyshare.service;

import cn.returntmp.happyshare.core.service.Service;
import cn.returntmp.happyshare.dto.BankDTO;
import cn.returntmp.happyshare.entity.Bank;

import java.util.List;

/**
 * 银行
 *
 * @author ronger
 */
public interface BankService extends Service<Bank> {
    List<BankDTO> findBanks();
}
