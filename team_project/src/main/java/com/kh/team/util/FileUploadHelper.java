package com.kh.team.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class FileUploadHelper {
	public static String uploadFile(String uploadPath, String originalFilename, byte[] fileData) {
		UUID uuid=UUID.randomUUID();
		String saveFilename= uploadPath+"/"+uuid+"_"+originalFilename;
		System.out.println("save saveFilename :"+saveFilename);
		
		File ftarget=new File(saveFilename);
		try {
			FileCopyUtils.copy(fileData, ftarget);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return saveFilename;
	}
	public static boolean deleteFile(String filename) {
		File f= new File(filename);
		if(f.exists()) {
			f.delete();
			return true;
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
}
