package com.kh.picachubaedal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.picachubaedal.dto.ReviewBoardDto;

@Service
public class ReviewBoardMapper implements RowMapper<ReviewBoardDto> {

	@Override
	public ReviewBoardDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReviewBoardDto reviewBoardDto = new ReviewBoardDto();
		
		reviewBoardDto.setReviewBoardNo(rs.getLong("review_board_no"));
		reviewBoardDto.setReviewBoardWriter(rs.getString("review_board_writer"));
		reviewBoardDto.setReviewBoardStoreNo(rs.getLong("review_board_store_no"));
		reviewBoardDto.setReviewBoardContent(rs.getString("review_board_content"));
		reviewBoardDto.setReviewBoardDate(rs.getDate("review_board_date"));
				
		return reviewBoardDto;
	}

}