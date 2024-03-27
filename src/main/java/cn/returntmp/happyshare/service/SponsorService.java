package cn.returntmp.happyshare.service;

import cn.returntmp.happyshare.core.exception.ServiceException;
import cn.returntmp.happyshare.core.service.Service;
import cn.returntmp.happyshare.entity.Sponsor;

/**
 * @author ronger
 */
public interface SponsorService extends Service<Sponsor> {
    /**
     * 赞赏
     *
     * @param sponsor
     * @return
     * @throws ServiceException
     */
    boolean sponsorship(Sponsor sponsor) throws ServiceException;
}
