package team_project;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.AdminDao;
import com.kh.team.vo.AdminVo;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class AdminTest {
	
	@Autowired
	AdminDao admindao;
	
	@Test
	public void checkAdminId() {
		AdminVo adminVo = new AdminVo();
		adminVo.setAdmin_code("1001");
		boolean result = admindao.checkAdminId(adminVo);
		System.out.println("result : " + result);
	}
	// test ok
	
	
}

