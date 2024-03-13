package com.kh.picachubaedal.dto;

import java.sql.Date;

public class OrderListDto {
	private int orderListNo;
	private int orderListStore;
	private String orderListId;
	private String orderListPay;
	private int orderListTotalprice;
	private String orderListRequest;
	private Date orderListTime;
	public OrderListDto() {
		super();
	}
	public int getOrderListNo() {
		return orderListNo;
	}
	public void setOrderListNo(int orderListNo) {
		this.orderListNo = orderListNo;
	}
	public int getOrderListStore() {
		return orderListStore;
	}
	public void setOrderListStore(int orderListStore) {
		this.orderListStore = orderListStore;
	}
	public String getOrderListId() {
		return orderListId;
	}
	public void setOrderListId(String orderListId) {
		this.orderListId = orderListId;
	}
	public String getOrderListPay() {
		return orderListPay;
	}
	public void setOrderListPay(String orderListPay) {
		this.orderListPay = orderListPay;
	}
	public int getOrderListTotalprice() {
		return orderListTotalprice;
	}
	public void setOrderListTotalprice(int orderListTotalprice) {
		this.orderListTotalprice = orderListTotalprice;
	}
	public String getOrderListRequest() {
		return orderListRequest;
	}
	public void setOrderListRequest(String orderListRequest) {
		this.orderListRequest = orderListRequest;
	}
	public Date getOrderListTime() {
		return orderListTime;
	}
	public void setOrderListTime(Date orderListTime) {
		this.orderListTime = orderListTime;
	}
	
}
