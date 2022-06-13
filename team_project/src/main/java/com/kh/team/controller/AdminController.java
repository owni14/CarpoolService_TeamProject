
package com.kh.team.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.AdminService;
import com.kh.team.service.EventService;
import com.kh.team.service.MemberService;
import com.kh.team.service.NotifyService;
import com.kh.team.util.FileUploadHelper;
import com.kh.team.vo.AdminVo;
import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.EventVo;
import com.kh.team.vo.MemberVo;
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
	private final String SERVERIP="192.168.0.232";
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homeAdmin() {
		return "admin/home_admin";
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
	public String eventList(Model model,HttpSession session) {
		session.removeAttribute("event_seq");
		List<EventVo> eventList = eventService.getEventList();
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
	
	@RequestMapping(value = "/report_management", method = RequestMethod.GET)
	public String reportManagement(Model model, BlackListVo blackListVo) {
		
		System.out.println("blackListVo : " + blackListVo);
		List<BlackListVo> notifyList = notifyService.notifyList();
		List<BlackListVo> nNotifyList = notifyService.nNotifyList();
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
		if (blackListVo.getBlacklist_seq() > 0 && 
				blackListVo.getBlack_score() > 0) { // seq값은 0보다 크기 때문에 0보다 큰 값이 있다면 존재한다는 의미
				notifyService.modifyApprovement(blackListVo);			
			return "redirect:/admin/report_management";
		} else if (blackListVo.getBlacklist_seq() > 0 && 
				blackListVo.getBlack_score() < 0) {
				notifyService.modifyApprovement(blackListVo);			
			return "redirect:/admin/report_complete_management";
		}
		return null;
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
	public String eventUpdate(EventVo eventVo,HttpSession session) {
		//session 내 널 값 체크
		Object objSession=session.getAttribute("event_seq");
		if(objSession ==null) {
			objSession=eventVo.getEvent_seq();
		}
		String db_event_content=eventService.getContent((int)objSession);
		System.out.println("eventUpdate db_event_Content" +db_event_content);
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
	
	public String eventInsertForm(){
		return "admin/eventInsertForm";

	}
	@RequestMapping(value = "/eventInsertRun", method = RequestMethod.POST)
	public String insertRun(HttpSession session,EventVo eventVo,RedirectAttributes rttr) {
		session.removeAttribute("event_seq");
		
//		System.out.println("어드민 컨트롤 insertRun eventVo"+eventVo);
		List<String> insertImgList=FileUploadHelper.eventFilnameExtraction(eventVo.getEvent_content(), SERVERIP);
//		System.out.println("어드민 컨트롤 insertRun insertImgList"+insertImgList);
		if(insertImgList.size()>0) {
			eventVo.setEvent_img(insertImgList.get(0));
		}
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
		boolean insert_result=eventService.insertEvent(eventVo);
//		System.out.println("insert후 시퀀스"+eventVo.getEvent_seq());
		//boolean resultParticipation= eventService.createTableEvnet();
		eventService.createTableEvnet(eventVo.getEvent_seq());
		eventService.createSeqParticipation(eventVo.getEvent_seq());
		System.out.println("시퀀스와 테이블 생성 성공");
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
		List<Map<String,Object>> participationList=eventService.getJoinEventData(eventVo.getEvent_seq());
		int event_max_count=eventService.selectEventMaxCount(event_seq);
		int participation=participationList.size();
		double participation_percent=( participation/(double)event_max_count) *100;
		String participation_percentStr=
				String.format("%.2f",participation_percent);
		List<Integer> liveEventList=eventService.selectLiveEventList();
		List<Integer> endEventList=eventService.selectEndEventList();
		
		if(participationList.size()>0) {
			model.addAttribute("participationList",participationList);
		}
		System.out.println("liveEventList "+participationList);
		
		model.addAttribute("liveEventList",liveEventList);
		model.addAttribute("endEventList",endEventList);
		model.addAttribute("participation_percentStr",participation_percentStr);
		return "admin/eventParticipationForm";
					
	} 
	
	@RequestMapping(value="/event_end_participation", method=RequestMethod.GET)
	public String eventEndForm(Model model,EventVo eventVo) {
		
		List<Map<String,Object>> participationList=eventService.getJoinEventData(eventVo.getEvent_seq());
		eventVo=eventService.getEventByEseq(eventVo.getEvent_seq());
		int event_max_count=eventService.selectEventMaxCount(eventVo.getEvent_seq());
		int participation=participationList.size();
		double participation_percent=( participation/(double)event_max_count) *100;
		String participation_percentStr=
				String.format("%.2f",participation_percent);
		List<Integer> liveEventList=eventService.selectLiveEventList();
		List<Integer> endEventList=eventService.selectEndEventList();
		
		if(participationList.size()>0) {
			model.addAttribute("participationList",participationList);
		}		
		model.addAttribute("liveEventList",liveEventList);
		model.addAttribute("endEventList",endEventList);
		model.addAttribute("participation_percentStr",participation_percentStr);
		return "admin/eventEndForm";
					
	} 
	
	@RequestMapping(value="/event_winnerRun", method=RequestMethod.POST)
	public String eventWinnerRun(EventVo eventVo, String[] memberList,RedirectAttributes rttr) {
//		System.out.println("eventWinnerRun memberList"+memberList[0]);
		int event_seq=eventVo.getEvent_seq();
		String pc_code="1001";
		boolean result=false;
		for(String m_id:memberList) {
			result=eventService.transactionEventUpdate(event_seq, m_id, pc_code);	
		}
		rttr.addAttribute("transactionResult", String.valueOf(result));
		return "redirect:/admin/event_end_participation?event_seq="+eventVo.getEvent_seq();
					
	} 
	
	
}
