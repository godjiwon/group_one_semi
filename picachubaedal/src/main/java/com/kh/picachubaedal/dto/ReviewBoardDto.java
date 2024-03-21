package com.kh.picachubaedal.dto;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.picachubaedal.dao.MemberDao;

public class ReviewBoardDto {

	private long reviewBoardNo;
	private String reviewBoardWriter;
	private long reviewBoardStoreNo;
	private String reviewBoardContent;
	private Date reviewBoardDate;
	
	private String userImgLink;
    private String nickname;
	

		
	
	public String getUserImgLink() {
		return userImgLink;
	}


	public String getNickname() {
		return nickname;
	}


	public void setUserImgLink(String userImgLink) {
		this.userImgLink = userImgLink;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public ReviewBoardDto() {
		super();
	}
	
	
	public long getReviewBoardNo() {
		return reviewBoardNo;
	}
	public void setReviewBoardNo(long reviewBoardNo) {
		this.reviewBoardNo = reviewBoardNo;
	}
	public String getReviewBoardWriter() {
		return reviewBoardWriter;
	}
	public void setReviewBoardWriter(String reviewBoardWriter) {
		this.reviewBoardWriter = reviewBoardWriter;
	}
	public long getReviewBoardStoreNo() {
		return reviewBoardStoreNo;
	}
	public void setReviewBoardStoreNo(long reviewBoardStoreNo) {
		this.reviewBoardStoreNo = reviewBoardStoreNo;
	}
	public String getReviewBoardContent() {
		return reviewBoardContent;
	}
	public void setReviewBoardContent(String reviewBoardContent) {
		this.reviewBoardContent = reviewBoardContent;
	}
	public Date getReviewBoardDate() {
		return reviewBoardDate;
	}
	public void setReviewBoardDate(Date reviewBoardDate) {
		this.reviewBoardDate = reviewBoardDate;
	}
	
}