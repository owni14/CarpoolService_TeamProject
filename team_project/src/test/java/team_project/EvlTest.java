package team_project;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.AdminDao;
import com.kh.team.dao.EvlDao;
import com.kh.team.vo.AdminVo;
import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.Passenger_EvlVo;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class EvlTest {
	
	@Autowired
	EvlDao evlDao;
	
	@Test
	public void insertDriverEvlTest() {
		Driver_EvlVo driver_EvlVo = new Driver_EvlVo(0, 300, "user02@gmail.com", "1002");
		evlDao.insertDriverEvl(driver_EvlVo);
	}//Ok
	
	@Test
	public void insertPassengerEvlTest() {
		Passenger_EvlVo passenger_EvlVo= new Passenger_EvlVo(0, 20, "user04@gmail.com", "1009");
		evlDao.insertPassengerEvl(passenger_EvlVo);
	}
	//ok
	
	@Test
	public void selectGcodeList() {
		System.out.println(evlDao.selectEvlCodeList());
	}//Ok
	
	@Test
	public void updateAllMemberPointByDriverEvl() {
		System.out.println(evlDao.updatePointByEvl());
	}
	
	
}

