package com.kh.picachubaedal.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StoreLikeDao {

	//[C] 좋아요 내역을 등록
		//[D] 좋아요 내역을 삭제
		//[R] 좋아요 여부를 확인
		//[R] 특정 글의 좋아요 개수를 확인
		@Autowired
		private JdbcTemplate jdbcTemplate;

		public void insert(String memberId, int storeNo) {
			String sql = "insert into store_like(member_id, store_no) values(?, ?)";
			Object[] data = {memberId, storeNo};
			jdbcTemplate.update(sql, data);
		}
		
		
		public boolean delete(String memberId, int storeNo) {
			String sql = "delete store_like where member_id = ? and store_no = ?";
			Object[] data = {memberId, storeNo};
			return jdbcTemplate.update(sql, data) > 0;
		}
		
		
		public boolean check(String memberId, int storeNo) {
			String sql = "select count(*) from store_like "
							+ "where member_id = ? and store_no = ?";
			Object[] data = {memberId, storeNo};
			int count = jdbcTemplate.queryForObject(sql, int.class, data);
			return count > 0;
		}
		public int count(int storeNo) {
			String sql = "select count(*) from store_like where store_no = ?";
			Object[] data = {storeNo};
			return jdbcTemplate.queryForObject(sql, int.class, data);
		}
}
