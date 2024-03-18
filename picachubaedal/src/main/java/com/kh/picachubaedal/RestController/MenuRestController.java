package com.kh.picachubaedal.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.picachubaedal.dao.MenuDao;
import com.kh.picachubaedal.dao.StoreDao;
import com.kh.picachubaedal.dto.MenuDto;
import com.kh.picachubaedal.dto.StoreDto;
import com.kh.picachubaedal.service.AttachService;
import com.kh.picachubaedal.vo.PageVO;

import jakarta.servlet.http.HttpSession;


@CrossOrigin
@RestController
@RequestMapping("/rest/menu")
public class MenuRestController {

   @Autowired
   private MenuDao menuDao;
   
   @Autowired
   private AttachService attachService;
   
   @Autowired
   private StoreDao storeDao;
   
   
   @PostMapping("/restList")
   public Map<String, Object> restList(@RequestBody PageVO pageVO, HttpSession session) throws Exception {
	   Map<String, Object> map = new HashMap<String, Object>();
	   // 테스트 데이터 storeNo 3번
	   int storeNo = 3;
	   //가게이름 가져오기
	   StoreDto storeDto = storeDao.selectOne(storeNo);
	   map.put("storeDto", storeDto);
	   //	세부 계산은 클래서에서 수행/ count(설정해주지 않으면 페이지가 끝나지 않음), list만 처리 
	   int count = menuDao.count(pageVO);
	   pageVO.setCount(count);
	   map.put("pageVO", pageVO);
	   List<MenuDto> list = menuDao.selectListByPaging(pageVO, storeNo);
	   
	   map.put("list", list);
	   // storeNo를 모델에 추가
	   map.put("storeNo", storeNo);
	   return map;
   }
   
   
}