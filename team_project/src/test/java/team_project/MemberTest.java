package team_project;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.MemberDao;
import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class MemberTest {
	
	@Autowired
	MemberDao memberDao;
	
	@Test
	public void insertMember() {
		for (int i=4; i <= 200; i++) {
			MemberVo memberVo = new MemberVo("user0" + i +"@gmail.com", "유저" + i, "1234", "M", "KAKAO", "인사관리부", "Y", "울산 북구 중산동", "01056789123");
			memberDao.insertMember(memberVo);
		}
	}
	// test ok, value of phonenumber must be composed of number 
	
	@Test
	public void getMemberList() {
		PagingDto pagingDto = new PagingDto();
		pagingDto.setPage(2);
		List<MemberVo> memberList = memberDao.admingetMemberList(pagingDto);
		System.out.println("MemberTest, MemberList : " +  memberList);
	}
	// test ok
	
	@Test
	public void getCount() {
		PagingDto pagingDto = new PagingDto();
		pagingDto.setSearchType("c");
		pagingDto.setKeyword("sam");
		int count = memberDao.adminGetCount(pagingDto);
		System.out.println("count : " + count);
	}
	
	@Test
	public void getMemberByIdAndPw() {
		MemberVo memberVo = memberDao.getMemberByIdAndPw("hong@naver.com", "1234");
		System.out.println("MemverTest, MemberVo : " + memberVo);
	}
	
	@Test
	public void testgetMember() {
	System.out.println(memberDao.getDriverList("user0187@gmail.com"));	
	}
	
	@Test
	public void adminupdateBlackScore() {
		BlackListVo blackListVo = new BlackListVo();
		blackListVo.setBlack_score(5);
		blackListVo.setBlack_m_id("hong@naver.com");
		System.out.println("blackListVo" + blackListVo);
		memberDao.adminupdateBlackScore(blackListVo);
	}
}

