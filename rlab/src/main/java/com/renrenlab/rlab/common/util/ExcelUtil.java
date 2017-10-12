package com.renrenlab.rlab.common.util;

import org.apache.poi.POIXMLDocumentPart;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.PictureData;
import org.apache.poi.xssf.usermodel.*;
import org.openxmlformats.schemas.drawingml.x2006.spreadsheetDrawing.CTMarker;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ExcelUtil {

	/**
	 * 获取Excel2003图片
	 * @param sheetId 当前sheet编号
	 * @param sheet 当前sheet对象
	 * @param workbook 工作簿对象
	 * @return Map key:图片单元格索引（0_1_1）String，value:图片流PictureData
	 */
	public static Map<String, PictureData> getSheetPictrues03(int sheetId, HSSFSheet sheet, HSSFWorkbook workbook) {
		Map<String, PictureData> picMap = new HashMap<String, PictureData>();
		List<HSSFPictureData> pictures = workbook.getAllPictures();
		HSSFPatriarch drawingPatriarch = sheet.getDrawingPatriarch();
		if(drawingPatriarch==null){
			return picMap;
		}
		if (pictures.size() > 0) {
			for (HSSFShape shape : drawingPatriarch.getChildren()) {
				HSSFClientAnchor anchor = (HSSFClientAnchor) shape.getAnchor();
				if (shape instanceof HSSFPicture) {
					HSSFPicture pic = (HSSFPicture) shape;
					int pictureIndex = pic.getPictureIndex() - 1;
					HSSFPictureData picData = pictures.get(pictureIndex);
					String picIndex = sheetId + "_" + anchor.getRow1() + "_" + anchor.getCol1();
					picMap.put(picIndex, picData);
				}
			}
		}
		return picMap;
	}

	/**
	 * 获取Excel2007图片
	 * @param sheetId 当前sheet编号
	 * @param sheet 当前sheet对象
	 * @param workbook 工作簿对象
	 * @return Map key:图片单元格索引（0_1_1）String，value:图片流PictureData
	 */
	public static Map<String, PictureData> getSheetPictrues07(int sheetId, XSSFSheet sheet, XSSFWorkbook workbook) {
		Map<String, PictureData> picMap = new HashMap<String, PictureData>();
		for (POIXMLDocumentPart dr : sheet.getRelations()) {
			if (dr instanceof XSSFDrawing) {
				XSSFDrawing drawing = (XSSFDrawing) dr;
				List<XSSFShape> shapes = drawing.getShapes();
				for (XSSFShape shape : shapes) {
					XSSFPicture pic = (XSSFPicture) shape;
					XSSFClientAnchor anchor = pic.getPreferredSize();
					CTMarker ctMarker = anchor.getFrom();
					String picIndex = sheetId + "_" + ctMarker.getRow() + "_" + ctMarker.getCol();
					picMap.put(picIndex, pic.getPictureData());
				}
			}
		}
		return picMap;
	}

	/**
	 * 获取单元格数据内容为字符串类型的数据
	 * @param cell Excel单元格
	 * @return String 单元格数据内容
	 */
	public static String getStringCellValue(Cell cell){
		if (cell == null){
			return null;
		}
		String strCell = null;
		switch (cell.getCellType()){
			case Cell.CELL_TYPE_STRING:
				strCell = cell.getStringCellValue();
				break;
			case Cell.CELL_TYPE_NUMERIC:
				if(HSSFDateUtil.isCellDateFormatted(cell)){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date date = HSSFDateUtil.getJavaDate(cell.getNumericCellValue());
					strCell = sdf.format(date);
				}else{
					//将double类型的数字（包括科学计数法形式）转换成非科学计数法形式字符串
					strCell = String.format("%.0f", cell.getNumericCellValue());
				}
				break;
			case Cell.CELL_TYPE_BOOLEAN:
				strCell = String.valueOf(cell.getBooleanCellValue());
				break;
			case Cell.CELL_TYPE_BLANK:
				strCell = null;
				break;
			default:
				strCell = null;
				break;
		}
		if (strCell == null || strCell.trim().equals("")) {
			strCell = null;
		}
		return strCell;
	}


}
