package com.kh.picachubaedal.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class StoreDto {
	private int storeNo;
	private String storeName;
	private String StoreAddress;
	private String storeCategory;
	private String storeType;
	private String storeContact;
	private MultipartFile storeImage;
	private String storeIntro;
	private int storeDtip;
	private int storeMinprice;
	private int storeLike;
	private String storeHours;
	private String storeDelivery;
	private Date storeTime;
	private Date storeUpdate;
	private String storeClosed;
	
	
	
	public StoreDto() {
		
		super();
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreAddress() {
		return StoreAddress;
	}

	public void setStoreAddress(String storeAddress) {
		StoreAddress = storeAddress;
	}

	public String getStoreCategory() {
		return storeCategory;
	}

	public void setStoreCategory(String storeCategory) {
		this.storeCategory = storeCategory;
	}

	public String getStoreType() {
		return storeType;
	}

	public void setStoreType(String storeType) {
		this.storeType = storeType;
	}

	public String getStoreContact() {
		return storeContact;
	}

	public void setStoreContact(String storeContact) {
		this.storeContact = storeContact;
	}

	public MultipartFile getStoreImage() {
		return storeImage;
	}

	public void MultipartFile(MultipartFile storeImage) {
		this.storeImage = storeImage;
	}

	public String getStoreIntro() {
		return storeIntro;
	}

	public void setStoreIntro(String storeIntro) {
		this.storeIntro = storeIntro;
	}

	public int getStoreDtip() {
		return storeDtip;
	}

	public void setStoreDtip(int storeDtip) {
		this.storeDtip = storeDtip;
	}

	public int getStoreMinprice() {
		return storeMinprice;
	}

	public void setStoreMinprice(int storeMinprice) {
		this.storeMinprice = storeMinprice;
	}

	public int getStoreLike() {
		return storeLike;
	}

	public void setStoreLike(int storeLike) {
		this.storeLike = storeLike;
	}

	public String getStoreHours() {
		return storeHours;
	}

	public void setStoreHours(String storeHours) {
		this.storeHours = storeHours;
	}

	public String getStoreDelivery() {
		return storeDelivery;
	}

	public void setStoreDelivery(String storeDelivery) {
		this.storeDelivery = storeDelivery;
	}

	public Date getStoreTime() {
		return storeTime;
	}

	public void setStoreTime(Date storeTime) {
		this.storeTime = storeTime;
	}

	public Date getStoreUpdate() {
		return storeUpdate;
	}

	public void setStoreUpdate(Date storeUpdate) {
		this.storeUpdate = storeUpdate;
	}

	public String getStoreClosed() {
		return storeClosed;
	}

	public void setStoreClosed(String storeClosed) {
		this.storeClosed = storeClosed;
	}
	
	

}
