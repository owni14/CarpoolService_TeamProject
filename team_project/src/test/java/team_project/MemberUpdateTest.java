package team_project;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.CarDao;
import com.kh.team.dao.MemberUpdateDao;
import com.kh.team.vo.CarInfoVo;
import com.kh.team.vo.MemberUpdateVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class MemberUpdateTest {

	@Autowired
	private MemberUpdateDao memberUpdateDao;
	
	@Test
	public void insertMemberUpdate () {
		MemberUpdateVo memberUpdateVo = new MemberUpdateVo("user010@gmail.com", "1001", "주소변경");
		boolean result = memberUpdateDao.insertMemberUpdate(memberUpdateVo);
		System.out.println("result : " + result);
	}
	
	@Test
	public void ListMemberUpdate () {
		List<MemberUpdateVo> memberUpdateList = memberUpdateDao.memberUpdateList();
		System.out.println("memberUpdateList : " + memberUpdateList);
	}
	
}
