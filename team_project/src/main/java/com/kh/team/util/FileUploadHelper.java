package com.kh.team.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.util.FileCopyUtils;

public class FileUploadHelper {
	// 파일 업로드
	public static String uploadFile(String uploadPath, String originalFilename, byte[] fileData) {
		UUID uuid=UUID.randomUUID();
		String saveFilename = uploadPath+"/"+uuid+"_"+originalFilename;
		System.out.println("save saveFilename :"+saveFilename);
		
		File ftarget=new File(saveFilename);
		try {
			FileCopyUtils.copy(fileData, ftarget);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return saveFilename;
	}
	
	//파일 지우기
	public static boolean deleteFile(String filename) {
		File f= new File(filename);
		if(f.exists()) {
			f.delete();
			return true;
		}
		return false;
	}
	
	//파일 리스트에서 파일 다지우기
	public static boolean deleteFileS(String fileDirPath) {
		System.out.println("fileDirPath"+fileDirPath);
		File f= new File(fileDirPath);
		if(f.exists()) {
			String[] arrfiles=f.list();
			if(arrfiles.length>0) {
				for(String strFile:arrfiles) {
//					System.out.println("deleteFileS"+strFile);
					File delFile=new File(fileDirPath+"/"+strFile);
					delFile.delete();
				}
				return true;
			}
			
		}
		return false;
		}
	
	//이벤트 파일 비교
	public static List<String> eventFilnameExtraction(String event_content,String serverIp){
		String[] arrSplitStr=event_content.split("<img");
		//list 파일 목록 담을거
		List<String> contentFileList=new ArrayList<String>();
		for(String strFile:arrSplitStr) {
			//이미지 서버꺼인지 검정
			if(strFile.contains(serverIp)) {
//				System.out.println(strFile);
				int strFileIndex=strFile.indexOf("192");
				int dblSlashIndex=strFileIndex-2;
				int endFileExtIndex=strFile.indexOf("\"",strFileIndex );
				contentFileList.add(strFile.substring(dblSlashIndex,endFileExtIndex));
			}
		}
		return contentFileList;
	}
	
	// 파일 저장 디렉토리 획득
	public static String getFileSaveFath(String serverip) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String today= formatter.format(new java.util.Date());
		String year=today.substring(0,4);
		String month=today.substring(4,6);
		String day=today.substring(6);
		 String filePath = 
		"//"+serverip+"/ServerFolder/"+year+"/"+month+"/"+day+"/";
		return filePath;
	}
	

	public static boolean copyEventFiles(String targetFileName,String soureFileName) {
		 InputStream is;
		 OutputStream os;
		 File targetFile=new File(soureFileName);
		try {
			is = new FileInputStream(targetFile);
			
			os=new FileOutputStream(targetFileName);
			 int numRead;
//			 System.out.println("targetFile.length() "+targetFile.length());
			 byte b[] = new byte[(int) targetFile.length()];
			 System.out.println(b.length);
			 while((numRead = is.read(b,0,b.length)) != -1){
//				 System.out.println("count---");
			 	os.write(b,0,numRead);
			 }
			 if(is != null) {
			 	is.close();
			 }
			 os.flush();
			 os.close();
			 return true;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return false;
	}

	// 운전면허증 파일 업로드
	public static String uploadFileForDriver(String uploadPath, String originalFilename, byte[] fileData) {
		String saveFilename = uploadPath + "/" + originalFilename;
		File ftarget = new File(saveFilename);
		boolean isExistence = ftarget.exists();
		
		if (isExistence) {
			return "existence";
		}
		
		try {
			FileCopyUtils.copy(fileData, ftarget);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return saveFilename;
	}
	

}
