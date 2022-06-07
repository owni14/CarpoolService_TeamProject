package team_project;



import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.MemberDao;
import com.kh.team.vo.MemberVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class MemberTest {
	
	@Autowired
	MemberDao memberDao;
	
	@Test
	public void insertMember() {
		MemberVo memberVo = new MemberVo("user03@gmail.com", "유저3", "1234", "M", "KAKAO", "인사관리부", "Y", "울산 북구 중산동", "01056789123");
		memberDao.insertMember(memberVo);
	}
	// test ok, value of phonenumber must be composed of number 
	
	@Test
	public void getMemberList() {
		List<MemberVo> memberList = memberDao.getMemberList();
		System.out.println("MemberTest, MemberList : " +  memberList);
	}
	// test ok
}
