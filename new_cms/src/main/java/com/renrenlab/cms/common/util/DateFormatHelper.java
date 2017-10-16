package com.renrenlab.cms.common.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 
 * @author fuyujie
 * Date 2017.04.27
 *
 */
public class DateFormatHelper {
	
	private DateFormatHelper() {
	}

	private static final String FORMT_STR = "yyyy:MM:dd HH:mm:ss";

	public static String Long2str(Long time) {
		Date date = new Date(time);
		DateFormat df = new SimpleDateFormat(FORMT_STR);
		return df.format(date);
	}
}
