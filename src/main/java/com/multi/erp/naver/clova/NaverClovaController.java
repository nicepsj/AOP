package com.multi.erp.naver.clova;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

@Controller
public class NaverClovaController {
	//파일업로드 되는 영수증에서 필요한 정보를 추출해서 리턴 - ocr서비스 사용후 결과를 뷰로 보내기
	@RequestMapping(value="/naverclova/ocr",produces = "application/text;charset=utf-8")
	@ResponseBody
	public String ocrtest(NCPCloverOcrDTO dto,Model model,HttpSession session) 
								throws IllegalStateException, IOException 	{
		System.out.println("test=>"+dto);
		//전달받은 dto에서 MultiPartFile객체를 꺼내서 파일업로드
		MultipartFile file = dto.getFile();
		String originalFilename = file.getOriginalFilename();
		String storeFilename = createStoreFilename(originalFilename); 
		String path =
				WebUtils.getRealPath(session.getServletContext(), "/WEB-INF/upload");
		System.out.println(path);
		file.transferTo(new File(path+File.separator+storeFilename));
		
		//OCR서비스와 연결
		String result = OCRUtil.getJsonText(path+File.separator+storeFilename);
		System.out.println("=========================================");
		System.out.println(result);
		System.out.println("=========================================");
		return result;
	}
	private String createStoreFilename(String originalFilename) {
		int pos = originalFilename.lastIndexOf(".");
		String ext = originalFilename.substring(pos+1);
		String uuid = UUID.randomUUID().toString();
		return uuid+"."+ext;
	}
}








