package com.kh.picachubaedal.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.picachubaedal.dao.AttachDao;
import com.kh.picachubaedal.dto.AttachDto;

@Service
public class AttachService {
	
	@Autowired
	private AttachDao attachDao;
	
	//서버에 파일저장 + db에 attach 데이터 저장
	public int save(MultipartFile attach) throws IllegalStateException, IOException {
		int attachNo = attachDao.getSequence();
		File dir = new File(System.getProperty("user.home"), "kh13A");
		dir.mkdirs();
		File target = new File(dir, String.valueOf(attachNo));
		attach.transferTo(target);
		
		AttachDto attachDto = new AttachDto();
		attachDto.setAttachNo(attachNo);
		attachDto.setAttachName(attach.getOriginalFilename());
		attachDto.setAttachType(attach.getContentType());
		attachDto.setAttachSize(attach.getSize());
		attachDao.insert(attachDto);//DB저장
		
		return attachNo;
	}
	

}
