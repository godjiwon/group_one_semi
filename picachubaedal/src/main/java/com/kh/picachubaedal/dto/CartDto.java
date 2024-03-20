package com.kh.picachubaedal.dto;

public class CartDto {

	private int cartNo;
	private int memberNo;
	private int menuNo;
	private String itemName;
	private int itemPrice;
	private int itemQuantify;

	
	
	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	public CartDto() {
		super();
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getItemQuantify() {
		return itemQuantify;
	}

	public void setItemQuantify(int itemQuantify) {
		this.itemQuantify = itemQuantify;
	}

}
