
package com.kh.team.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.AdminService;
import com.kh.team.service.ComplainService;
import com.kh.team.service.EventService;
import com.kh.team.service.EvlService;
import com.kh.team.service.MemberService;
import com.kh.team.service.MemberUpdateService;
import com.kh.team.service.MessageService;
import com.kh.team.service.NotifyService;
import com.kh.team.util.CodeEnum;
import com.kh.team.util.DateHelper;
import com.kh.team.util.FileUploadHelper;
import com.kh.team.vo.AdminVo;
import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.ComplainVo;
import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.EventVo;
import com.kh.team.vo.EventWinnerVo;
import com.kh.team.vo.Is_Update_PointVo;
import com.kh.team.vo.MemberUpdateVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.MessageVo;
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	EventService eventService;
	@Autowired
	MemberService memberService;
	@Autowired
	NotifyService notifyService;
	@Autowired
	AdminService adminService;
	@Autowired
	ComplainService complainService;
	@Autowired
	MemberUpdateService memberUpdateService;
	@Autowired
	MessageService messageService;
	@Autowired
	EvlService evlService;
	private final String SERVERIP="192.168.0.232";
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homeAdmin(Model model,HttpSession session,PagingDto pagingDto) {
		List<Map<String, Object>> notApprovedDriverList = memberService.adminNotApprovedDriver();
		model.addAttribute("notApprovedDriverList",notApprovedDriverList);
		List<MemberVo> top5List = memberService.getTop5EvlMembers();
		
//		for (MemberVo memberVo : top5List) {
//			System.out.println("index : " + index);
//			System.out.println(memberVo.getM_id());
//			System.out.println(memberVo.getM_evl());
//			model.addAttribute("top" + index, memberVo.getM_id());
//			model.addAttribute("top" + index + "evl", memberVo.getM_evl());
//			index++;
//		}
		List<Integer> list = evlService.countEvl();
		int index = 1;
		for (int i :list) {
			model.addAttribute("number" + index,i);
			index++;
		}
		Object adminObject=session.getAttribute("admin_code");
		String admin_code=null;
		int noEventGetCount=eventService.selectCountWinnerNoGet();
		int noAnswer=0;
		if(adminObject != null) {
			admin_code=adminObject.toString();
			
			if(admin_code.equals("1004"))//총괄 관리자 일때만 
				{
				noAnswer=complainService.getNotFinishCountNoCode();
				}
			else {
				noAnswer=complainService.getNotFinishCount(admin_code);
			}
		}
		//예약 현황 구하기 7일전까지
		long curTime=System.currentTimeMillis();
		Date curDate;
		List<Integer> dayPassengerCounts= new ArrayList<>();
		List<BlackListVo> blackLists= notifyService.nNotifyList(pagingDto);
		List<String> strList=new ArrayList<>();
		//날짜계산
		for(int i=1; i<=7; i++) {
			long targetTime=curTime-(60*60*24*1000*i);
			curDate=new Date(targetTime);
			Calendar cal=Calendar.getInstance();
			cal.clear();
			cal.setTime(curDate);
			int tarDay=cal.get(Calendar.DATE);
			int tarMonth=cal.get(Calendar.MONTH)+1;
			int tarYear=cal.get(Calendar.YEAR);
			String day=""+tarDay;
			String month=""+tarMonth;
		if(tarDay<10) {
			day="0"+tarDay;
		}
		if(tarMonth<10) {
			month="0"+tarMonth;
		}
		String targetDateStr=tarYear+"/"+month+"/"+day;
		System.out.println(targetDateStr);
		int daycount=memberService.getCountByApplyDate(targetDateStr);
		dayPassengerCounts.add(daycount);
		strList.add(targetDateStr);
		}//end for

		
		//드라이버 몇명?
		int approve_count=memberService.selectApproveCount();
		int totalMember=memberService.adminGetCount(null);
		model.addAttribute("top5List", top5List);
		model.addAttribute("noEventGetCount", noEventGetCount);
		model.addAttribute("noAnswer", noAnswer);
		model.addAttribute("dayPassengerCounts", dayPassengerCounts);
		model.addAttribute("blackLists", blackLists);
		model.addAttribute("strList", strList);
		model.addAttribute("approve_count", approve_count);
		model.addAttribute("totalMember", totalMember);
		return "admin/home_admin";
	}
	
	@RequestMapping(value="/approveDriver", method = RequestMethod.POST)
	public String approveDriver(String m_id, String check_page) {
//		System.out.println("m_id : " + m_id);
		memberService.approveDriver(m_id);
		Driver_EvlVo driverEvlVo = new Driver_EvlVo();
		driverEvlVo.setM_id(m_id);
		driverEvlVo.setDe_drive_count(0);
		driverEvlVo.setG_code("1005");
		evlService.insertDriverEvl(driverEvlVo);
		if (check_page != null && !check_page.equals("")) {
			return "redirect:/admin/approveDriver_management";
		} else {
			return "redirect:/admin/home";
		}
	}
	
	@RequestMapping(value="/admin_login", method=RequestMethod.GET)
	public String adminLogin() {
		return "admin/admin_login_form";
	}
	
	@RequestMapping(value="/checkAdminLogin", method=RequestMethod.GET)
	public String checkAdminLogin(AdminVo adminVo,HttpSession session) {
		boolean result = adminService.checkAdminId(adminVo);
		if (result == true) {
			String admin_code = adminVo.getAdmin_code();
			session.setAttribute("admin_code", admin_code);
//			System.out.println("checkAdminLogin, admin_code" + admin_code);
			return "redirect:/admin/home";
		}
		return "admin/admin_login_form";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("admin_code");
		return "redirect:/admin/admin_login";
	}
	

	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String eventList(Model model,HttpSession session,PagingDto pagingDto) {
		session.removeAttribute("event_seq");
		List<EventVo> eventList = eventService.getEventList(pagingDto);
		Date today=new Date(System.currentTimeMillis());
		for(EventVo eventVo:eventList) {
			if(eventVo.getEvent_enddate() ==null) {
				continue;
			}
			int dateCompartResult=eventVo.getEvent_enddate().compareTo(today);
			//System.out.println("dateResult "+dateCompartResult);
			if(dateCompartResult <0) {
				//이벤트 종료 됨을 업데이트
				eventService.updateEventFinish(eventVo.getEvent_seq());
				eventVo.setEvent_is_finish("Y");
			}
		}
		
		model.addAttribute("eventList", eventList);
		return "admin/eventManagement";
	}

	@RequestMapping(value = "/member_management", method = RequestMethod.GET)
	public String memberManagement(Model model, PagingDto pagingDto) {
		System.out.println("AdminController int count : " + memberService.adminGetCount(pagingDto));
		pagingDto.setCount(memberService.adminGetCount(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
//		System.out.println("AdminController int pagingDto : " + pagingDto);
		List<MemberVo> memberList =  memberService.admingetMemberList(pagingDto);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pagingDto", pagingDto);
		return "admin/memberManagement";
	}
	
	@RequestMapping(value = "/member_update_management", method = RequestMethod.GET)
	public String member_update_management() {
		return "admin/memberUpdateManagement";
	}
	
	@RequestMapping(value = "/checkMyMessage", method = RequestMethod.GET)
	public String checkMyMessage(HttpSession session,Model model,PagingDto pagingDto) {
		String admin_code = (String)session.getAttribute("admin_code");
//		System.out.println("admin_code : " + admin_code);
		pagingDto.setCount(messageService.countAdminGetMessage(admin_code, pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		System.out.println("pagingDto1 : " + pagingDto);
		List<MessageVo> getMessageList = messageService.adminGetMessageList(admin_code,pagingDto);
		List<String> adminList = adminService.getAllAdminCode();
		model.addAttribute("getMessageList",getMessageList);
		model.addAttribute("adminList", adminList);
		return "admin/checkMyMessage";
	}
	
	@RequestMapping(value="/checkMySendMessage", method = RequestMethod.GET)
	public String checkMySendMessage(HttpSession session,Model model,PagingDto pagingDto) {
		String admin_code = (String)session.getAttribute("admin_code");
		pagingDto.setCount(messageService.countAdminSendMessage(admin_code, pagingDto));
		pagingDto.setPage(pagingDto.getPage());
//		System.out.println("pagingDto2 : " + pagingDto);
		List<MessageVo> sendMessageList = messageService.adminSendMessageList(admin_code,pagingDto);
//		System.out.println("sendMessageList : " + sendMessageList);
//		System.out.println("보낸 메세지 갯수 확인 : " + messageService.countAdminSendMessage(admin_code, pagingDto));
		List<String> adminList = adminService.getAllAdminCode();
		model.addAttribute("sendMessageList", sendMessageList);
		model.addAttribute("adminList", adminList);
		return "admin/checkMySendMessage";
	}
	
	@RequestMapping(value="/checkSendToMeMessage", method = RequestMethod.GET)
	public String checkSendToMeMessage(HttpSession session,Model model,PagingDto pagingDto) {
		String admin_code = (String)session.getAttribute("admin_code");
		pagingDto.setCount(messageService.countAdminToMeMessage(admin_code, pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		List<MessageVo> sendToMeMessageList = messageService.adminToMeMessageList(admin_code,pagingDto);
//		System.out.println("sendToMeMessageList : " + sendToMeMessageList);
		List<String> adminList = adminService.getAllAdminCode();
		model.addAttribute("sendToMeMessageList", sendToMeMessageList);
		model.addAttribute("adminList", adminList);
		return "admin/checkSendToMeMessage";
	}
	
	@RequestMapping(value = "/approveDriver_management", method = RequestMethod.GET)
	public String approveDriverManagement(Model model) {
		List<Map<String, Object>> notApprovedDriverList = memberService.adminNotApprovedDriver();
		model.addAttribute("notApprovedDriverList",notApprovedDriverList);
		return "admin/approveDriverManagement";
	}
	
	@RequestMapping(value = "/report_management", method = RequestMethod.GET)
	public String reportManagement(Model model, BlackListVo blackListVo,PagingDto pagingDto) {
		
//		System.out.println("blackListVo : " + blackListVo);
		List<BlackListVo> notifyList = notifyService.notifyList();
		List<BlackListVo> nNotifyList = notifyService.nNotifyList(pagingDto);
		List<BlackListVo> dayNotifyList = notifyService.dayNotifyList();
		List<BlackListVo> cNotifyList = notifyService.cNotifyList();
		int dayNotifyCount = notifyService.dayNotifyCount();
		int nNotifyCount = notifyService.notifyCount();
		int totalNotifyCount = notifyService.totalNotifyCount();
		int cNotifyCount = notifyService.cNotifyCount();
		model.addAttribute("notifyList", notifyList);
		model.addAttribute("nNotifyList", nNotifyList);
		model.addAttribute("dayNotifyList", dayNotifyList);
		model.addAttribute("dayNotifyCount", dayNotifyCount);
		model.addAttribute("nNotifyCount", nNotifyCount);
		model.addAttribute("totalNotifyCount", totalNotifyCount);
		model.addAttribute("cNotifyList", cNotifyList);
		model.addAttribute("cNotifyCount", cNotifyCount);
		
		return "admin/reportManagement";
	}
	
	@RequestMapping(value="/report_complete_management", method = RequestMethod.GET)
	public String report_complete_management (BlackListVo blackListVo,Model model) {
		List<String> m_ids = notifyService.ListBlockPeople();
		int size = m_ids.size();
		model.addAttribute("blockMemberCount", size);
		for (int i = 0; i < m_ids.size(); i++) {
			String m_id = m_ids.get(i);
			List<Integer> blackPoints = notifyService.BlockPoints(m_id);
			model.addAttribute("m_id" + (i+1), m_id);
			for (int j = 0; j < blackPoints.size(); j++) {
				model.addAttribute("m_id" + (i+1) + "point" + (j+1), blackPoints.get(j));
			}
		}
		List<BlackListVo> yNotifyList = notifyService.yNotifyList();
		int dayNotifyCount = notifyService.dayNotifyCount();
		int nNotifyCount = notifyService.notifyCount();
		int totalNotifyCount = notifyService.totalNotifyCount();
		int cNotifyCount = notifyService.cNotifyCount();
		model.addAttribute("yNotifyList", yNotifyList);
		model.addAttribute("dayNotifyCount", dayNotifyCount);
		model.addAttribute("nNotifyCount", nNotifyCount);
		model.addAttribute("totalNotifyCount", totalNotifyCount);
		model.addAttribute("cNotifyCount", cNotifyCount);
		return "admin/reportComplete";
	}
	
	@RequestMapping(value = "/modifyBlackPoint", method = RequestMethod.POST)
	public String modifyBlackPoint(BlackListVo blackListVo) {
		System.out.println("modifyBlackPoint blackListVo : " + blackListVo);
		if (blackListVo.getBlacklist_seq() > 0 && 
				blackListVo.getBlack_score() > 0) { // seq값은 0보다 크기 때문에 0보다 큰 값이 있다면 존재한다는 의미
				notifyService.modifyApprovement(blackListVo);	
			return "redirect:/admin/report_management";
		} else if (blackListVo.getBlacklist_seq() > 0 && 
				blackListVo.getBlack_score() < 0) {
				notifyService.modifyApprovement(blackListVo);			
			return "redirect:/admin/report_complete_management";
		} else if (blackListVo.getBlacklist_seq() > 0 &&
				blackListVo.getBlack_score() == 0) {
				notifyService.modifyApprovement(blackListVo);
			return "redirect:/admin/report_management";
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getMemberUpdateList", method = RequestMethod.GET)
	public List<MemberUpdateVo> getMemberUpdateList() {
		List<MemberUpdateVo> memberUpdateList = memberUpdateService.memberUpdateList();
		return memberUpdateList;
	} 
	
	@ResponseBody
	@RequestMapping(value = "/displayLicenseImage", method = RequestMethod.GET)
	public byte[] displayLicenseImage(String ad_license_img) throws Exception{
		FileInputStream fis;
			fis = new FileInputStream(ad_license_img);
			byte[] data = IOUtils.toByteArray(fis);
			fis.close();
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/memberInfoUpdate", method = RequestMethod.POST)
	public String memberInfoUpdate(MemberVo memberVo, MemberUpdateVo memberUpdateVo) {
		boolean result = memberService.adminUpdateMemberInfo(memberVo, memberUpdateVo);
		return String.valueOf(result);
	}

	@RequestMapping(value = "/event_details", method = RequestMethod.GET)
	public String eventGetBySeq(int event_seq, Model model,HttpSession session) {
		System.out.println("접근 ");
		EventVo eventVo = eventService.getEventByEseq(event_seq);
		model.addAttribute("eventVo", eventVo);
		session.setAttribute("event_seq", event_seq);
		return "admin/eventDetails";
	}

	@RequestMapping(value = "/event_update", method = RequestMethod.POST)
	@ResponseBody
	public String eventUpdate(EventVo eventVo,HttpSession session,MultipartFile file) {
		//session 내 널 값 체크
		Object objSession=session.getAttribute("event_seq");
		
		if(objSession ==null) {
			objSession=eventVo.getEvent_seq();
		}
		//비교용 디비 내용 가져오기
		String db_event_content=eventService.getContent((int)objSession);
		String db_event_img=eventService.getEvent_img((int)objSession);
		System.out.println("eventUpdate db_event_Content" +db_event_content);
		
		//파일 처리
		if(file!=null) {
			//db에 내용저장되 있을시 서버폴더에서 제거
			if(db_event_img !=null) {
				FileUploadHelper.deleteFile(db_event_img);
			}
			
			System.out.println("수정 어드민이벤트 : 파일 "+file.getOriginalFilename() );
			String uploadPath=FileUploadHelper.getFileSaveFath(SERVERIP);
			try {
			String targetFile=FileUploadHelper.uploadFile(uploadPath, file.getOriginalFilename() , file.getBytes());
			eventVo.setEvent_img(targetFile);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//섬네일 파일 만들기
		List<String> insertImgList=FileUploadHelper.eventFilnameExtraction(eventVo.getEvent_content(), SERVERIP);
//		if(insertImgList.size()>0) {
//			eventVo.setEvent_img(insertImgList.get(0));
//		}
//		//섬네일 파일 추가
//		else {
//			eventVo.setEvent_img(null);
//		}
		String contentStr=eventVo.getEvent_content();
		List<String> contentFileList=FileUploadHelper.eventFilnameExtraction(contentStr, SERVERIP);
		List<String> db_contentFileList=FileUploadHelper.eventFilnameExtraction(db_event_content, SERVERIP);
		int dbContentSize=db_contentFileList.size();
		int contentSize=contentFileList.size();
//		String[] arrSplitStr=contentStr.split("<img");
//		//list 파일 목록 담을거
//		List<String> contentFileList=new ArrayList<String>();
//		for(String strFile:arrSplitStr) {
//			//이미지 서버꺼인지 검정
//			if(strFile.contains(SERVERIP)) {
////				System.out.println(strFile);
//				int strFileIndex=strFile.indexOf("192");
//				int dblSlashIndex=strFileIndex-2;
//				int endFileExtIndex=strFile.indexOf("\"",strFileIndex );
//				contentFileList.add(strFile.substring(dblSlashIndex,endFileExtIndex));
//			}
//		}
		System.out.println("contentFileList "+contentFileList);
		System.out.println("db_contentFileList "+db_contentFileList);
//		System.out.println("eventUpdate EventVo"+eventVo);
		//디비에 저장된게 더크다는건 파일이 삭제 되었다는것
		
		boolean dbUpdate_result = eventService.updateEvent(eventVo);
		boolean fileUpdate_result=false;
		if (dbContentSize >= contentSize) {
			//db에서 컨텐트 지우기
			db_contentFileList.removeAll(contentFileList);
			System.out.println("db_contentFileList removeall "+db_contentFileList);
			//리스트의 변경으로 인한 리사이징
			// lt 0 컨텐트에서 파일이 추가
			// gt 0 컨텐트에서 파일이 삭제
			dbContentSize=db_contentFileList.size();
			//크기가 0은 삭제할 파일이 없다 다같은 내용
			if(dbContentSize>0) {
				for(String strFile:db_contentFileList) {
					fileUpdate_result=FileUploadHelper.deleteFile(strFile);
				}
			}
			else if(contentSize <=0 && dbContentSize <=0) {
				//content와 db에 파일이 없다 폴더에서 삭제해야함
				String dirPathTmp=FileUploadHelper.getFileSaveFath(SERVERIP);
				dirPathTmp +="event_seq!!";
				fileUpdate_result=FileUploadHelper.deleteFileS(dirPathTmp);
			}
		}
		if(dbUpdate_result && fileUpdate_result ) {
			return "dbUP&FileDEl";
		}
		return "dbUP";
	}
	
	@RequestMapping(value="/event_filesAttach", method= RequestMethod.POST)
	public void eventFiles(HttpServletRequest request, HttpServletResponse response,HttpSession session ) {
//		System.out.println(request.getHeader("file-name"));
		Object objEventSeq=session.getAttribute("event_seq");
		System.out.println("eventFiles attach session event_seq"+objEventSeq);
		try {
			 //파일정보
			 String sFileInfo = "";
			 //파일명을 받는다 - 일반 원본파일명
			 String filename = request.getHeader("file-name");
			 //파일 확장자
			 String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
			 //확장자를소문자로 변경
			 filename_ext = filename_ext.toLowerCase();
			 	
			 //이미지 검증 배열변수
			 String[] allow_file = {"jpg","png","bmp","gif"};

			 //돌리면서 확장자가 이미지인지 
			 int cnt = 0;
			 for(int i=0; i<allow_file.length; i++) {
			 	if(filename_ext.equals(allow_file[i])){
			 		cnt++;
			 	}
			 }

			 //이미지가 아님
			 if(cnt == 0) {
				 PrintWriter pw = response.getWriter();
				 pw.print("NOTALLOW_"+filename);
				 pw.flush();
				 pw.close();
			 } else {
			 //이미지이므로 신규 파일로 디렉토리 설정 및 업로드	
			 //파일 기본경로
//			 String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			 //파일 기본경로 _ 상세경로
				 String filePath=null;
				 //입력폼시 세션 값이 null
				 if(objEventSeq ==null) {
					 filePath=FileUploadHelper.getFileSaveFath(SERVERIP)+"tmpImages/";
				 }
				 //수정폼 접근
				 else {
					 
					 filePath=FileUploadHelper.getFileSaveFath(SERVERIP)+"event_seq!!"+"/";
				 }	 
			  
			
			 File file = new File(filePath);
			 if(!file.exists()) {
			 	file.mkdirs();
			 }
			 String realFileNm = "";
			 
			 realFileNm = UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			 String targetFileName = filePath + realFileNm;
			 ///////////////// 서버에 파일쓰기 ///////////////// 
			 InputStream is = request.getInputStream();
			 OutputStream os=new FileOutputStream(targetFileName);
			 int numRead;
			 byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			 while((numRead = is.read(b,0,b.length)) != -1){
			 	os.write(b,0,numRead);
			 }
			 if(is != null) {
			 	is.close();
			 }
			 os.flush();
			 os.close();
			 ///////////////// 서버에 파일쓰기 /////////////////

			 // 정보 출력
			 sFileInfo += "&bNewLine=true";
			 // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			 sFileInfo += "&sFileName="+ filename;;
			 sFileInfo += "&sFileURL=/admin/displayImage?filename="+targetFileName;
//			 System.out.println(sFileInfo);
			 PrintWriter print = response.getWriter();
			 print.print(sFileInfo);
			 print.flush();
			 print.close();
			 }	
		} catch (Exception e) {
			e.printStackTrace();
		}


	}
	
	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String filename) throws Exception {
		
		FileInputStream fis = null;
		fis = new FileInputStream(filename);
		byte[] data = IOUtils.toByteArray(fis);
		fis.close();
		return data;

	}
	@RequestMapping(value = "/event_insertForm", method = RequestMethod.GET)
	
	public String eventInsertForm(Model model){
		PagingDto pagingDto= new PagingDto();
		int memberCount=memberService.adminGetCount(pagingDto);
		model.addAttribute("memberCount", memberCount);
		return "admin/eventInsertForm";

	}
	@RequestMapping(value = "/eventInsertRun", method = RequestMethod.POST)
	public String insertRun(HttpSession session,EventVo eventVo,RedirectAttributes rttr,MultipartFile file) throws IOException {
		session.removeAttribute("event_seq");
		if(file.getOriginalFilename() !=null && file.getOriginalFilename() !="") {
			
			String originalFilename=file.getOriginalFilename();
			System.out.println("file name"+originalFilename);
			String uploadPath=FileUploadHelper.getFileSaveFath(SERVERIP);
			byte[] fileData=file.getBytes();
			//최종 파일 복사후 저장되는 이름
			String saveFilename=FileUploadHelper.uploadFile(uploadPath, originalFilename, fileData);
			eventVo.setEvent_img(saveFilename);
		}
//		System.out.println("어드민 컨트롤 insertRun eventVo"+eventVo);
		List<String> insertImgList=FileUploadHelper.eventFilnameExtraction(eventVo.getEvent_content(), SERVERIP);
//		System.out.println("어드민 컨트롤 insertRun insertImgList"+insertImgList);
//		if(insertImgList.size()>0) {
//			//썸네일 이미지 만들기
//			eventVo.setEvent_img(insertImgList.get(0));
//		}
		for(String sourceFileStr:insertImgList ) {
			String[] tempPathStrs=sourceFileStr.split("tmpImages");
			//정상적인 저장
			if(tempPathStrs.length==2) {
				String destFileStr=tempPathStrs[0]+"event_seq!!"+tempPathStrs[1];
//				System.out.println("어드민 컨트롤 insertRun destFileStr"+destFileStr);
				FileUploadHelper.copyEventFiles(destFileStr,sourceFileStr);
				
			}
			else {
				System.out.println("잘못된 저장형식");
			}
		}
		System.out.println("event_code "+eventVo);
		boolean insert_result=eventService.insertEvent(eventVo);
//		System.out.println("insert후 시퀀스"+eventVo.getEvent_seq());
		//boolean resultParticipation= eventService.createTableEvnet();
		eventService.createTableEvnet(eventVo.getEvent_seq());
		eventService.createSeqParticipation(eventVo.getEvent_seq());
		
		System.out.println("시퀀스와 테이블 생성 성공");
		//완성된 테이블에 모든 멤버 집어넣기
		List<MemberVo> memberIdList=memberService.selectM_idList();
		for(MemberVo memberVo:memberIdList) {
			eventService.insertParticipation(memberVo.getM_id(), eventVo.getEvent_seq());
		}
		System.out.println("이벤트 번호 :"+eventVo.getEvent_seq()+"모든 유저 참가 완료");
		rttr.addFlashAttribute("insert_result",String.valueOf(insert_result));
		return "redirect:/admin/event";
	}
	
	@RequestMapping(value="/event_participation", method=RequestMethod.GET)
	public String eventForm(Model model,EventVo eventVo) {
		int event_seq=eventVo.getEvent_seq();
		if(event_seq<=0) {
			event_seq=eventService.getMaxNoFinishEventSeq();
			eventVo.setEvent_seq(event_seq);
		}
		int allMemberCount=memberService.adminGetCount(null);
		List<Map<String,Object>> participationList=eventService.getJoinEventData(eventVo.getEvent_seq());
		int event_max_count=eventService.selectEventMaxCount(event_seq);
		List<Integer> liveEventList=eventService.selectLiveEventList();
		List<EventVo> endEventList=eventService.selectEndEventList();
		
		if(participationList.size()>0) {
			model.addAttribute("participationList",participationList);
		}
		System.out.println("liveEventList "+participationList);
		
		model.addAttribute("liveEventList",liveEventList);
		model.addAttribute("endEventList",endEventList);

		return "admin/eventParticipationForm";
					
	} 
	
	@RequestMapping(value="/event_end_participation", method=RequestMethod.GET)
	public String eventEndForm(Model model,EventVo eventVo) {
		
		List<Map<String,Object>> participationList=eventService.getJoinEventData(eventVo.getEvent_seq());
		eventVo=eventService.getEventByEseq(eventVo.getEvent_seq());
		int event_max_count=eventService.selectEventMaxCount(eventVo.getEvent_seq());
		List<Integer> liveEventList=eventService.selectLiveEventList();
		List<EventVo> endEventList=eventService.selectEndEventList();
		List<EventWinnerVo> eventWinnerList=eventService.selectWinnerIsGet(eventVo.getEvent_seq());
		if(participationList.size()>0) {
			model.addAttribute("participationList",participationList);
		}		
		model.addAttribute("eventVo",eventVo);
		model.addAttribute("eventWinnerList",eventWinnerList);
		model.addAttribute("liveEventList",liveEventList);
		model.addAttribute("endEventList",endEventList);
		model.addAttribute("event_max_count",event_max_count);
		return "admin/eventEndForm";
					
	} 
	
	@RequestMapping(value="/event_winnerRun", method=RequestMethod.POST)
	public String eventWinnerRun(EventVo eventVo, String[] memberList,RedirectAttributes rttr
			,HttpSession session) {
//		System.out.println("eventWinnerRun memberList"+memberList[0]);
		int event_seq=eventVo.getEvent_seq();
		System.out.println("eventWinnerRun event_seq "+event_seq);
		eventVo=eventService.getEventByEseq(event_seq);//포인트 코드
		String admin_code=(String)session.getAttribute("admin_code");
		if(admin_code ==null) {
			return "redirect:/admin/admin_admin_login";
		}
		boolean result=false;
		String 	pc_code=eventVo.getPc_code();
		
//		System.out.println("이벤트 코드 :"+eventVo.getPc_code());
//		System.out.println("어드민 코드 :"+admin_code);
		for(String m_id:memberList) {
			result=eventService.transactionEventUpdate(event_seq, m_id, pc_code);
			MessageVo messageVo=new MessageVo(m_id, null, null, admin_code, "축하드립니다 유저 "+m_id+"님 이벤트 명("+
			eventVo.getEvent_name()+")에 당첨되셨습니다 고객님의 이용에 항상 감사드립니다 앞으로도 꾸준한 사랑 부탁드리겠습니다");
			messageService.insertNoBlackMessage(messageVo);
		}
		rttr.addFlashAttribute("transactionResult", String.valueOf(result));
		return "redirect:/admin/event_end_participation?event_seq="+eventVo.getEvent_seq();
					
	} 
	@RequestMapping(value="/complainForm", method=RequestMethod.GET)
	public String complainForm(Model model,HttpSession session,PagingDto pagingDto) {
		long dateTime=System.currentTimeMillis();
		long agoSeven=dateTime-60*60*24*7*1000;
		Date agoSevenDate = new Date(agoSeven);
		Object obj=session.getAttribute("admin_code");
		List<ComplainVo> complainList=null;
		int complain_count=0;
		if(obj !=null) {
			
			String admin_code=obj.toString();
			System.out.println("문의담당 관리자 코드"+admin_code);
			//총괄 관리자 아닐떄
			if(!"1004".equals(admin_code)) {
				
				complainList=complainService.getAllNotFinishList(admin_code,pagingDto);
				complain_count=complainService.getNotFinishCount(admin_code);
			}
			//총괄 관리자 해당
			else {
				complainList=complainService.getAllNotFinishListNoCode(pagingDto);
				complain_count=complainService.getNotFinishCountNoCode();
				
			}
		}
		
		int agoSevenCount=0;
		for(ComplainVo complainVo:complainList) {
			Date dbDate=complainVo.getComplain_regdate();
			long dbTime=dbDate.getTime();
			if(agoSeven>=dbTime) {
				agoSevenCount++;
			}
		}
		model.addAttribute("complainList",complainList);
		model.addAttribute("complain_count",complain_count);
		model.addAttribute("agoSevenCount",agoSevenCount);
		
		return "admin/complainManagement";
					
	} 
	@RequestMapping(value="/complainAnswer", method=RequestMethod.POST)
	public String complainAnswer(RedirectAttributes rttr,ComplainVo complainVo) {
		
		long dateTime=System.currentTimeMillis();
		Date date = new Date(dateTime);
		complainVo.setComplain_answer_date(date);
		complainVo.setComplain_is_finish("Y");
		String senderUser=complainVo.getM_id();
		String admin_code=complainVo.getAdmin_code();
		MessageVo messageVo=new MessageVo(senderUser, null, null, admin_code,"유저 ("+ complainVo.getM_id()+")님이문의하신 내용에 대한 답변이 완료되었습니다");
		System.out.println(date);
		System.out.println("complainAnswer complainVo"+complainVo);
		boolean result=complainService.updateComplain(complainVo);
		messageService.insertNoBlackMessage(messageVo);
		rttr.addFlashAttribute("result",String.valueOf(result));
		return "redirect:/admin/complainForm";
					
	} 
	
	@RequestMapping(value="/complainAnswerComplete", method=RequestMethod.GET)
	public String complainAnswerComplete(Model model,HttpSession session,
			PagingDto pagingDto,AdminVo adminVo,ComplainVo complainVo) {
		Object obj=session.getAttribute("admin_code");
		List<ComplainVo> complainList=null;
		List<String> amdinCodes=null;
		if(obj !=null) {
			
			String admin_code=obj.toString();
			//처음 접속시 adminCode가 널일수 있다
			if(adminVo.getAdmin_code() ==null) {
				adminVo.setAdmin_code(admin_code);
				System.out.println("adminVo"+adminVo);
			}
			
			//총괄 관리자 아닐때
			if(!"1004".equals(admin_code)) {
				System.out.println("문의담당 관리자 코드 완료목록"+admin_code);
				complainList=complainService.getAllFinishListByCode(admin_code,pagingDto,complainVo);
				
				
			}
			//총괄 관리자 
			else {
				complainList=complainService.getAllFinishList(pagingDto,adminVo,complainVo);
				amdinCodes=adminService.getAllAdminCode();
				for(ComplainVo vo:complainList) {
					System.out.println("로그 확인"+vo);
				}
			}
		}
		
		model.addAttribute("complainList",complainList);
		model.addAttribute("amdinCodes",amdinCodes);
		model.addAttribute("pagingDto",pagingDto);
		
		return "admin/complainCompleteForm";
					
	} 
	//포인트 코드 에 따른 메세지 전송및 히스토리 입력
	private void AddAllMemberHistoryNMessage(String pc_code) {
		
		List<MemberVo> memberIdList=memberService.selectM_idList();
		for(MemberVo memberVo:memberIdList) {
			evlService.transactionPointHistoryNMessage(memberVo.getM_id(), pc_code);
		}
		
	}
}
