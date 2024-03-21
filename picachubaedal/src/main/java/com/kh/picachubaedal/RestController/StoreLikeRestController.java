package com.kh.picachubaedal.RestController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.picachubaedal.dao.StoreLikeDao;
import com.kh.picachubaedal.vo.LikeVO;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/rest/store_like")
public class StoreLikeRestController {
	@Autowired
	private StoreLikeDao storeLikeDao;
	
	
	@RequestMapping("/check")
	public LikeVO check (
			HttpSession session, @RequestParam int storeNo) {
		String loginId = (String)session.getAttribute("loginId");
		
		LikeVO likeVO = new LikeVO();
		likeVO.setState(storeLikeDao.check(loginId, storeNo));
		likeVO.setCount(storeLikeDao.count(storeNo));
		
		return likeVO;
		
	}
		@RequestMapping("/toggle")
		public LikeVO toggle(
				HttpSession session, @RequestParam int storeNo) {
			String loginId = (String)session.getAttribute("loginId");
			
			LikeVO likeVO = new LikeVO();
			if(storeLikeDao.check(loginId, storeNo)) {//좋아요 누른적 있으면
				storeLikeDao.delete(loginId, storeNo);//좋아요 취소
				likeVO.setState(false);
			}
			else {
				storeLikeDao.insert(loginId, storeNo);//좋아요 설정
				likeVO.setState(true);
			}
			//바뀐 좋아요 개수 확인
			likeVO.setCount(storeLikeDao.count(storeNo));
			
			return likeVO;
		}
	}

