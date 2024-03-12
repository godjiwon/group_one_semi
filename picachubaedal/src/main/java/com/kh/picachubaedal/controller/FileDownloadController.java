package com.kh.picachubaedal.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.picachubaedal.dao.AttachDao;
import com.kh.picachubaedal.dto.AttachDto;

@Controller
@RequestMapping("/download")
public class FileDownloadController {
	
	@Autowired
	private AttachDao attachDao;
	
	@RequestMapping
	@ResponseBody
	public ResponseEntity<ByteArrayResource> download(
			@RequestParam int attachNo) throws IOException {
		
		AttachDto attachDto = attachDao.selectOne(attachNo);
		
		if(attachDto == null) {
			//return ResponseEntity.status(404).build();
			return ResponseEntity.notFound().build();
		}
		
		File dir = new File(System.getProperty("user.home"), "upload");
		File target = new File(dir, String.valueOf(attachDto.getAttachNo()));
		
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_ENCODING, StandardCharsets.UTF_8.name())
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(attachDto.getAttachSize())
				.header(HttpHeaders.CONTENT_DISPOSITION, 
					ContentDisposition.attachment()
						.filename(attachDto.getAttachName(), StandardCharsets.UTF_8)
						.build().toString()
				)
				.body(resource);
	}

}
