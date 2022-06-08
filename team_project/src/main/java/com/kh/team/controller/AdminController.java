
package com.kh.team.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.kh.team.service.EventService;
import com.kh.team.service.MemberService;
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

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homeAdmin() {
		return "admin/home_admin";
	}

	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String eventList(Model model) {
		List<EventVo> eventList = eventService.getEventList();
		Date today=new Date(System.currentTimeMillis());
		for(EventVo eventVo:eventList) {
			if(eventVo.getEvent_enddate() ==null) {
				continue;
			}
			int dateCompartResult=eventVo.getEvent_enddate().compareTo(today);
			System.out.println("dateResult "+dateCompartResult);
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
	public String reportManagement() {
		return "admin/reportManagement";
	}

	@RequestMapping(value = "/event_details", method = RequestMethod.GET)
	public String eventGetBySeq(int event_seq, Model model) {
		EventVo eventVo = eventService.getEventByEseq(event_seq);
		model.addAttribute("eventVo", eventVo);
		return "admin/eventDetails";
	}

	@RequestMapping(value = "/event_update", method = RequestMethod.POST)
	@ResponseBody
	public String eventUpdate(EventVo eventVo) {
		System.out.println("eventUpdate EventVo"+eventVo);
		boolean result = eventService.updateEvent(eventVo);
		return String.valueOf(result);
	}

	@RequestMapping(value="/event_filesAttach", method= RequestMethod.POST)
	public void eventFiles(HttpServletRequest request, HttpServletResponse response ) {
		System.out.println(request.getHeader("file-name"));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String today= formatter.format(new java.util.Date());
		String year=today.substring(0,4);
		String month=today.substring(4,6);
		String day=today.substring(6);
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
			 String filePath = "//192.168.0.232/ServerFolder/"+year+"/"+month+"/"+day+"/";
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
			 System.out.println(sFileInfo);
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

}
