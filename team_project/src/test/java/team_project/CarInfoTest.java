package team_project;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.SystemPropertyUtils;

import com.kh.team.dao.CarDao;
import com.kh.team.vo.CarInfoVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class CarInfoTest {

	@Autowired
	private CarDao carDao;
	
	@Test
	public void insertCarInfo() {
		CarInfoVo carInfoVo = new CarInfoVo("SPORTAGE", "KIA", "/resources/images/carLogo/kia.png", "/resources/images/carImage/sportage.png", 5);
		carDao.insertCarInfo(carInfoVo);
	}
	
	@Test
	public void increaseCount() {
		String m_id = "hong@naver.com";
		carDao.increaseCount(m_id);
	}
	
	@Test
	public void resetCount() {
		String m_id = "hong@naver.com";
		carDao.resetCount(m_id);
	}
	
	@Test
	public void getMaxCount() {
		String ci_code = "1001";
		String count = carDao.getMaxPeopleCountOfCar(ci_code);
		System.out.println("max car count : " + count);
	}
	
	@Test
	public void getCurrentCount() {
		String m_id = "hong@naver.com";
		String count = carDao.getCurrentCountOfCar(m_id);
		System.out.println("current count: " + count);
	}
	
	@Test
	public void getCarCode() {
		String m_id = "hong@naver.com";
		String ci_code = carDao.getCarCodeByM_Id(m_id);
		System.out.println("ci_code:" + ci_code);
	}
	
	@Test
	public void decreaseCount() {
		String m_id = "hong@naver.com";
		carDao.decreaseCount(m_id);
	}
	
	@Test
	public void getCarCodeByCi_Name() {
		String ci_name = "AVANTE";
		String ci_code = carDao.getCarCodeByCi_Name(ci_name);
		System.out.println("ci_code:" + ci_code);
	}
	
}
