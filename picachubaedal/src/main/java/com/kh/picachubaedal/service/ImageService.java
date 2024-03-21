package com.kh.picachubaedal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.picachubaedal.dao.StoreDao;
import com.kh.picachubaedal.dto.ReviewBoardDto;
import com.kh.picachubaedal.dto.StoreDto;

@Service
public class ImageService {

	@Autowired
	private StoreDao storeDao;
	
	//attachNo찾은후 가게사진주소 반환
	public String getStoreImgLink(int storeNo) {
		
		try {
			int attachNo = storeDao.findAttachNo(storeNo);
			return "/download?attachNo=" + attachNo;
		}
		catch(Exception e) {
			return "/image/store.png"; 
		}
	}
	
	//가게리스트에 사진주소세팅
	public List<StoreDto> storePhotoUrlSetUp(List<StoreDto> storeDto){
		List<StoreDto> list = storeDto;
		
		for (StoreDto dto : list) {
	        String StoreImgLink = getStoreImgLink(dto.getStoreNo());
	        dto.setStoreImgLink(StoreImgLink);
	    }
		
		return list;
	}
	
	
	
	
}