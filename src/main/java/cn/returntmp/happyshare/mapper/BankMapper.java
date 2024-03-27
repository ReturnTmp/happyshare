package cn.returntmp.happyshare.mapper;

import cn.returntmp.happyshare.core.mapper.Mapper;
import cn.returntmp.happyshare.dto.BankDTO;
import cn.returntmp.happyshare.entity.Bank;

import java.util.List;

/**
 * @author ronger
 */
public interface BankMapper extends Mapper<Bank> {
    /**
     * 查询银行列表数据
     *
     * @return
     */
    List<BankDTO> selectBanks();
}
