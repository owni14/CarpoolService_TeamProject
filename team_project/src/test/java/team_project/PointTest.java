package team_project;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.MemberDao;
import com.kh.team.dao.PointDao;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PointCodeVo;
import com.kh.team.vo.PointHistoryVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class PointTest {
	
	@Autowired
	PointDao pointDao;
	
	@Test
	public void insertPointCode() {
		PointCodeVo pointCodeVo = new PointCodeVo("9999", "테스트용", 50);
		pointDao.insertPointCode(pointCodeVo);
	}
	
	
	@Test
	public void insertPointHistory() {
		for (int i=1; i <= 10; i++) {
			PointHistoryVo pointHistoryVo = new PointHistoryVo("hong@naver.com", "9999");
			pointDao.insertPointHistory(pointHistoryVo);
		}
	}
	
	@Test
	public void getPointHistoryById() {
		PointHistoryVo pointHistoryVo = pointDao.getPointHistoryById("hong@naver.com");
		System.out.println("PointTest, getPointHistoryById, pointHistoryVo: " + pointHistoryVo);
	}
	
}
