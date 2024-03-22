package com.kh.picachubaedal.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class StoreDto {
	private int storeNo;
	private String storeName;
	private String storePost;
	private String storeAddress1;
	private String storeAddress2;
	private String storeCategory;
	private String storeType;
	private String storeContact;
	private String storeIntro;
	private int storeDtip;
	private int storeMinprice;
	private int storeLike;
	private String storeOpenHour;
	private String storeCloseHour;
	private String storeDelivery;
	private String storeClosed;
	private Date storeTime;
	private Date storeUpdate;
	private String storeBusinessNumber;
	private int memberNo;
	private String storeImgLink;
	private String memberId;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	private double UserDistance;

	public double getUserDistance() {

		return Math.round(UserDistance * 100.0) / 100.0;
	}

	public void setUserDistance(double userDistance) {
		UserDistance = userDistance;
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

	public String getStorePost() {
		return storePost;
	}

	public void setStorePost(String storePost) {
		this.storePost = storePost;
	}

	public String getStoreAddress1() {
		return storeAddress1;
	}

	public void setStoreAddress1(String storeAddress1) {
		this.storeAddress1 = storeAddress1;
	}

	public String getStoreAddress2() {
		return storeAddress2;
	}

	public void setStoreAddress2(String storeAddress2) {
		this.storeAddress2 = storeAddress2;
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

	public String getStoreOpenHour() {
		return storeOpenHour;
	}

	public void setStoreOpenHour(String storeOpenHour) {
		this.storeOpenHour = storeOpenHour;
	}

	public String getStoreCloseHour() {
		return storeCloseHour;
	}

	public void setStoreCloseHour(String storeCloseHour) {
		this.storeCloseHour = storeCloseHour;
	}

	public String getStoreDelivery() {
		return storeDelivery;
	}

	public void setStoreDelivery(String storeDelivery) {
		this.storeDelivery = storeDelivery;
	}

	public String getStoreClosed() {
		return storeClosed;
	}

	public void setStoreClosed(String storeClosed) {
		this.storeClosed = storeClosed;
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

	public String getStoreBusinessNumber() {
		return storeBusinessNumber;
	}

	public void setStoreBusinessNumber(String storeBusinessNumber) {
		this.storeBusinessNumber = storeBusinessNumber;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getStoreImgLink() {
		return storeImgLink;
	}

	public void setStoreImgLink(String storeImgLink) {
		this.storeImgLink = storeImgLink;
	}

	public StoreDto() {
		super();
	}

}