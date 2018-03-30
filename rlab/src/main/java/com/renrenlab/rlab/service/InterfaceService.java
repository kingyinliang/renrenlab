package com.renrenlab.rlab.service;


import com.renrenlab.rlab.model.CommonBanner;

import java.util.List;

public interface InterfaceService {

    /**
     * 后台获取轮播列表
     * @param position
     * @return
     */
    List<CommonBanner> searchBannerList(Integer position);

    int addBanner(CommonBanner banner);

    int updateBanner(CommonBanner banner);

    int sortBanner(List<CommonBanner> banners);

    CommonBanner searchBanner(Long bid);

    /**
     * 前台获取轮播列表
     * @param bannerPositionInfo
     * @return
     */
    List<CommonBanner> searchFrontBannerList(Integer bannerPositionInfo);
}
