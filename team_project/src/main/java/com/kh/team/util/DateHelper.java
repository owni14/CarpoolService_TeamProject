package com.kh.team.util;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.kh.team.vo.Is_Update_PointVo;

public class DateHelper {
	//포인트 지급날인가 드라이버용
	public static boolean isPointMonthDay() {
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH,cal.getActualMinimum(Calendar.DAY_OF_MONTH));
		java.util.Date oneDate=cal.getTime();
		//첫째날 셋팅
		Date now=new Date(System.currentTimeMillis());
		SimpleDateFormat sdf=new SimpleDateFormat("dd");
		String nowDayStr=sdf.format(now);
		//현재날 셋팅
		System.out.println("now day "+nowDayStr);
		if(nowDayStr !=null && nowDayStr.equals("01") ) {
		System.out.println("DateHelper if문실행됨");
			return true;
		}
		return false;
	}
	//포맷 문자열 
	public static String getforamttedStr() {
		String formattedToday=null;
		
		Date now=new Date(System.currentTimeMillis());
		Calendar cal=Calendar.getInstance();
		cal.clear();
		cal.setTime(now);
		cal.set(Calendar.DAY_OF_MONTH,cal.getMinimum(Calendar.DAY_OF_YEAR));
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		java.util.Date date=cal.getTime();
		formattedToday=sdf.format(date);
		System.out.println("DateHelper formattedToday "+formattedToday);
		return formattedToday;
	}
	//포인트 업데이트 유무 브이오 만들기
	public static Is_Update_PointVo getIsUPdatePointVo(String iup_what) {
		Date now=new Date(System.currentTimeMillis());
		Calendar cal=Calendar.getInstance();
		cal.clear();
		cal.setTime(now);
		cal.set(Calendar.DAY_OF_MONTH,cal.getMinimum(Calendar.DAY_OF_YEAR));
		long time=cal.getTimeInMillis();
		java.sql.Date iup_date=new java.sql.Date(time);
		System.out.println("DateHelper iup_date "+iup_date);
		Is_Update_PointVo is_Update_PointVo=new Is_Update_PointVo(0, iup_date, iup_what);
		return is_Update_PointVo;
	}
	//캘린더 월 값 변경해서 데이트 객체 얻기
	public static Date getSixMonthDate(int monthValue) {
		Date now=new Date(System.currentTimeMillis());
		Calendar cal=Calendar.getInstance();
		cal.clear();
		cal.setTime(now);
		cal.set(Calendar.DAY_OF_MONTH,cal.getMinimum(Calendar.DAY_OF_YEAR));
		cal.set(Calendar.MONTH,monthValue);
		long time=cal.getTimeInMillis();
		java.sql.Date iup_date=new java.sql.Date(time);
		return iup_date;
		
	}
	//캘린더 월 값에 따른 포인트 업데이트 유무 브이오 만들기
	public static List<Is_Update_PointVo> getIsUPdatePointVoList(String iup_what) {
		List<Is_Update_PointVo> isUpdatePointList=new ArrayList<Is_Update_PointVo>();
		for(int i=0; i<=1; i++ ) {
			Date iup_date=getSixMonthDate(i*6);
			Is_Update_PointVo is_Update_PointVo=new Is_Update_PointVo(0, iup_date, iup_what);
			isUpdatePointList.add(is_Update_PointVo);
		}		
		return isUpdatePointList;
	}
	//캘린더 xxxx0701, xxxx0101 포맷 만들기
	public static List<String> getforamttedSixMonthStr(List<Is_Update_PointVo>  isUpdatePointList) {
		List<String> formattedTodays=new ArrayList<>();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		for(Is_Update_PointVo is_Update_PointVo:isUpdatePointList) {
			String formattedToday=sdf.format(is_Update_PointVo.getIup_date());
			formattedTodays.add(formattedToday);
		}
		System.out.println("DateHelper formattedTodays "+formattedTodays);
		return formattedTodays;
	}
	
	//포인트 지급날인가 승객(모든 유저)용
	public static boolean isPointSixMonthDay() {
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH,cal.getActualMinimum(Calendar.DAY_OF_MONTH));
		cal.set(Calendar.MONTH, 6);
		java.util.Date oneDate=cal.getTime();
		//첫째날 여섯달째셋팅
		Date now=new Date(System.currentTimeMillis());
		SimpleDateFormat sdf=new SimpleDateFormat("MMdd");
		String nowDayStr=sdf.format(oneDate);
		//현재날 셋팅
		System.out.println("now day "+nowDayStr);
		if(
				(nowDayStr !=null && nowDayStr.equals("0101")) 
				|| (nowDayStr !=null && nowDayStr.equals("0701"))
				) {
		System.out.println("DateHelper isPointSixMonthDay if문실행됨");
			return true;
		}
		return false;
	}
	public static Date castSqlDate(java.util.Date sourceDate) {
		Calendar cal=Calendar.getInstance();
		cal.clear();
		cal.setTime(sourceDate);
		long targetLongTime=cal.getTimeInMillis();
		Date targetDate=new Date(targetLongTime);
		return targetDate;
	}
}
