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
	@Test
	public void regularExp() {
		String reg="(GM)([0-9a-zA-Z]*[\\{\\}\\[\\]?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\=\\(\\'\\\"]?)*";
		String code="gm1000000";
		if(code.matches(reg)) {
			System.out.println("정규식 통과");
		}
		else {
			System.out.println("정규식 미통과");
		}
	}//test ok
	
	
}

