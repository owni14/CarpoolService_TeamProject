package com.kh.team.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class FileUploadHelper {
	public static String uploadFile(String uploadPath, String originalFilename
			,byte[] fileData) 
	{
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
}
