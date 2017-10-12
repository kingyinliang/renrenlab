package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.exception.BusinessException;
import com.renrenlab.rlab.common.exception.ResponseEntity;
import com.renrenlab.rlab.common.util.InsUtil;
import com.renrenlab.rlab.common.util.OrgUtil;
import com.renrenlab.rlab.common.util.UserUtil;
import com.renrenlab.rlab.dao.*;
import com.renrenlab.rlab.model.*;
import com.renrenlab.rlab.model.OrgLicense;
import com.renrenlab.rlab.service.OrgService;
import com.renrenlab.rlab.vo.*;
import com.renrenlab.rlab.vo.OrgAddress;
import com.renrenlab.rlab.vo.OrgCertificate;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by wanshou on 2017/5/16.
 */
@Service
@Transactional
public class OrgServiceImpl implements OrgService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private OrgDao orgDao;

    @Autowired
    private OrgCodeDao orgCodeDao;

    @Autowired
    private OrgLicenseDao orgLicenseDao;

    @Autowired
    private OrgContactsDao orgContactsDao;

    @Autowired
    private OrgAddressDao orgAddressDao;

    @Autowired
    private OrgManagerDao orgManagerDao;

    @Autowired
    private OrgCertificateDao orgCertificateDao;

    @Autowired
    private OrgContactsMapDao orgContactsMapDao;

    @Autowired
    private InsSearchDao insSearchDao;

    @Autowired
    private InstrumentBaseInfoDao instrumentBaseInfoDao;

    @Autowired
    private UserBaseInfoDao userBaseInfoDao;

    /**
     * 根据id查询机构基础信息
     *
     * @param oid
     * @return
     */
    public OrgBaseInfo searchOrgBaseInfoByOid(long oid) {
        return orgDao.searchOrgBaseInfoByOid(oid);
    }

    @Override
    public List<OrgInfo> searchOrgBaseInfoListTopK(Integer k) {
        k = k == null || k < 1 || k > 10 ? 3 : k;
        List<OrgInfo> orgInfoList = orgDao.searchOrgBaseInfoListTopK(k);
        int tmp = 1;
        for (OrgInfo orgInfo : orgInfoList) {
            //处理orgLogo
            orgInfo.setOrgLogo(OrgUtil.toRightOrgPicUrl(orgInfo.getOrgLogo(), Constant.ORGIMG));
            //处理机构共享指数为数组
            Long shareIndexValue = (long) orgInfo.getOrgShareIndex().floatValue();
            String shareIndex = shareIndexValue.toString();
            int i = 0;
            List<Character> list = new ArrayList<Character>();
            while (i < shareIndex.length()) {
                list.add(shareIndex.charAt(i));
                i++;
            }
            orgInfo.setOrgShareIndexList(list);
            orgInfo.setOrgShareIndexStr(UserUtil.toConvertShareIndex(orgInfo.getOrgShareIndex()));
            //处理机构共享排名为数组
            Integer rankValue = orgInfo.getOrgRank();
            String rank = rankValue.toString();
            int j = 0;
            List<Character> rankList = new ArrayList<Character>();
            while (j < rank.length()) {
                rankList.add(rank.charAt(j));
                j++;
            }
            orgInfo.setOrgRankList(rankList);
            orgInfo.setOrgRank(tmp);
            tmp++;
        }
        return orgInfoList;
    }

    /**
     * 根据id查询机构详细信息
     *
     * @param oid
     * @return
     */
    public OrgInfo searchOrgInfoByOid(long oid) {
        //查询机构基本信息
        OrgInfo orgInfo = orgDao.searchOrgInfoByOid(oid);
        if (orgInfo != null) {
            //查询父机构信息
            if (orgInfo.getOrgParentId() != 0) {
                OrgInfo parentOrgInfo = orgDao.searchOrgInfoByOid(orgInfo.getOrgParentId());
                if (parentOrgInfo != null && parentOrgInfo.getOrgName() != null)
                    orgInfo.setParentOrgName(parentOrgInfo.getOrgName());
            }
            //查询组织机构代码信息
            OrgCode orgCode = orgCodeDao.searchOrgCodeByOrgId(orgInfo.getOrgOid());
            if (orgCode != null) {
                orgInfo.setOrgCode(orgCode.getOrgCode());
                /**兼容以前2.1版本**/
                orgInfo.setOrgCodeObject(orgCode);
            }
            //查询营业执照信息
            OrgLicense orgLicense = orgLicenseDao.searchOrgLicenseByOrgId(orgInfo.getOrgOid());
            if (orgLicense != null) {
                //处理orgLicense
                orgInfo.setOrgLicense(orgLicense);
                orgInfo.setOrgLicensePic(OrgUtil.toRightOrgPicUrl(orgLicense.getOrgLicensePic(), Constant.ORGIMG));
            }
            //查询机构座机
            OrgContacts orgContacts = orgContactsDao.searchOrgContactsByOrgId(orgInfo.getOrgOid());
            if (orgContacts != null && orgContacts.getConPhone()!=null) {
                String[] phones = orgContacts.getConPhone().split(",");
                orgContacts.setConPhoneList(Arrays.asList(phones));
                orgInfo.setOrgContacts(orgContacts);
            }
            //查询机构联系人信息
            List<OrgContacts> orgContactsList = orgContactsDao.searchContactsByOrgId(orgInfo.getOrgOid(), 2);
            orgInfo.setOrgContactsList(orgContactsList);
            for(OrgContacts orgContacts1 : orgContactsList){
                String[] phones = orgContacts1.getConPhone().split(",");
                orgContacts1.setConPhoneList(Arrays.asList(phones));
            }

            //查询机构联系地址信息
            OrgAddress orgAddress = orgAddressDao.searchOrgAddressByOrgId(orgInfo.getOrgOid());
            if (orgAddress != null) {
                orgInfo.setOrgAddress(orgAddress);
            }
            //查询机构资质信息
            List<OrgCertificate> orgCertificateList = orgCertificateDao.searchOrgCertificateByOrgId(orgInfo.getOrgOid());
            if (orgCertificateList != null && orgCertificateList.size() > 0) {
                orgInfo.setOrgCertificateList(orgCertificateList);
            }
            //查询机构管理者信息
            List<OrgManager> orgManagerList = orgManagerDao.searchOrgManagerByOrgId(orgInfo.getOrgOid());
            if (orgManagerList != null && orgManagerList.size() > 0) {
                for (OrgManager orgManager : orgManagerList) {
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    orgManager.setCreateTimeStr(format.format(orgManager.getCreateTime()));
                    if (orgManager.getManagerType() == 0) {
                        orgInfo.setuMobile(orgManager.getuMobile());
                        orgInfo.setuUid(orgManager.getuUid());
                        orgInfo.setOrgMid(orgManager.getOrgMid());
                    }
                }
                orgInfo.setOrgManagerList(orgManagerList);
            }

            //查询机构下仪器数量
            Integer count = orgDao.searchInsCountByOrgId(orgInfo.getOrgOid());
            orgInfo.setOrgInsCount(count);

            //查询机构对接业务人员
            UserBaseInfo userBaseInfo = null;
            if(orgInfo.getOrgBizUid() != null && (userBaseInfo = userBaseInfoDao.selectUserBaseInfoByUUid(orgInfo.getOrgBizUid())) != null){
                orgInfo.setOrgBizName(userBaseInfo.getuName());
            }else {
                orgInfo.setOrgBizName("人人实验");
            }


            //处理机构性质
            orgInfo.setOrgCategory(OrgUtil.toOrgCategory(orgInfo.getOrgCategoryId()));

            //处理orgLogo
            orgInfo.setOrgLogo(OrgUtil.toRightOrgPicUrl(orgInfo.getOrgLogo(), Constant.ORGIMG));

            //处理机构LOGO位置
            orgInfo.setOrgPositionList(OrgUtil.toRightOrgPosition(orgInfo.getOrgPosition()));

            //处理机构来源
            orgInfo.setOrgSourceStr(OrgUtil.toConvertOrgSource(orgInfo.getOrgSource()));

            //处理机构认证状态
            orgInfo.setOrgIdentificationStr(OrgUtil.toConvertOrgIdentification(orgInfo.getOrgIdentification()));

            //处理机构共享指数为数组
            Long shareIndexValue = (long) orgInfo.getOrgShareIndex().floatValue();
            String shareIndex = shareIndexValue.toString();
            int i = 0;
            List<Character> list = new ArrayList<Character>();
            while (i < shareIndex.length()) {
                list.add(shareIndex.charAt(i));
                i++;
            }
            orgInfo.setOrgShareIndexList(list);
            orgInfo.setOrgShareIndexStr(UserUtil.toConvertShareIndex(orgInfo.getOrgShareIndex()));
            //处理机构共享排名为数组
            Integer rankValue = orgInfo.getOrgRank();
            String rank = rankValue.toString();
            int j = 0;
            List<Character> rankList = new ArrayList<Character>();
            while (j < rank.length()) {
                rankList.add(rank.charAt(j));
                j++;
            }
            orgInfo.setOrgRankList(rankList);
        }

        return orgInfo;
    }

    /**
     * 分页查询机构列表
     *
     * @param keyword
     * @param orgCategoryId
     * @param pageNo
     * @param pageSize
     * @return
     */
    public PageInfo<OrgInfo> searchOrgList(String keyword, Integer wordType, Integer orgCategoryId, Integer pageNo, Integer pageSize, String order) {
        PageHelper.startPage(pageNo, pageSize);
        List<OrgInfo> orgInfoList = null;
        if (!StringUtils.isBlank(keyword) && wordType != null && wordType == 1) {
            orgInfoList = orgDao.searchOrgBaseInfoListByOrgName(keyword, orgCategoryId, order);
        } else if (!StringUtils.isBlank(keyword) && wordType != null && wordType == 2) {
            orgInfoList = orgDao.searchOrgBaseInfoListByOrgNameByContacts(keyword, orgCategoryId, order);
        } else if (!StringUtils.isBlank(keyword) && wordType != null && wordType == 3) {
            orgInfoList = orgDao.searchOrgBaseInfoListByOrgNameByContacts(keyword, orgCategoryId, order);
        } else {
            orgInfoList = orgDao.searchOrgBaseInfoList(orgCategoryId, order);
        }
        Integer insCount = null; //仪器数量
        for (OrgInfo orgInfo : orgInfoList) {
            if (orgInfo != null) {
                orgInfo.setInsCount(orgInfo.getOrgInsCount().intValue());
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                orgInfo.setCreateTimeStr(format.format(orgInfo.getCreateTime()));
                //处理机构性质
                orgInfo.setOrgCategory(OrgUtil.toOrgCategory(orgInfo.getOrgCategoryId()));
                orgInfo.setOrgShareIndexStr(UserUtil.toConvertShareIndex(orgInfo.getOrgShareIndex()));
            }
        }
        return new PageInfo<OrgInfo>(orgInfoList);
    }

    /**
     * 添加机构
     *
     * @param org
     */
    public OrgInfo addOrg(OrgInfo org) {
        //判断参数是否合法
        if (StringUtils.isBlank(org.getOrgName())) {
            throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
        }
        //判断机构名是否重复
        List<OrgBaseInfo> count = orgDao.searchOrgCountByOrgName(org.getOrgName().trim());
        if (count.size() > 0) {
            throw new BusinessException(ResponseEntity.ORG_NAME_REPEATABLE_ERROR);
        }
        //判断机构是否进行机构认证
        if (org.getOrgLicense() != null) {
            org.setOrgType(1);
            org.setApplicationTime(new Date());
            org.setOrgIdentification(1);
        }
        //添加机构
        orgDao.insertOrgInfo(org);
        //校验机构地址，添加机构地址
        if (org.getOrgAddress() != null) {
            String orgAddrProvince = org.getOrgAddress().getOrgAddrProvince();
            String orgAddrCity = org.getOrgAddress().getOrgAddrCity();
            if (StringUtils.isBlank(orgAddrProvince) || StringUtils.isBlank(orgAddrCity)) {
                throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
            }
            org.getOrgAddress().setOrgId(org.getOrgOid());
            orgAddressDao.insertOrgAddress(org.getOrgAddress());
        }
        //添加机构座机
        if (org.getOrgContacts() != null && org.getOrgContacts().getConPhone() != null) {
            orgContactsDao.insertOrgContacts(org.getOrgContacts());
            Long conId = org.getOrgContacts().getConId();
            orgContactsMapDao.insertOrgContactsMap(new OrgContactsMap(conId, org.getOrgOid()));
        }
        //添加机构联系人电话
        if (org.getOrgContactsList() != null) {
            for (OrgContacts orgContacts : org.getOrgContactsList()) {
                orgContacts.setConState(2);
                orgContactsDao.insertOrgContacts(orgContacts);
                Long conId = orgContacts.getConId();
                orgContactsMapDao.insertOrgContactsMap(new OrgContactsMap(conId, org.getOrgOid()));
            }
        }

        //添加组织机构代码
        if (!StringUtils.isBlank(org.getOrgCode())) {
            String codePic = org.getOrgCodeObject() != null && org.getOrgCodeObject().getOrgCodePic() != null ? org.getOrgCodeObject().getOrgCodePic() : null;
            orgCodeDao.insertOrgCode(new OrgCode(org.getOrgOid(), org.getOrgCode(), codePic));
        }
        //添加机构营业执照
        if (org.getOrgLicense() != null) {
            OrgLicense orgLicense = org.getOrgLicense();
            orgLicense.setOrgOid(org.getOrgOid());
            //兼容机构模块添加机构上传营业执照照片
            if (!StringUtils.isBlank(org.getOrgLicensePic())) {
                orgLicense.setOrgLicensePic(org.getOrgLicensePic());
            }
            orgLicenseDao.insertOrgLicense(orgLicense);
        }
        //添加机构资质
        if (org.getOrgCertificateList() != null && org.getOrgCertificateList().size() > 0) {
            for (OrgCertificate orgCertificate : org.getOrgCertificateList()) {
                orgCertificateDao.insertOrgCertificate(new OrgCertificate(org.getOrgOid(), orgCertificate.getOrgCertificatePic(), orgCertificate.getOrgCertificateName()));
            }
        }
        //添加机构创建者,默认为机构拥有者
        if (org.getuUid() != null && org.getuUid() > 0) {
            orgManagerDao.insertOrgManager(new OrgManager(org.getOrgOid(), org.getuUid(),org.getManagerType()));
        }
        return org;
    }

    @Override
    public OrgCertificate addOrgCertificate(OrgCertificate orgCertificate) {
        Long orgCertificateId = orgCertificateDao.insertOrgCertificate(orgCertificate);
        OrgCertificate oc = orgCertificateDao.searchOrgCertificateByOrgCertificateId(orgCertificateId);
        return oc;
    }

    /**
     * 修改机构
     *
     * @param org
     */
    public void modifyOrg(OrgInfo org) {
        //判断参数是否合法
        if (org == null || StringUtils.isBlank(org.getOrgName()) || org.getOrgOid() == null) {
            throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
        }
        //如果机构名相同且机构orgOid不同相同 ，那么机构名重复
        List<OrgBaseInfo> baseInfos = orgDao.searchOrgCountByOrgName(org.getOrgName().trim());
        if (baseInfos.size() > 0 && (baseInfos.get(0).getOrgOid() != (long) org.getOrgOid())) {
            throw new BusinessException(ResponseEntity.ORG_NAME_REPEATABLE_ERROR);
        }
        //判断机构是否需要重新认证
        OrgInfo orgInfo = searchOrgInfoByOid(org.getOrgOid());
        if (orgInfo == null) {
            throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
        }
        //非认证机构修改
        if(orgInfo.getOrgIdentification() == 3){
            org.setOrgType(1);
            org.setOrgIdentification(1);
        }
        //认证服务商修改核心参数
        if (!OrgUtil.compareOrgInfo(orgInfo, org)) {
            org.setOrgType(1);
            org.setOrgIdentification(1);
        }
        //添加机构
        orgDao.updateOrgInfo(org);
        //校验机构地址，添加机构地址
        if (org.getOrgAddress() != null) {
            String orgAddrProvince = org.getOrgAddress().getOrgAddrProvince();
            String orgAddrCity = org.getOrgAddress().getOrgAddrCity();
            if (StringUtils.isBlank(orgAddrProvince) || StringUtils.isBlank(orgAddrCity)) {
                throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
            }
            org.getOrgAddress().setOrgId(org.getOrgOid());
            orgAddressDao.updateOrgAddress(org.getOrgAddress());
        }
        //修改机构座机
        if (org.getOrgContacts() != null ) {
            if(org.getOrgContacts().getConId() != null){
                orgContactsDao.updateOrgContacts(org.getOrgContacts());
            }else{
                orgContactsDao.insertOrgContacts(org.getOrgContacts());
            }
        }

        //修改机构联系人电话,先删除以前的，在添加新的联系人
        if (org.getOrgContactsList() != null) {
            List<OrgContacts> orgContactsList = orgContactsDao.searchContactsByOrgId(org.getOrgOid(), 2);
            for (OrgContacts orgContacts1 : orgContactsList){
                orgContactsDao.delOrgContactsByConId(orgContacts1.getConId());
            }
            for (OrgContacts orgContacts : org.getOrgContactsList()) {
                orgContacts.setConState(2);
                orgContactsDao.insertOrgContacts(orgContacts);
                Long conId = orgContacts.getConId();
                orgContactsMapDao.insertOrgContactsMap(new OrgContactsMap(conId, org.getOrgOid()));
            }
        }
        //添加组织机构代码
        if (org.getOrgCode() != null) {
            String codePic = org.getOrgCodeObject() != null && org.getOrgCodeObject().getOrgCodePic() != null ? org.getOrgCodeObject().getOrgCodePic() : "";
            OrgCode orgCode = orgCodeDao.searchOrgCodeByOrgId(org.getOrgOid());
            if (orgCode == null) {
                orgCodeDao.insertOrgCode(new OrgCode(org.getOrgOid(), org.getOrgCode(), codePic));
            } else if (orgCode != null &&(!org.getOrgCode().equals(orgCode.getOrgCode()) || !codePic.equals(orgCode.getOrgCodePic())) ) {
                orgCodeDao.updateOrgCode(new OrgCode(org.getOrgOid(), org.getOrgCode(), codePic));
            }
        }
        //添加机构营业执照
        OrgLicense orgLicense = orgLicenseDao.searchOrgLicenseByOrgId(org.getOrgOid());

        if (orgLicense == null && org.getOrgLicense() != null) {
            org.getOrgLicense().setOrgOid(org.getOrgOid());
            org.getOrgLicense().setTaxEnrolCertificatePic(org.getOrgLicense().getTaxEnrolCertificatePic() == null ? "" :org.getOrgLicense().getTaxEnrolCertificatePic()  );
            orgLicenseDao.insertOrgLicense(org.getOrgLicense());
        } else if (orgLicense != null && org.getOrgLicense() != null) {
            OrgLicense orgLicense1 = org.getOrgLicense();
            orgLicense1.setOrgOid(org.getOrgOid());
            org.getOrgLicense().setTaxEnrolCertificatePic(org.getOrgLicense().getTaxEnrolCertificatePic() == null ? "" :org.getOrgLicense().getTaxEnrolCertificatePic()  );
            //兼容机构模块添加机构上传营业执照照片
            if (!StringUtils.isBlank(org.getOrgLicensePic())) {
                orgLicense.setOrgLicensePic(org.getOrgLicensePic());
            }
            orgLicenseDao.updateOrgLicense(orgLicense1);
        }
        //添加机构资质
        if (org.getOrgCertificateList() != null && org.getOrgCertificateList().size() > 0) {
            //查询机构资质信息
            List<OrgCertificate> orgCertificateList = orgCertificateDao.searchOrgCertificateByOrgId(org.getOrgOid());
            Set<Long> set = new HashSet<>();
            Set<Long> newSet = new HashSet<>();
            for (OrgCertificate orgCertificate : orgCertificateList) {
                set.add(orgCertificate.getOrgCertificateId());
            }
            for (OrgCertificate orgCertificate : org.getOrgCertificateList()) {
                newSet.add(orgCertificate.getOrgCertificateId());
                if (orgCertificate.getOrgCertificateId() != null) {
                    Long orgCertificateId = orgCertificate.getOrgCertificateId();
                    String orgCertificateName = orgCertificate.getOrgCertificateName();
                    String orgCertificatePic = orgCertificate.getOrgCertificatePic();
                    orgCertificateDao.updateOrgCertificate(new OrgCertificate(orgCertificatePic, orgCertificateName, orgCertificateId));
                } else {
                    orgCertificateDao.insertOrgCertificate(new OrgCertificate(org.getOrgOid(), orgCertificate.getOrgCertificatePic(), orgCertificate.getOrgCertificateName()));
                }
            }
            for (Long cerId : set) {
                if (!newSet.contains(cerId)) {
//                    新的集合不含有原来的元素，根据id删除该条记录
                    orgCertificateDao.delOrgCertificateByCerId(cerId);
                }
            }
        }
        //添加机构创建者,默认为机构拥有者
        if (org.getOrgMid() == null && org.getuUid() != null) {
            orgManagerDao.insertOrgManager(new OrgManager(org.getOrgOid(), org.getuUid()));
        } else if (org.getOrgMid() != null && org.getuUid() != null) {
            orgManagerDao.updateOrgManager(new OrgManager(org.getOrgMid(), org.getOrgOid(), org.getuUid()));
        }
    }

    /**
     * 关闭机构
     *
     * @param oid
     * @return
     */
    public int closeOrg(long oid, int os) {
        try {
            List<HashMap<String, Long>> instrumentBaseInfos = orgDao.selectInsByOid(oid);
            if (instrumentBaseInfos != null && instrumentBaseInfos.size() > 0) {
                List mapIds = new ArrayList();
                //0正常状态，1表示删除状态
                if (os == 0) {
                    for (Map<String, Long> instrumentBaseInfo : instrumentBaseInfos) {
//                    insSearchDao.insertIndex(instrumentBaseInfo.get("map_id"));
                        mapIds.add(instrumentBaseInfo.get("map_id"));
                    }
                    insSearchDao.insertIndexs(mapIds);
                } else {
                    for (Map<String, Long> instrumentBaseInfo : instrumentBaseInfos) {
//                    insSearchDao.deleteByMapId(instrumentBaseInfo.get("map_id"));
                        mapIds.add(instrumentBaseInfo.get("map_id"));
                    }
                    insSearchDao.deleteByMapIds(mapIds);
                }
            }
        } catch (Exception e) {
            logger.info("关闭机构，更新仪器信息失败！");
        }
        return orgDao.closeOrg(oid, os);
    }

    @Override
    public List<Location> searchCityName(int id) {
        //获取直辖市下面的城市
        if (id == 110000 || id == 120000 || id == 310000 || id == 500000) {
            return orgDao.searchMunicipalityName(id);
        } else {
            List<Location> result = new ArrayList<Location>();
            List<Location> locationList = orgDao.searchCityName(id);
            for (Location location : locationList) {
                Integer cityId = location.getId();
                //特殊省份地级市需要添加进来
                if (cityId != 419000 && cityId != 429000 && cityId != 469000 && cityId != 659000) {
                    result.add(new Location(location.getName(), location.getId(), location.getParentId()));
                } else {
                    List<Location> subLocationList = orgDao.searchCityName(cityId);
                    for (Location subLocation : subLocationList) {
                        result.add(new Location(subLocation.getName(), location.getId(), location.getParentId()));
                    }
                }
            }
            return result;
        }
    }

    @Override
    public void addOrgCertificateTmp(String name) {
        if (name != null) {
            orgCertificateDao.insertOrgCertificateTmp(name);
        }
    }

    @Override
    public List<OrgCertificateTmp> selectOrgCertificateTmp() {
        return orgCertificateDao.selectOrgCertificateTmp();
    }

    /**
     * 根据机构ID查询仪器列表
     *
     * @param oid
     * @return
     */
    @Override
    public PageInfo<InsListInfo> searchInsByOid(Long oid, Integer pageNo, Integer pageSize) {
        if (oid == null || pageNo == null || pageSize == null) {
            return null;
        }
        PageHelper.startPage(pageNo, pageSize);
        List<InsListInfo> insListInfos = insSearchDao.selectInsByOid(oid);
        for (InsListInfo insListInfo : insListInfos) {
            insListInfo.setInsCategory(JSON.parseArray(insListInfo.getInsCategory().toString()));
            //insListInfo.setPrice(JSON.toJavaObject(JSON.parseObject(insListInfo.getInsOrgPriceList()), Price.class));
            insListInfo.setPrice(InsUtil.handlePrice(insListInfo.getInsOrgPriceList().toString()));
            if ("无".equals(insListInfo.getPrice().getUnit())) {
                insListInfo.getPrice().setUnit("天");
            }
            ;
            //处理仪器分类
            if (insListInfo.getInsFeatureName() != null) {
                insListInfo.setInsFeatureName(JSON.parseArray(insListInfo.getInsFeatureName().toString(), String.class));
            }
            //处理仪器图片
            String startUrl = Constant.TESTPICURL;
            if (StringUtils.isBlank(insListInfo.getInsPic())) {
                insListInfo.setInsPic(Constant.DEFAULT_INS_PIC);
            } else if (insListInfo.getInsPic().startsWith("http")) {
                if (insListInfo.getInsPic().contains("spider")) {
                    insListInfo.setInsPic(insListInfo.getInsPic() + Constant.Z_INS_PIC_END_URL);
                } else {
                    insListInfo.setInsPic(insListInfo.getInsPic() + Constant.INS_PIC_END_URL);
                }
            } else {
                if (insListInfo.getInsPic().contains("spider")) {
                    insListInfo.setInsPic(startUrl + "/image/" + insListInfo.getInsPic() + Constant.Z_INS_PIC_END_URL);
                } else {
                    insListInfo.setInsPic(startUrl + "/image/" + insListInfo.getInsPic() + Constant.INS_PIC_END_URL);
                }
            }
        }
        return new PageInfo<InsListInfo>(insListInfos);
    }

    @Override
    public PageInfo<FrontProviderInfo> selectProviderInfoByUid(Long uid, Integer pageNo, Integer pageSize) {
        if (uid == null || pageNo == null || pageSize == null) return null;
        PageHelper.startPage(pageNo, pageSize);
        List<FrontProviderInfo> frontProviderInfos = orgDao.selectFrontProviderInfoByUid(uid);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (FrontProviderInfo frontProviderInfo : frontProviderInfos) {
            frontProviderInfo.setOrgIdentificationStr(OrgUtil.toConvertOrgIdentification(frontProviderInfo.getOrgIdentification()));
            Date applicationTime = frontProviderInfo.getApplicationTime();
            frontProviderInfo.setApplicationTimeStr(applicationTime == null ? "" : format.format(applicationTime));
        }
        return new PageInfo<FrontProviderInfo>(frontProviderInfos);
    }

    /**
     * 查询机构创建者信息
     * @param orgOid
     * @return
     */
    @Override
    public OrgManager searchOrgManagerInfo(Long orgOid) {
        return orgManagerDao.searchOrgCreatorByOrgId(orgOid);
    }
}
