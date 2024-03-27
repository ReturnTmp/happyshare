package cn.returntmp.happyshare.service.impl;

import cn.returntmp.happyshare.core.service.AbstractService;
import cn.returntmp.happyshare.entity.SpecialDay;
import cn.returntmp.happyshare.mapper.SpecialDayMapper;
import cn.returntmp.happyshare.service.SpecialDayService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author ronger
 */
@Service
public class SpecialDayServiceImpl extends AbstractService<SpecialDay> implements SpecialDayService {

    @Resource
    private SpecialDayMapper specialDayMapper;

}
