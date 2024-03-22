package com.kh.picachubaedal.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrdersDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 가게번호받고 가게 배달팁반환
	public int getStoreDtip(int storeNo) {

		String sql = "select store_dtip from store where store_no = ?";
		Object[] data = { storeNo };
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}
}
