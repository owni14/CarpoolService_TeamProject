package team_project;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.EvlDao;
import com.kh.team.util.CodeEnum;
import com.kh.team.util.DateHelper;
import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.Is_Update_PointVo;
import com.kh.team.vo.Passenger_EvlVo;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class EvlTest {
	
	@Autowired
	EvlDao evlDao;
	
//	@Test
//	public void insertDriverEvlTest() {
//		Driver_EvlVo driver_EvlVo = new Driver_EvlVo(0, 300, "user02@gmail.com", "1002");
//		evlDao.insertDriverEvl(driver_EvlVo);
//	}//Ok
	
	@Test
	public void insertPassengerEvlTest() {
		for (int i = 1; i <= 40; i++ ) {
			evlDao.insertPassengerEvl("user0" + i + "@email.com");
		}
		
	}
	//ok
	
	@Test
	public void selectGcodeList() {
		System.out.println(evlDao.selectEvlCodeList());
	}//Ok
	
	@Test
	public void updateAllMemberPointByDriverEvl() {
		System.out.println(evlDao.updatePointByEvl());
	}//Ok
	
	
	// 멤버 포인트 지급  유무 업데이트 테스트s
	@Test
	public void selectIsUpdatePoint() {
		String iup_what="D";
		Date now=new Date(System.currentTimeMillis());
		Calendar cal=Calendar.getInstance();
		cal.clear();
		cal.setTime(now);
		cal.set(Calendar.DAY_OF_MONTH,cal.getMinimum(Calendar.DAY_OF_YEAR));
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		Date date=cal.getTime();
		String formattedToday=sdf.format(date);
		System.out.println("evlTest formattedToday "+formattedToday);
		System.out.println(evlDao.selectCountIsUpdate(formattedToday, iup_what));
	}//Ok
	
	//멤버쉽 포인트지급 유무 테이블에 추가
	@Test
	public void insertIsUpdatePoint() {
		String iup_what="D";
		Date now=new Date(System.currentTimeMillis());
		Calendar cal=Calendar.getInstance();
		cal.clear();
		cal.setTime(now);
		cal.set(Calendar.DAY_OF_MONTH,cal.getMinimum(Calendar.DAY_OF_YEAR));
		long time=cal.getTimeInMillis();
		java.sql.Date iup_date=new java.sql.Date(time);
		System.out.println("evlTest iup_date "+iup_date);
		Is_Update_PointVo is_Update_PointVo=new Is_Update_PointVo(0, iup_date, iup_what);
		System.out.println(evlDao.insertEvlUpdate(is_Update_PointVo));
	}//Ok
	
	@Test
	public void testgetSevenOneDay() {
		//1월 1일뽑아내기
		Date now=new Date(System.currentTimeMillis());
		Calendar cal=Calendar.getInstance();
		cal.clear();
		cal.setTime(now);
		cal.set(Calendar.MONTH,0);
		cal.set(Calendar.DAY_OF_MONTH,cal.getMinimum(Calendar.DAY_OF_YEAR));
		Date tarDate=cal.getTime();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		String strDate=sdf.format(tarDate);
		//1월 1일 뽑아내기
		System.out.println(strDate);
		
		
		//7월 1일뽑아내기
				cal=Calendar.getInstance();
				cal.clear();
				cal.setTime(now);
				cal.set(Calendar.MONTH,6);
				cal.set(Calendar.DAY_OF_MONTH,cal.getMinimum(Calendar.DAY_OF_YEAR));
				tarDate=cal.getTime();
				strDate=sdf.format(tarDate);
				//7월 1일 뽑아내기
				
				System.out.println(strDate);
	}//Ok
	
	@Test
	public void insertIsUpdatePointPassenger() {
		String iup_what="P";
		java.sql.Date iup_date=DateHelper.getSixMonthDate(6);
		System.out.println("evlTest iup_date "+iup_date);
		Is_Update_PointVo is_Update_PointVo=new Is_Update_PointVo(0, iup_date, iup_what);
		System.out.println(evlDao.insertEvlUpdate(is_Update_PointVo));
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		String formattedToday=sdf.format(iup_date);
		System.out.println("evlTest formattedToday "+formattedToday);
		System.out.println(evlDao.selectCountIsUpdate(formattedToday, iup_what));
	}//Ok
	
	@Test
	public void driverEvlUpdateTest() {
		String m_id = "hong@naver.com";
		int rating = 4;
		boolean result = evlDao.driverEvlUpdate(m_id, rating);
		System.out.println("result:" + result);
	} // Ok
	
	@Test
	public void getDriverEvlInfoTest() {
		String m_id = "hong@naver.com";
		Driver_EvlVo evlVo = evlDao.getDriverEvlInfo(m_id);
		System.out.println("driver_evlVo :" + evlVo);
	}
	
	@Test
	public void updateDriverGradeTest() {
		String m_id = "hong@naver.com";
		String g_code = CodeEnum.DRIVERWHITE.getCode();
		Driver_EvlVo evlVo = evlDao.getDriverEvlInfo(m_id);
		int totalDriveCount = evlVo.getDe_drive_count();
		double evlAvg = ((evlVo.getEvl1() * 1) + (evlVo.getEvl2() * 2) + (evlVo.getEvl3() * 3) + (evlVo.getEvl4() * 4) + (evlVo.getEvl5() * 5)) / (double)(evlVo.getEvl_count());
		System.out.println("totalDriverCount: " + totalDriveCount);
		System.out.println("evlAvg: " + evlAvg);
		if (totalDriveCount >= 65 && evlAvg >= 4.5) {
			g_code = CodeEnum.DRIVERVVIP.getCode();
		} else if (totalDriveCount >= 50 && evlAvg >= 4) {
			g_code = CodeEnum.DRIVERVIP.getCode();
		} else if (totalDriveCount >= 35 && evlAvg >= 3.5) {
			g_code = CodeEnum.DRIVERGOLD.getCode();
		} else if (totalDriveCount >= 8 && evlAvg >= 3) {
			g_code = CodeEnum.DRIVERSILVER.getCode();
		}
		evlDao.driverGradeUpdate(m_id, g_code);
	}
}