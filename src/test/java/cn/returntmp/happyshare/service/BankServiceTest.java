package cn.returntmp.happyshare.service;

import cn.returntmp.happyshare.base.BaseServiceTest;
import cn.returntmp.happyshare.dto.BankDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class BankServiceTest extends BaseServiceTest {


    @Autowired
    private BankService bankService;

    @Test
    @DisplayName("测试查询银行列表")
    public void findBanks() {
        List<BankDTO> banks = bankService.findBanks();
        assertEquals(2L, banks.size());
    }


}