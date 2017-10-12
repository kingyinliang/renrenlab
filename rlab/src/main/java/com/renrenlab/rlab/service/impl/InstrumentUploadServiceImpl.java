package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.aliyun.oss.OSSClient;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.util.ExcelUtil;
import com.renrenlab.rlab.dao.InstrumentUploadHistoryDao;
import com.renrenlab.rlab.dao.InstrumentUploadTmpDao;
import com.renrenlab.rlab.model.InstrumentUploadHistory;
import com.renrenlab.rlab.model.InstrumentUploadTmp;
import com.renrenlab.rlab.service.InstrumentUploadService;
import com.renrenlab.rlab.vo.InsturmentUploadHistoryInfo;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * Created by guowanting on 2017/7/20.
 */
@Service
public class InstrumentUploadServiceImpl implements InstrumentUploadService{

    @Autowired
    private InstrumentUploadTmpDao instrumentUploadTmpDao;

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
    @Transactional
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
                //从第二行开始取，不取空行
                for(int rowId = 1; rowId < rows; rowId ++){
                    //仪器名称（必填）	仪器一级分类	仪器二级分类	仪器三级分类	服务方式	仪器型号（必填）	仪器品牌（必填）	仪器产地（必填）	共享价格下限（元）	共享价格上限（元）	价格单位	价格补充说明	联系人1姓名（必填）	联系人1电话（必填）	联系人2姓名	联系人2电话	联系人3姓名	联系人3电话	仪器地址（省）（必填）	仪器地址（市）（必填）	仪器地址（区）（必填）	仪器地址（街道）（必填）	仪器生产厂家	仪器介绍	技术指标	其他说明	仪器特点	适用领域	仪器图片1	仪器图片2	仪器图片3	仪器图片4	仪器图片5
                    Row row = sheet.getRow(rowId);
                    if(null == row || row.getFirstCellNum() <= -1) {
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
                    descriptionMap.put("仪器介绍",introduction);
                    descriptionMap.put("技术指标",fingure);
                    descriptionMap.put("其他说明",other);
                    JSONArray descriptionArray = new JSONArray();
                    descriptionArray.add(descriptionMap);
                    if(StringUtils.isBlank(insName)||StringUtils.isBlank(insMode)||StringUtils.isBlank(insBrand)||StringUtils.isBlank(insOrigin)||StringUtils.isBlank(name1)||StringUtils.isBlank(phone1)||StringUtils.isBlank(province)||StringUtils.isBlank(city)||StringUtils.isBlank(district)||StringUtils.isBlank(street)){
                        //必填项不能为空
                        result.put("code",201);
                        result.put("desc","文件中必填项不能为空");
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
        } catch (IOException e) {
            logger.error("仪器上传出现异常"+e);
        } catch (InvalidFormatException e) {
            logger.error("仪器上传出现异常"+e);
        } catch (Exception e){
            logger.error("仪器上传出现异常"+e.getMessage());
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


}
