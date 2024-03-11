package com.kh.picachubaedal.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.picachubaedal.dto.StoreDto;
import com.kh.picachubaedal.mapper.StoreMapper;

@Repository
public class StoreDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private StoreMapper storeMapper;

	// 등록 (가게 등록)
	public void insert(StoreDto storeDto) {
		String sql = "insert into store(store_no, store_name, store_address, store_category, "
				+ "store_type, store_contact, store_image, store_intro, store_dtip, store_minprice, "
				+ "store_like, store_hours, store_delivery, store_time, store_update, store_closed"
				+ ") values(store_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, NULL, NULL)";
		Object[] data = { storeDto.getStoreName(), storeDto.getStoreAddress(), storeDto.getStoreCategory(),
				storeDto.getStoreType(), storeDto.getStoreContact(), storeDto.getStoreImage(), storeDto.getStoreIntro(),
				storeDto.getStoreDtip(), storeDto.getStoreMinprice(), storeDto.getStoreLike(), storeDto.getStoreHours(),
				storeDto.getStoreDelivery() };
		jdbcTemplate.update(sql, data);
	}

}
