package com.renrenlab.rlab.service.impl;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSONArray;
import com.aliyun.oss.OSSClient;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.util.ExcelUtil;
import com.renrenlab.rlab.dao.*;
import com.renrenlab.rlab.model.BaseInsInfo;
import com.renrenlab.rlab.model.InstrumentUploadHistory;
import com.renrenlab.rlab.model.InstrumentUploadTmp;
import com.renrenlab.rlab.model.ShareInsModel;
import com.renrenlab.rlab.service.InstrumentUploadService;
import com.renrenlab.rlab.vo.InsturmentUploadHistoryInfo;
import com.renrenlab.rlab.vo.OrgAddress;
import com.renrenlab.rlab.vo.OrgContacts;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.*;

/**
 * Created by guowanting on 2017/7/20.
 */
@Service
@Transactional(rollbackFor =  Exception.class)
public class InstrumentUploadServiceImpl implements InstrumentUploadService{

    @Autowired
    private InstrumentUploadTmpDao instrumentUploadTmpDao;

    @Autowired
    private BaseInsDao baseInsDao;
    
    @Autowired
    private OrgContactsDao orgContactsDao;
    
    @Autowired
    private OrgAddressDao orgAddressDao;

    @Autowired
    private ShareInsDao shareInsDao;

    @Autowired
    private InstrumentUploadHistoryDao instrumentUploadHistoryDao;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 批量上传仪器
     * @param uId 发布者id
     * @param orgId
     * @param file
     * @return
     */
    @Override
    public Map<String, Object> uploadInstruments(Long uId, Long orgId, MultipartFile file) {
        Map<String, Object> result = new HashMap<>();
        result.put("code",200);
        result.put("desc","上传成功");
        if(uId==null){
            result.put("code",201);
            result.put("desc","未登录");
            return result;
        }
        try {
            InputStream input = file.getInputStream();
            String fileName = file.getOriginalFilename();
            String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1);

            ////根据后缀判断excel 2003 or 2007+
            Workbook workBook = null;
            if (fileExt.equals("xls")) {
                workBook = (HSSFWorkbook) WorkbookFactory.create(input);
            }else if (fileExt.equals("xlsx")){
                workBook = new XSSFWorkbook(input);
            }else {
                logger.error("导入的文件格式不正确，后缀为"+fileExt+"应该不是excel文件");
                result.put("code",201);
                result.put("desc","导入的文件格式不正确，请上传xls或xlsx结尾的文件");
                return result;
            }
            InstrumentUploadTmp ins = new InstrumentUploadTmp();
            ins.setOrgOid(orgId);
            ins.setuUid(uId);

            int sheetNum = workBook.getNumberOfSheets();
            logger.debug(""+sheetNum);
            Map<String, PictureData> picMap = new HashMap<String, PictureData>();
            for (int i = 0; i < sheetNum; i++) {
                logger.debug("i="+i);
                Sheet sheet = workBook.getSheetAt(i);
                if (fileExt.equals("xls")) {
                    picMap.putAll(ExcelUtil.getSheetPictrues03(i, (HSSFSheet) sheet, (HSSFWorkbook) workBook));
                } else {
                    picMap.putAll(ExcelUtil.getSheetPictrues07(i, (XSSFSheet) sheet, (XSSFWorkbook) workBook));
                }
                int rows = sheet.getPhysicalNumberOfRows();
                int x = sheet.getLastRowNum();
                //从第二行开始取，不取空行
                for(int rowId = 1; rowId < rows; rowId ++){
                    //仪器名称（必填）	仪器一级分类	仪器二级分类	仪器三级分类	服务方式	仪器型号（必填）	仪器品牌（必填）	仪器产地（必填）	共享价格下限（元）	共享价格上限（元）	价格单位	价格补充说明	联系人1姓名（必填）	联系人1电话（必填）	联系人2姓名	联系人2电话	联系人3姓名	联系人3电话	仪器地址（省）（必填）	仪器地址（市）（必填）	仪器地址（区）（必填）	仪器地址（街道）（必填）	仪器生产厂家	仪器介绍	技术指标	其他说明	仪器特点	适用领域	仪器图片1	仪器图片2	仪器图片3	仪器图片4	仪器图片5
                    Row row = sheet.getRow(rowId);
                    short firstCellNum = row.getFirstCellNum();
                    if(null == row || row.getFirstCellNum() <= -1||isBlankRow(row,23)) {
                        continue;
                    }
                    int coId =0;
                    //仪器名称（必填）
                    String insName = ExcelUtil.getStringCellValue(row.getCell(coId++));

                    //分类
                    String category1 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String category2 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String category3 = ExcelUtil.getStringCellValue(row.getCell(coId++));

                    JSONArray categoryArray = new JSONArray();

                    categoryArray.add(category1);
                    categoryArray.add(category2);
                    categoryArray.add(category3);

                    //服务方式
                    String method = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    //仪器型号（必填）
                    String insMode = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    //仪器品牌（必填）
                    String insBrand = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    //仪器产地（必填）
                    String insOrigin = ExcelUtil.getStringCellValue(row.getCell(coId++));

                    //共享价格下限（元）	共享价格上限（元）	价格单位	价格补充说明
                    String scopeLowPrice = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String scopeHighPrice = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String unit = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String remark = ExcelUtil.getStringCellValue(row.getCell(coId++));

                    Map<String,Object> priceMap = new HashMap();
                    JSONArray priceArray = new JSONArray();
                    if(scopeLowPrice==null&&scopeHighPrice==null){
                        priceMap.put("flag",3);
                    }else{
                        if(scopeLowPrice!=null&&scopeHighPrice!=null&&scopeLowPrice.equals(scopeHighPrice)){
                            priceMap.put("accPrice",scopeHighPrice);
                            priceMap.put("flag",1);
                        }else {
                            priceMap.put("scopeHighPrice",scopeHighPrice);
                            priceMap.put("scopeLowPrice",scopeLowPrice);
                            priceMap.put("flag",2);
                        }
                    }
                    priceMap.put("unit",unit);
                    priceMap.put("remark",remark);
                    priceArray.add(priceMap);
                    //联系人1姓名（必填）	联系人1电话（必填）	联系人2姓名	联系人2电话	联系人3姓名	联系人3电话
                    String name1 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String phone1 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String name2 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String phone2 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String name3 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String phone3 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    Map<String,Object> contactMap1 = new HashMap();
                    Map<String,Object> contactMap2 = new HashMap();
                    Map<String,Object> contactMap3 = new HashMap();
                    contactMap1.put("name",name1);
                    contactMap1.put("phone",phone1);
                    contactMap2.put("name",name2);
                    contactMap2.put("phone",phone2);
                    contactMap3.put("name",name3);
                    contactMap3.put("phone",phone3);
                    JSONArray contactArray = new JSONArray();
                    contactArray.add(contactMap1);
                    contactArray.add(contactMap2);
                    contactArray.add(contactMap3);
                    //仪器地址（省）（必填）	仪器地址（市）（必填）	仪器地址（区）（必填）	仪器地址（街道）（必填）
                    String province = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String city = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String district = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String street = ExcelUtil.getStringCellValue(row.getCell(coId++));

                    //仪器生产厂家	仪器介绍	技术指标	其他说明	仪器特点	适用领域
                    String insMaker = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String introduction = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String fingure = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    String other = ExcelUtil.getStringCellValue(row.getCell(coId++));

                    Map<String,Object> descriptionMap = new HashMap();
                    Map<String,Object> descriptionMap1 = new HashMap();
                    Map<String,Object> descriptionMap2 = new HashMap();
                    JSONArray descriptionArray = new JSONArray();
                    descriptionMap.put("title","仪器介绍");
                    descriptionMap.put("content",introduction);
                    descriptionArray.add(descriptionMap);
                    if(StringUtils.isNotBlank(other)){
                        descriptionMap1.put("title","其他说明");
                        descriptionMap1.put("content",other);
                        descriptionArray.add(descriptionMap1);
                    }
                    if(StringUtils.isNotBlank(fingure)){
                        descriptionMap1.put("title","技术指标");
                        descriptionMap1.put("content",fingure);
                        descriptionArray.add(descriptionMap2);
                    }
                    if(StringUtils.isBlank(insName)||StringUtils.isBlank(insMode)||StringUtils.isBlank(insBrand)||StringUtils.isBlank(insOrigin)||StringUtils.isBlank(name1)||StringUtils.isBlank(phone1)||StringUtils.isBlank(province)||StringUtils.isBlank(city)||StringUtils.isBlank(district)||StringUtils.isBlank(street)){
                        //必填项不能为空
                        result.put("code",201);
                        result.put("desc","文件中必填项不能为空");
                        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                        return result;
                    }
                    String feature = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    JSONArray featureArray = new JSONArray();
                    if(StringUtils.isNotBlank(feature)){
                        String[] features = feature.split(";");
                        for (String s : features) {
                            featureArray.add(s);
                        }
                    }
                    JSONArray scopeArray = new JSONArray();
                    String scope = ExcelUtil.getStringCellValue(row.getCell(coId++));
                    if(StringUtils.isNotBlank(scope)){
                        String[] scopes = scope.split(";");
                        for (String s : scopes) {
                            scopeArray.add(s);
                        }
                    }

                    //每个单元格只能上传一张图片，三个单元格可传可不传
                    Object insPic1 = parseImageCell(picMap,i,rowId,coId++);
                    Object insPic2 = parseImageCell(picMap,i,rowId,coId++);
                    Object insPic3 = parseImageCell(picMap,i,rowId,coId++);
                    Object insPic4 = parseImageCell(picMap,i,rowId,coId++);
                    Object insPic5 = parseImageCell(picMap,i,rowId,coId++);

                    StringBuffer sb = new StringBuffer();
                    sb.append("[");
                    if(insPic1!=null){
                        sb.append(insPic1);
                    }if(insPic2!=null){
                        sb.append(insPic2);
                    }if(insPic3!=null){
                        sb.append(insPic3);
                    }if(insPic4!=null){
                        sb.append(insPic4);
                    }if(insPic5!=null){
                        sb.append(insPic5);
                    }
                    sb.append("]");
                    String s = sb.toString();
                    Object insPic = s.replaceAll("\"\"", "\",\"");
                    if(insPic1==null && insPic2==null && insPic3==null&& insPic4==null&& insPic5==null){
                        insPic = null;
                    }

                    ins.setInsName(insName);
                    ins.setInsCategory(categoryArray.toString());
                    ins.setInsServiceMethod(method);
                    ins.setInsMode(insMode);
                    ins.setInsBrand(insBrand);
                    ins.setInsOrigin(insOrigin);
                    ins.setInsContacts(contactArray.toString());
                    ins.setInsOrgPriceList(priceArray.toString());
                    ins.setOrgAddrProvince(province);
                    ins.setOrgAddrCity(city);
                    ins.setOrgAddrDistrict(district);
                    ins.setOrgAddrStreet(street);
                    ins.setInsMaker(insMaker);
                    ins.setInsDescription(descriptionArray.toString());
                    ins.setInsFeature(featureArray.toString());
                    ins.setInsScope(scopeArray.toString());
                    ins.setInsPic(insPic);
                    instrumentUploadTmpDao.insertSelective(ins);
                }

            }
            logger.debug("上传历史");
            InstrumentUploadHistory insHist = new InstrumentUploadHistory();
            insHist.setOrgOid(orgId);
            insHist.setuUid(uId);
            instrumentUploadHistoryDao.insertSelective(insHist);
            return result;
        } catch (Exception e){
            logger.error("仪器上传出现异常"+e.getMessage());
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }
        result.put("code",201);
        result.put("desc","系统异常");
        return result;
    }

    /**
     * 批量上传仪器新
     * @param uId 发布者id
     * @param orgId
     * @param file
     * @return
     */
    @Override
    public Map<String, Object> uploadInstrumentsNew(Long uId, Long orgId, MultipartFile file) {
        Map<String, Object> result = new HashMap<>();
        result.put("code",200);
        result.put("desc","上传成功");
        if(uId==null){
            result.put("code",201);
            result.put("desc","未登录");
            return result;
        }
        try {
            InputStream input = file.getInputStream();
            String fileName = file.getOriginalFilename();
            String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1);

            //根据后缀判断excel 2003 or 2007+
            Workbook workBook = null;
            if (fileExt.equals("xls")) {
                workBook = (HSSFWorkbook) WorkbookFactory.create(input);
            }else if (fileExt.equals("xlsx")){
                workBook = new XSSFWorkbook(input);
            }else {
                logger.error("导入的文件格式不正确，后缀为"+fileExt+"应该不是excel文件");
                result.put("code",201);
                result.put("desc","导入的文件格式不正确，请上传xls或xlsx结尾的文件");
                return result;
            }

            int sheetNum = workBook.getNumberOfSheets();
            logger.debug(""+sheetNum);
            Map<String, PictureData> picMap = new HashMap<String, PictureData>();

            BaseInsInfo baseins= new BaseInsInfo();

            ShareInsModel shareins = new ShareInsModel();
            shareins.setOrgOid(orgId);
            shareins.setInsScope("[\"10148\"]");
            shareins.setMapState("[0, 0, 1]");
            int isNameRight=0;
            //遍历小页
            for (int i = 0; i < sheetNum; i++) {
                logger.debug("i="+i);
                Sheet sheet = workBook.getSheetAt(i);
                String sheetName = sheet.getSheetName();
                if(sheetName.contains("仪器") && sheetName.contains("录入")){
                    isNameRight++;
                    if (fileExt.equals("xls")) {
                        picMap.putAll(ExcelUtil.getSheetPictrues03(i, (HSSFSheet) sheet, (HSSFWorkbook) workBook));
                    } else {
                        picMap.putAll(ExcelUtil.getSheetPictrues07(i, (XSSFSheet) sheet, (XSSFWorkbook) workBook));
                    }
            /*
                1仪器名称*	2仪器型号*	3仪器品牌*	4仪器产地*	5仪器制造商	6一级分类	7编号	8二级分类	9编号	10三级分类	11编号	12仪器简介*	13设备特点	14应用领域
                15特点1	16特点1编号	17特点2	 18特点2编号	19特点3	20特点3编号	21服务方式	22服务方式编号	23价格（低）	24价格（高）	25价格单位	26价格补充说明
                27联系人1*	28联系人1电话*	29联系人2	30联系人2电话
                31地址省*	 32地址市*	33地址区*	34地址街道*
                35图片1	36图片2	37图片3	38图片4	39图片5
             */
                    //从第二行开始取，不取空行
                    int rows = sheet.getPhysicalNumberOfRows();
                    for(int rowId = 1; rowId < rows; rowId ++){
                        Row row = sheet.getRow(rowId);
                        //排除空行
                        if(null == row || row.getFirstCellNum() <= -1||isBlankRow(row,34)) {
                            continue;
                        }
                        int coId =0;
                        //1仪器名称（必填）
                        String insName = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        //2仪器型号（必填）
                        String insMode = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        //3仪器品牌（必填）
                        String insBrand = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        //4仪器产地（必填）
                        String insOrigin = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        //5仪器制造商
                        String insMaker = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        //分类 7 9 11
                        coId++;
                        String category1 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        coId++;
                        String category2 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        coId++;
                        String category3 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        JSONArray categoryArray = new JSONArray();
                        categoryArray.add(category1);
                        categoryArray.add(category2);
                        categoryArray.add(category3);
                        //12仪器简介*	13设备特点	14应用领域
                        String introduction = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        String fingure = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        String other = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        Map<String,Object> descriptionMap = new HashMap();
                        Map<String,Object> descriptionMap1 = new HashMap();
                        Map<String,Object> descriptionMap2 = new HashMap();
                        JSONArray descriptionArray = new JSONArray();
                        descriptionMap.put("title","仪器介绍");
                        descriptionMap.put("content",introduction);
                        descriptionArray.add(descriptionMap);
                        if(StringUtils.isNotBlank(fingure)){
                            descriptionMap1.put("title","设备特点");
                            descriptionMap1.put("content",fingure);
                            descriptionArray.add(descriptionMap1);
                        }
                        if(StringUtils.isNotBlank(other)){
                            descriptionMap2.put("title","应用领域");
                            descriptionMap2.put("content",other);
                            descriptionArray.add(descriptionMap2);
                        }
                        //15特点1	16特点1编号	17特点2	 18特点2编号	19特点3	20特点3编号
                        JSONArray featureArray = new JSONArray();
                        coId++;
                        String feature1 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        coId++;
                        String feature2 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        coId++;
                        String feature3 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        featureArray.add(feature1);
                        featureArray.add(feature2);
                        featureArray.add(feature3);
                        //21服务方式	22服务方式编号
                        coId++;
                        String method = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        //23价格（低）	24价格（高）	25价格单位	26价格补充说明
                        String scopeLowPrice = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        String scopeHighPrice = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        String unit = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        String remark = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        Map<String,Object> priceMap = new HashMap();
                        if(scopeLowPrice==null&&scopeHighPrice==null){
                            priceMap.put("flag",3);
                        }else{

                            try {
                                if(scopeLowPrice!=null&&scopeHighPrice!=null&&scopeLowPrice.equals(scopeHighPrice)){
                                    priceMap.put("accPrice",Integer.valueOf(scopeHighPrice)*100);
                                    priceMap.put("flag",1);
                                }else {
                                    priceMap.put("scopeHighPrice",Integer.valueOf(scopeHighPrice)*100);
                                    priceMap.put("scopeLowPrice",Integer.valueOf(scopeLowPrice)*100);
                                    priceMap.put("flag",2);
                                }
                            } catch (NumberFormatException e) {
                                result.put("code",201);
                                result.put("desc","价格处理不规范，请不要包含汉字");
                                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                                return result;
                            }
                        }
                        if(StringUtils.isNotBlank(unit)){
                            priceMap.put("unit",unit);
                        }
                        if(StringUtils.isNotBlank(remark)){
                            priceMap.put("remark",remark);
                        }
                        String price = JSONUtils.toJSONString(priceMap);
                        //27联系人1*	28联系人1电话*	29联系人2	30联系人2电话
                        String name1 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        String phone1 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        String name2 = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        String phone2 = ExcelUtil.getStringCellValue(row.getCell(coId++));

                        //31地址省*	 32地址市*	33地址区*	34地址街道*
                        String province = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        String city = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        String district = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        String street = ExcelUtil.getStringCellValue(row.getCell(coId++));
                        //35图片1	36图片2	37图片3	38图片4	39图片5
                        //每个单元格只能上传一张图片，三个单元格可传可不传
                        Object insPic1 = parseImageCell(picMap,i,rowId,coId++);
                        Object insPic2 = parseImageCell(picMap,i,rowId,coId++);
                        Object insPic3 = parseImageCell(picMap,i,rowId,coId++);
                        Object insPic4 = parseImageCell(picMap,i,rowId,coId++);
                        Object insPic5 = parseImageCell(picMap,i,rowId,coId++);
                        StringBuffer sb = new StringBuffer();
                        sb.append("[");
                        if(insPic1!=null){
                            sb.append(insPic1);
                        }if(insPic2!=null){
                            sb.append(insPic2);
                        }if(insPic3!=null){
                            sb.append(insPic3);
                        }if(insPic4!=null){
                            sb.append(insPic4);
                        }if(insPic5!=null){
                            sb.append(insPic5);
                        }
                        sb.append("]");
                        String s = sb.toString();
                        Object insPic = s.replaceAll("\"\"", "\",\"");
                        if(insPic1==null && insPic2==null && insPic3==null&& insPic4==null&& insPic5==null){
                            insPic = null;
                        }
                        if(StringUtils.isBlank(insName)||StringUtils.isBlank(insMode)||StringUtils.isBlank(insBrand)||StringUtils.isBlank(insOrigin)||StringUtils.isBlank(introduction)||StringUtils.isBlank(name1)||StringUtils.isBlank(phone1)||StringUtils.isBlank(province)||StringUtils.isBlank(city)||StringUtils.isBlank(district)||StringUtils.isBlank(street)||StringUtils.isBlank(method)){
                            //必填项不能为空
                            result.put("code",201);
                            result.put("desc","文件中必填项不能为空");
                            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                            return result;
                        }
                        //处理基本仪器表
                        baseins.setInsName(insName);
                        baseins.setInsMode(insMode);
                        baseins.setInsBrand(insBrand);
                        baseins.setInsOrigin(insOrigin);
                        baseins.setInsMaker(insMaker);
                        baseins.setInsCategory(categoryArray.toString());
                        baseins.setInsDescription(descriptionArray.toString());
                        baseins.setInsPic(insPic);
                        baseInsDao.insertSelective(baseins);

                        //处理地址
                        Long addrId = null;
                        List<OrgAddress> orgAddresses = orgAddressDao.searchOrgAddressListByOrgId(orgId);
                        for (OrgAddress orgAddress : orgAddresses) {
                            if(province.equals(orgAddress.getOrgAddrProvince())&&city.equals(orgAddress.getOrgAddrCity())&&district.equals(orgAddress.getOrgAddrDistrict())&&street.equals(orgAddress.getOrgAddrStreet())){
                                addrId = orgAddress.getOrgAddrId();
                            }
                        }
                        OrgAddress orgAddress = new OrgAddress();
                        if(addrId==null){
                            //插入地址表
                            orgAddress.setOrgId(orgId);
                            orgAddress.setOrgAddrProvince(province);
                            orgAddress.setOrgAddrCity(city);
                            orgAddress.setOrgAddrDistrict(district);
                            orgAddress.setOrgAddrStreet(street);
                            orgAddress.setOrgAddrState(1);
                            orgAddressDao.insertOrgAddress(orgAddress);
                            addrId=orgAddress.getOrgAddrId();
                        }
                        //处理联系人
                        JSONArray contactArray = new JSONArray();
                        contactArray.add(dealContacts(name1,phone1));
                        if(StringUtils.isNotBlank(name2)&&StringUtils.isNotBlank(phone2)){
                            contactArray.add(dealContacts(name2,phone2));
                        }
                        //处理共享仪器表
                        shareins.setOrgAddrId(addrId);
                        shareins.setServiceType(Integer.valueOf(method));
                        shareins.setInsFeature(featureArray.toString());
                        shareins.setInsOrgPriceList(price);
                        shareins.setInsIid(baseins.getInsIid());
                        shareins.setConId(contactArray.toString());
                        shareInsDao.insertSelective(shareins);
                    }
                }
            }
            if(isNameRight>0){
                logger.debug("上传历史");
                InstrumentUploadHistory insHist = new InstrumentUploadHistory();
                insHist.setOrgOid(orgId);
                insHist.setuUid(uId);
                instrumentUploadHistoryDao.insertSelective(insHist);
                return result;
            }
            result.put("code",201);
            result.put("desc","无仪器录入页，请修改小页名称");
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return result;
        } catch (Exception e){
            logger.error("仪器上传出现异常"+e.getMessage());
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }
        result.put("code",201);
        result.put("desc","系统异常");
        return result;
    }

    /**
     * 上传历史记录
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Override
    public PageInfo<InsturmentUploadHistoryInfo> searchHistory(Integer pageNo, Integer pageSize) {

        List<InsturmentUploadHistoryInfo> list = new ArrayList<>();
        PageHelper.startPage(pageNo, pageSize);
        list = instrumentUploadHistoryDao.listAll();
        return new PageInfo<>(list);
    }

    /**
     * 上传表格中图片
     * @param picMap
     * @param sheetId
     * @param rowId
     * @param colId
     * @return
     */
    private static String parseImageCell(Map<String, PictureData> picMap, int sheetId, int rowId, int colId){
        FileOutputStream out = null;
        try{
            String picIndex = sheetId + "_" + rowId + "_" + colId;
            if(picMap.containsKey(picIndex)){
                PictureData pic = picMap.get(picIndex);
                String saveName = DateFormatUtils.format(new Date(), "yyyy/MM/dd")+ File.separator + UUID.randomUUID().toString() + "." + pic.suggestFileExtension();
                saveName = saveName.replaceAll("\\\\", "/");

                File saveFile = new File("/home/elab/repository/image", saveName);
                //File saveFile = new File("D:/图片测试", saveName);
                if(saveFile.getParentFile() != null && !saveFile.getParentFile().exists()){
                    saveFile.getParentFile().mkdirs();
                }
                //保存图片
                out = new FileOutputStream(saveFile);
                out.write(pic.getData());
                OSSClient ossClient = new OSSClient("http://oss-cn-shanghai.aliyuncs.com", "LTAIDEc0xPsAmL8X", "kfWbAeTgMjvkf1OCJDKjHZFRiHCpOY");
                //ossClient.putObject("renrenlab-test", "image/" + saveName, new File("/home/elab/repository/" + "image/" + saveName));
                ossClient.putObject("renrenlab", "image/" + saveName, new File("/home/elab/repository/" + "image/" + saveName));
                ossClient.shutdown();
                //返回路径
                saveName = Constant.UPLOADIMG + saveName;
                return "\""+saveName+"\"";
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                if(out != null){
                    out.close();
                }
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 判断是否是空白行
     * @param row
     * @param i
     * @return
     */
    private boolean isBlankRow(Row row,int i){
        int x=0;
        for (int j = 0; j < i; j++) {
            Cell cell = row.getCell(j);
            if (cell == null || cell.getCellType() == Cell.CELL_TYPE_BLANK || StringUtils.isBlank(ExcelUtil.getStringCellValue(cell))){
                x++;
            }
        }
        if(x<i){
            return false;
        }
        return true;
    }
    /**
     * 处理联系人
     * @param name
     * @param phone
     * @return 联系人id
     */
    private String dealContacts(String name, String phone){
        List<OrgContacts> orgContacts = orgContactsDao.searchContactsByPhoneAndName(phone, name);
        Long conId=null;
        if(orgContacts.size()>0) {
            conId = orgContacts.get(0).getConId();
            return String.valueOf(conId);
        }
        OrgContacts orgContact = new OrgContacts();
        orgContact.setConName(name);
        orgContact.setConPhone(phone);
        orgContact.setConState(1);
        orgContactsDao.insertOrgContacts(orgContact);
     return String.valueOf(orgContact.getConId());
}

}
