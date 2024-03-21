package com.kh.picachubaedal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.picachubaedal.dao.CartDao;
import com.kh.picachubaedal.dto.CartDto;
import com.kh.picachubaedal.dto.StoreDto;

@Service
public class CartService {

	@Autowired
	private CartDao cartDao;
	
	//메뉴번호받고 가게번호 반환
	public int getStoreNo(int menuNo) {
		
		int storeNo = cartDao.getStoreNo(menuNo);
		return storeNo;
	}
	
	//가게번호받고 가게이름반환
	public String getStoreName(int storeNo) {
		
		String storeName = cartDao.getStoreName(storeNo);
		return storeName;
	}
	
	//list에 가게이름세팅
	public List<CartDto> setStoreNames(List<CartDto> CartDto){
		List<CartDto> list = CartDto;
		
		for (CartDto dto : list) {
			int storeNo = getStoreNo(dto.getMenuNo());
			String storeName = getStoreName(storeNo);
			
			dto.setStoreName(storeName);
	    }
		return list;
	}
}



