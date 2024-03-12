package com.kh.picachubaedal.dto;

import java.sql.Date;

public class MenuDto {
	
	private int menuNo;
	private int storeNo;
	private String menuCategory;
	private String menuName;
	private int menuPrice;
	private String menuImage;
	private String menuState;
	private Date menuTime;
	private Date menuUpdate;
	
	
	public MenuDto() {
		super();
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getMenuCategory() {
		return menuCategory;
	}
	public void setMenuCategory(String menuCategory) {
		this.menuCategory = menuCategory;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getMenuImage() {
		return menuImage;
	}
	public void setMenuImage(String menuImage) {
		this.menuImage = menuImage;
	}
	public String getMenuState() {
		return menuState;
	}
	public void setMenuState(String menuState) {
		this.menuState = menuState;
	}
	public Date getMenuTime() {
		return menuTime;
	}
	public void setMenuTime(Date menuTime) {
		this.menuTime = menuTime;
	}
	public Date getMenuUpdate() {
		return menuUpdate;
	}
	public void setMenuUpdate(Date menuUpdate) {
		this.menuUpdate = menuUpdate;
	}
	
}
