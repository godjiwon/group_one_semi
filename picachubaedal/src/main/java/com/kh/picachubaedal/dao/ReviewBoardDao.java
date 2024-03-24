package com.kh.picachubaedal.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.picachubaedal.dto.CartDto;
import com.kh.picachubaedal.dto.CertDto;
import com.kh.picachubaedal.dto.MemberDto;
import com.kh.picachubaedal.dto.ReviewBoardDto;
import com.kh.picachubaedal.mapper.ReviewBoardMapper;

@Repository
public class ReviewBoardDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private ReviewBoardMapper mapper;

	// 임시테스트용 listAll
	public List<ReviewBoardDto> listAll() {
		String sql = "select * from review_board order by review_board_no asc";

		return jdbcTemplate.query(sql, mapper);
	}

	// 등록
	public void insert(ReviewBoardDto dto) {
		String sql = "insert into review_board(review_board_no,review_board_writer, review_board_store_no,"
				+ " review_board_content) values(REVIEW_BOARD_SEQ.nextval,?, ?, ?)";
		Object[] data = { dto.getReviewBoardWriter(), dto.getReviewBoardStoreNo(), dto.getReviewBoardContent() };
		jdbcTemplate.update(sql, data);
	}

	// 가게번호 검색후 리스트
	public List<ReviewBoardDto> selectList(int storeNo) {

		String sql = "select * from review_board where review_board_store_no=? order by review_board_no DESC";
		Object[] data = { storeNo };
		return jdbcTemplate.query(sql, mapper, data);

	}
}