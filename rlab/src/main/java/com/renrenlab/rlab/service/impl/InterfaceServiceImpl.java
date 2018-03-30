package com.renrenlab.rlab.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.dao.CommonBannerDao;
import com.renrenlab.rlab.model.CommonBanner;
import com.renrenlab.rlab.service.InterfaceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor =  Exception.class)
public class InterfaceServiceImpl implements InterfaceService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private CommonBannerDao commonBannerDao;

    @Override
    public List<CommonBanner> searchBannerList(Integer position) {
        CommonBanner commonBanner = new CommonBanner();
        commonBanner.setbPosition(position);
        //查询不为2（删除）状态的轮播图
        commonBanner.setbState((short) 2);
        List<CommonBanner> bannerList = commonBannerDao.selectByCondition(commonBanner);
        return bannerList;
    }

    @Override
    public int addBanner(CommonBanner banner) {
        int i = commonBannerDao.insertSelective(banner);
        return i;
    }

    @Override
    public int updateBanner(CommonBanner banner) {
        //重置状态为停用
        int i = commonBannerDao.updateByPrimaryKeySelective(banner);
        return i;
    }

    /**
     * 轮播图排序
     * @param banners
     * @return
     */
    @Override
    public int sortBanner(List<CommonBanner> banners) {
        try {
            for (CommonBanner banner : banners) {
                commonBannerDao.updateByPrimaryKeySelective(banner);
            }
            return 1;
        }catch (Exception e){
            logger.error(e.toString());
        }
        return 0;
    }

    @Override
    public CommonBanner searchBanner(Long bid) {
        CommonBanner banner = commonBannerDao.selectByPrimaryKey(bid);
        return banner;
    }

    @Override
    public List<CommonBanner> searchFrontBannerList(Integer bannerPositionInfo) {
        //查询为2（正常）状态的轮播图
        short state = 1;
        List<CommonBanner> bannerList = commonBannerDao.selectFrontBannerList(bannerPositionInfo,state);
        return bannerList;
    }
}
