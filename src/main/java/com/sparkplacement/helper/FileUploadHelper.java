package com.sparkplacement.helper;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUploadHelper {

	@Value("${project.image}")
	private String path;

	public String uploadImage(String subFolder, int id, MultipartFile file) throws IOException {

		String newId = id + "";
//		file name
		String name = file.getOriginalFilename();
		
		String newName = "";
		
		if(subFolder.equals("profile") || subFolder.equals("profileBack")) {
			newName = newId.concat(subFolder).concat(name.substring(name.lastIndexOf(".")));
		}else {
			newName = UUID.randomUUID().toString().concat(name);
		}
		
		
//		full path
		String folderPath = path + File.separator + subFolder + File.separator;
		String filePath = folderPath + newName;

//		System.out.println(filePath);	

//		create folder if not present
		File f = new File(folderPath);
		if (!f.exists()) {
			f.mkdirs();
		}

//		file copy
		try {
			Files.copy(file.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			throw e;
		}

		return newName;
	}

	public String getResource(String subFolder, String fileName) throws IOException {
		String imagePath = File.separator + "public" + File.separator + "images" + File.separator + subFolder
				+ File.separator + fileName;
//		System.out.println("last path : " + imagePath);
		return imagePath;
	}

}
