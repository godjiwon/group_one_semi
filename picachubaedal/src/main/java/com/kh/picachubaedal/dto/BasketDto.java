package com.kh.picachubaedal.dto;

public class BasketDto {
	private int basketNo;
	private int basketCount;
	private String basketId;
	private int basketOrder;
	private int basketStore;
	private int basketMenu;
	public BasketDto() {
		super();
	}
	public int getBasketNo() {
		return basketNo;
	}
	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
	}
	public int getBasketCount() {
		return basketCount;
	}
	public void setBasketCount(int basketCount) {
		this.basketCount = basketCount;
	}
	public String getBasketId() {
		return basketId;
	}
	public void setBasketId(String basketId) {
		this.basketId = basketId;
	}
	public int getBasketOrder() {
		return basketOrder;
	}
	public void setBasketOrder(int basketOrder) {
		this.basketOrder = basketOrder;
	}
	public int getBasketStore() {
		return basketStore;
	}
	public void setBasketStore(int basketStore) {
		this.basketStore = basketStore;
	}
	public int getBasketMenu() {
		return basketMenu;
	}
	public void setBasketMenu(int basketMenu) {
		this.basketMenu = basketMenu;
	}
	
}
