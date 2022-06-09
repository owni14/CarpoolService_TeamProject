package team_project;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.MylogDao;
import com.kh.team.vo.DriverVo;
import com.kh.team.vo.PassengerVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class MylogTest {
	
	@Autowired
	MylogDao mylogDao;
	
	// 테스트용 드라이버 로그 생성
	@Test
	public void insertDriver () {
		for (int i = 1; i < 4; i++) {
			DriverVo driverVo = new DriverVo(10+i, "hong@naver.com", "울산 북구 아진로 75", "N", "담배 거절", "2022-06-0"+ i + " 07:30");
			mylogDao.insertDriver(driverVo);
		}
	}
	
	// 테스트용 탑승자 로그 생성
	@Test
	public void insertPassenger() {
		for (int i = 1; i < 4; i++) {
			PassengerVo passengerVo = new PassengerVo(i+30, "user0"+ i +"@gmail.com", "울산 북구 달천로 50", "7:4"+ i, 11);
			mylogDao.insertPassenger(passengerVo);
		}
	}
}
