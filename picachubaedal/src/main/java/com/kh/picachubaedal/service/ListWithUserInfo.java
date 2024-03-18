package com.kh.picachubaedal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.picachubaedal.dao.MemberDao;
import com.kh.picachubaedal.dao.ReviewBoardDao;
import com.kh.picachubaedal.dto.ReviewBoardDto;

@Service
public class ListWithUserInfo {
	
	@Autowired
	private ReviewBoardDao reviewBoardDao;

	@Autowired
	private MemberDao memberDao; 
	
	
	public List<ReviewBoardDto> listWithUserInfo() {
	    List<ReviewBoardDto> list = reviewBoardDao.listAll();

	    for (ReviewBoardDto dto : list) {
	        String userImgLink = getUserImgLink(dto.getReviewBoardWriter()); 
	        String nickname = getNickname(dto.getReviewBoardWriter());

	        dto.setUserImgLink(userImgLink);
	        dto.setNickname(nickname);
	    }

	    return list;
	}
	
	
	public String getUserImgLink(String reviewBoardWriter) {		
		try {
			int attachNo = memberDao.findAttachNo(reviewBoardWriter);
			return "/download?attachNo=" + attachNo;
		}
		catch(Exception e) {
			return "/image/user.png"; 
		}
	}

	
	public String getNickname(String reviewBoardWriter) {
		String nickName = memberDao.findNick(reviewBoardWriter);
		return nickName;
	}
}


