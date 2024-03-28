package com.kh.picachubaedal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.picachubaedal.dao.CartDao;
import com.kh.picachubaedal.dao.OrdersDao;
import com.kh.picachubaedal.dto.CartDto;
import com.kh.picachubaedal.dto.OrdersDto;

@Service
public class OrdersService {

	@Autowired
	private CartDao cartDao;
	@Autowired
	private OrdersDao ordersDao;
	@Autowired
	private ImageService imageService;

	// 메뉴번호받고 가게번호 반환
	public int getStoreNo(int menuNo) {

		int storeNo = cartDao.getStoreNo(menuNo);
		return storeNo;
	}

	// 가게번호받고 가게이름 반환
	public String getStoreName(int storeNo) {

		String storeName = cartDao.getStoreName(storeNo);
		return storeName;
	}

	// 가게번호받고 가게 배달팁 반환
	public int getStoreDtip(int storeNo) {

		int storeDtip = ordersDao.getStoreDtip(storeNo);
		return storeDtip;
	}
	
	//가게 번호 받고 최소주문금액 반환
    public int getStoreMinprice(int storeNo) {
        int storeMinprice = ordersDao.getStoreMinprice(storeNo);
        return storeMinprice;
    }

	// 아이템가격계산
	public int itemTotalPrice(List<CartDto> list) {
		int total = 0;
		for(CartDto dto : list) {
			total += (dto.getItemPrice() * dto.getItemQuantify());
		}
		return total;
	}
	
	//구매목록 문자열추가
	public String purchaseList(List<CartDto> list) {
		StringBuilder purchaseList = new StringBuilder();
		
		for(CartDto dto : list) {
			purchaseList.append(dto.getItemName()).append(" ")
			.append("수량 : ").append(dto.getItemQuantify()).append("   ");
		}
		return purchaseList.toString();
	}
	
	public OrdersDto setOrdersDto(List<CartDto> list) {
		OrdersDto finalOrders = new OrdersDto();
		
		//가게이름dto에 세팅
		int storeNo = getStoreNo(list.get(0).getMenuNo());
		String storeName = getStoreName(storeNo);
		finalOrders.setStoreName(storeName);
		finalOrders.setStoreNo(storeNo);
		
		//주문목록 세팅
		String purchaseList = purchaseList(list);
		finalOrders.setPurchaseList(purchaseList);
		
		//배달팁 set
		int storeDtip = getStoreDtip(storeNo);
		finalOrders.setStoreDtip(storeDtip);
		
		//최소주문금액 set
		int storeMinprice = getStoreMinprice(storeNo);
		finalOrders.setStoreMinprice(storeMinprice);
		
		//최종가격 set
		int totalPrice = 0;
		totalPrice += itemTotalPrice(list);
		totalPrice += storeDtip;
		
		finalOrders.setTotal(totalPrice);
		
		return finalOrders;
	}
	
	public List<OrdersDto> orderHistorySet(List<OrdersDto> list){
		List<OrdersDto> setUpList = list;
		
		for(OrdersDto dto : setUpList) {
			String imageLink = imageService.getStoreImgLink(dto.getStoreNo());
			dto.setStoreImageLink(imageLink);
			
			String storeName = getStoreName(dto.getStoreNo());
			dto.setStoreName(storeName);
		}
		
		return setUpList;
	}

}
