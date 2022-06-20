package com.kh.team.util;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateHelper {
	public static boolean isPointMonthDay() {
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH,cal.getActualMinimum(Calendar.DAY_OF_MONTH));
		java.util.Date oneDate=cal.getTime();
		Date now=new Date(System.currentTimeMillis());
		SimpleDateFormat sdf=new SimpleDateFormat("dd");
		String nowDayStr=sdf.format(oneDate);
		System.out.println("now day "+nowDayStr);
		if(nowDayStr !=null && nowDayStr.equals("01") ) {
//			System.out.println("실행됨");
			return true;
		}
		return false;
	}

}
