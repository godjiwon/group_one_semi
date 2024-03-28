package com.kh.picachubaedal.dto;

import java.sql.Date;

public class OrdersDto {

	private int ordersNo;
	private String memberId;
	private int storeNo;
	private String ordersItemName;
	private String ordersRequest;
	private String ordersType;
	private int ordersTotal;
	private String ordersPay;
	private Date ordersDate;
	
	private int total;
	private int storeDtip;
	private String storeName;
	private String purchaseList;
	
	private String storeImageLink;
	private int storeMinprice;
	
	
	
	public int getStoreMinprice() {
		return storeMinprice;
	}
	public void setStoreMinprice(int storeMinprice) {
		this.storeMinprice = storeMinprice;
	}
	public String getStoreImageLink() {
		return storeImageLink;
	}
	public void setStoreImageLink(String storeImageLink) {
		this.storeImageLink = storeImageLink;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getStoreDtip() {
		return storeDtip;
	}
	public void setStoreDtip(int storeDtip) {
		this.storeDtip = storeDtip;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getPurchaseList() {
		return purchaseList;
	}
	public void setPurchaseList(String purchaseList) {
		this.purchaseList = purchaseList;
	}
	public OrdersDto() {
		super();
	}
	public int getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getOrdersItemName() {
		return ordersItemName;
	}
	public void setOrdersItemName(String ordersItemName) {
		this.ordersItemName = ordersItemName;
	}
	public String getOrdersRequest() {
		return ordersRequest;
	}
	public void setOrdersRequest(String ordersRequest) {
		this.ordersRequest = ordersRequest;
	}
	public String getOrdersType() {
		return ordersType;
	}
	public void setOrdersType(String ordersType) {
		this.ordersType = ordersType;
	}
	public int getOrdersTotal() {
		return ordersTotal;
	}
	public void setOrdersTotal(int ordersTotal) {
		this.ordersTotal = ordersTotal;
	}
	public String getOrdersPay() {
		return ordersPay;
	}
	public void setOrdersPay(String ordersPay) {
		this.ordersPay = ordersPay;
	}
	public Date getOrdersDate() {
		return ordersDate;
	}
	public void setOrdersDate(Date ordersDate) {
		this.ordersDate = ordersDate;
	}
	
	
}
