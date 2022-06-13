package team_project;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
	
}
