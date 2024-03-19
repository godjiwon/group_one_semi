package com.kh.picachubaedal.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.picachubaedal.dto.MemberDto;
import com.kh.picachubaedal.dto.ReviewBoardDto;
import com.kh.picachubaedal.mapper.ReviewBoardMapper;

@Repository
public class ReviewBoardDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private ReviewBoardMapper mapper;
	
	
	//임시테스트용  listAll
	public List<ReviewBoardDto> listAll() {
		String sql = "select * from review_board order by review_board_no asc";
				
		return jdbcTemplate.query(sql, mapper);
	}
}