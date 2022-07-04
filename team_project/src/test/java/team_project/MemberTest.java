package team_project;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.swing.text.DateFormatter;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.MemberDao;
import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.ComplainVo;
import com.kh.team.vo.DriverVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class MemberTest {
	
	@Autowired
	MemberDao memberDao;
	
	@Test
	public void insertMember() {
		for (int i=81; i <= 100; i++) {
			MemberVo memberVo = new MemberVo("user0" + i +"@email.com", "유저" + i, "1234", "W", "SK", "인사관리부", "Y", "울산 북구 송내14길", "01056789123");
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
	public void adminupdateBlackScore() {
		BlackListVo blackListVo = new BlackListVo();
		blackListVo.setBlack_score(5);
		blackListVo.setBlack_m_id("hong@naver.com");
		System.out.println("blackListVo" + blackListVo);
		memberDao.adminupdateBlackScore(blackListVo);
	}
	
	@Test
	public void getDriverList() {
		String m_id = "user03@gmail.com";
		String m_company = "KAKAO";
//		Map<String, Object> mapDriverInfo = memberDao.getDriverById(m_id, m_company);
//		System.out.println("mapDriverInfo:" + mapDriverInfo);
	}
	
	@Test
	public void getDriverSeq() {
		String m_id = "hong@naver.com";
		String driver_seq = memberDao.getDriverSeqFromPassenger(m_id);
		System.out.println("driver_seq: " + driver_seq);
	}
	
	@Test
	public void getDriverId() {
		String driver_seq = "4";
		String driverId = memberDao.getDriverId(driver_seq);
		System.out.println("driverId:" + driverId);
	}
	
	@Test
	public void getTop5EvlMembers() {
		List<MemberVo> list = memberDao.getTop5EvlMembers();
		System.out.println("list:" + list);
	}
	
	@Test
	public void isApplication() {
		String m_id = "user04@gmail.com";
		boolean result = memberDao.isApplication(m_id);
		System.out.println("result: " + result);
	}
	
	@Test
	public void adminNotApprovedDriver() {
		List<Map<String, Object>> list = memberDao.adminNotApprovedDriver();
		System.out.println("list:" + list);
	}
	
	@Test
	public void approveDriver() {
		String m_id = "user027@gmail.com";
		memberDao.approveDriver(m_id);
	}
	public void driverPagingTest() {
		String m_company = "SAMSUNG";
		PagingDto pagingDto = new PagingDto();
		pagingDto.setStartRow(6);
		pagingDto.setEndRow(10);
		List<Map<String, Object>> list = memberDao.getDriverList(m_company, pagingDto);
		for (Map<String, Object> map : list) {
			System.out.println(map);
		}
	}
	
	@Test
	public void getTotalDriverCountTest() {
		String m_company = "SAMSUNG";
		int count = memberDao.getTotalDriverCount(m_company);
		System.out.println("count:" + count);

	}
	
	@Test
	public void approvePassengerTest() {
		String m_id = "hong@naver.com";
		memberDao.approvePassenger(m_id);
	}
	
	@Test
	public void approveState() {
		String m_id = "user04@gmail.com";
		String state = memberDao.getApproveState(m_id);
		System.out.println("state:" + state);
	}
	
	@Test
	public void getDriverSeqFromPassengerTest() {
		String m_id = "user04@gmail.com";
		String driverSeq = memberDao.getDriverSeqFromPassenger(m_id);
		System.out.println("driver_seq:" + driverSeq);
	}

	@Test
	public void isDriverTest() {
		String m_id = "user04@gmail.com";
		boolean result = memberDao.isDriver(m_id);
		System.out.println("result:" + result);
	}
	
	@Test
	public void updateDriverTest() {
		DriverVo driverVo = new DriverVo(63, "울산 북구 아진로 75", "N", "updateTest", "07:30");
		boolean result = memberDao.updateDriver(driverVo);
		System.out.println("result:" + result);
	}
	
	@Test
	public void deleteDriverTest() {
		boolean result = memberDao.deleteDriver(52);
		System.out.println("result:" + result);
	}
	
	@Test
	public void getDriverInfo() {
		DriverVo driverVo = memberDao.getDriverInfo(4);
		System.out.println(driverVo);
	}
	
	@Test
	public void isApproveDriver() {
		String m_id = "hong@naver.com";
		boolean result = memberDao.isApproveDriver(m_id);
		System.out.println("result:" + result);
	}
	
	@Test
	public void countBlackPoint() {
		String m_id = "user01@gmail.com";
		int count = memberDao.countBlackPoint(m_id);
		System.out.println("count : " + count);
	}
	public void getDeletingPassengerListTest() {
		int driver_seq = 90;
		List<String> list = memberDao.getDeletingPassengerList(driver_seq);

	}
	
	@Test
	public void canclDriver() {
		String m_id = "user032@email.com";
		memberDao.cancelDriver(m_id);
	}
	
	@Test
	public void isDuplicationIdTest() {
		String m_id = "hong@naver.com";
		boolean result = memberDao.isDuplicationId(m_id);
		System.out.println("result:" + result);
	}
	
}