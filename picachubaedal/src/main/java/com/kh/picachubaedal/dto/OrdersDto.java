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
