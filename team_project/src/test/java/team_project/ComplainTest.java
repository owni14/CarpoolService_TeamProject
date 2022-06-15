package team_project;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.AdminDao;
import com.kh.team.dao.ComplainDao;
import com.kh.team.vo.AdminVo;
import com.kh.team.vo.ComplainVo;
import com.kh.team.vo.PagingDto;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class ComplainTest {
	
	@Autowired
	ComplainDao complainDao;
	
	@Test
	public void testFinishByCode() {
		PagingDto pagingDto=new PagingDto();
		List<ComplainVo> list=complainDao.getAllFinishListByCode("1001",pagingDto);
		for(ComplainVo vo:list) {
			System.out.println(vo);
		}
	}
}

