package com.renrenlab.rlab.common.util;

import com.renrenlab.rlab.model.OrgCode;
import com.renrenlab.rlab.model.OrgLicense;
import com.renrenlab.rlab.vo.OrgInfo;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Administrator on 2017/7/25.
 */
public class OrgUtil {

    public static String toRightOrgPicUrl(String url, String img){
        String rightUrl = "";
        if(StringUtils.isBlank(url)){
            return rightUrl;
        }else{
            if(!url.contains("http")){
                return img + url;
            }else {
                return url;
            }
        }
    }

    public static String toConvertOrgSource(Integer source){
        if(source == null || source == 1)return "推广活动";
        if(source ==2){
            return "线上平台";
        }else {
            return "线下扩展";
        }
    }

    public static String toConvertOrgIdentification(Integer orgIdentification){
        if(orgIdentification == null || orgIdentification == 0)return "默认";
        if(orgIdentification ==1){
            return "待审核";
        }else if(orgIdentification == 2){
            return "审核通过";
        }else {
            return "审核拒绝";
        }
    }

    public static String toOrgCategory(Integer id){
        if(id == 1){
            return "科研院所";
        }else if(id == 2){
            return "高等院校";
        }else if(id == 3){
            return "国有企业";
        }else if(id == 4){
            return "民营企业";
        }else if(id == 5){
            return "第三方检测";
        }else if(id == 6){
            return "军队";
        }else{
            return "其他";
        }
    }

    public static List<String> toRightOrgPosition(String orgPosition){
        List<String> orgPositionList = new ArrayList<>();
        if(!StringUtils.isBlank(orgPosition)){
            orgPositionList = Arrays.asList(orgPosition.split(","));
        }
        return orgPositionList;
    }

    /**
     *比较两个机构核心字段是否有修改
     * @param oldOrgInfo
     * @param newOrgInfo
     * @return 如果结果为true,两个OrgInfo对象相同；否则不相同
     */
    public static boolean compareOrgInfo(OrgInfo oldOrgInfo, OrgInfo newOrgInfo){
        if((oldOrgInfo == null && newOrgInfo ==null))return true;
        if((oldOrgInfo == null && newOrgInfo != null) || (oldOrgInfo != null && newOrgInfo == null))return false;
        if(!compareString(oldOrgInfo.getOrgName(), newOrgInfo.getOrgName()))return false;
        if(!compareString(oldOrgInfo.getOrgCode(), newOrgInfo.getOrgCode()))return false;
        if(!compareString(oldOrgInfo.getOrgCodeObject().getOrgCodePic(), newOrgInfo.getOrgCodeObject().getOrgCodePic()))return false;
        if(!compareOrgLicense(oldOrgInfo.getOrgLicense(), newOrgInfo.getOrgLicense()))return false;
        if(!compareInteger(oldOrgInfo.getOrgSource(), newOrgInfo.getOrgSource()))return false;
        return true;
    }

    /**
     *如果OrgLicense对象相同，返回ture,否则返回false
     * @param oldOrgLicense
     * @param newOrgLicense
     * @return
     */
    public static boolean compareOrgLicense(OrgLicense oldOrgLicense, OrgLicense newOrgLicense){
        if((oldOrgLicense == null && newOrgLicense ==null))return true;
        if((oldOrgLicense == null && newOrgLicense != null) || (oldOrgLicense != null && newOrgLicense == null))return false;
        if(!compareString(oldOrgLicense.getOrgPerson(), newOrgLicense.getOrgPerson()))return false;
        if(!compareString(oldOrgLicense.getIdentificationNumber(), newOrgLicense.getIdentificationNumber()))return false;
        if(!compareString(oldOrgLicense.getLegalPersonPic1(), newOrgLicense.getLegalPersonPic1()))return false;
        if(!compareString(oldOrgLicense.getLegalPersonPic2(), newOrgLicense.getLegalPersonPic2()))return false;
        if(!compareString(oldOrgLicense.getOrgAddrProvince(), newOrgLicense.getOrgAddrProvince()))return false;
        if(!compareString(oldOrgLicense.getOrgAddrCity(), newOrgLicense.getOrgAddrCity()))return false;
        if(!compareString(oldOrgLicense.getOrgAddrDistrict(), newOrgLicense.getOrgAddrDistrict()))return false;
        if(!compareString(oldOrgLicense.getOrgAddress(), newOrgLicense.getOrgAddress()))return false;
        if(!compareString(oldOrgLicense.getOrgLicensePic(), newOrgLicense.getOrgLicensePic()))return false;
        if(!compareString(oldOrgLicense.getTaxEnrolCertificatePic(), newOrgLicense.getTaxEnrolCertificatePic()))return false;
        return true;
    }

    /**
     *如果OrgLicense对象相同，返回ture,否则返回false
     * @param oldOrgCode
     * @param oldOrgCode
     * @return
     */
    public static boolean compareOrgCode(OrgCode oldOrgCode, OrgCode newOrgCode){
        if((oldOrgCode == null && newOrgCode ==null))return true;
        if((oldOrgCode == null && newOrgCode != null) || (oldOrgCode != null && newOrgCode == null))return false;
        if(!compareString(oldOrgCode.getOrgCodePic(), newOrgCode.getOrgCodePic()))return false;
        if(!compareString(oldOrgCode.getOrgCode(), newOrgCode.getOrgCode()))return false;
        return true;
    }

    /**
     * 如果a==b，那么返回0，否则返回-1
     * @param a
     * @param b
     * @return
     */
    public static boolean compareInteger(Integer a, Integer b){
        return a == b ? true : (a == null ? false : (b == null ? false : (a.compareTo(b) == 0 ? true : false)));
    }

    /**
     * 如果a==b，那么返回0，否则返回-1
     * @param a
     * @param b
     * @return
     */
    public static boolean compareString(String a, String b){
        return a == b ? true : (a == null ? false : (b == null ? false : (a.compareTo(b) == 0 ? true : false)));
    }

}
