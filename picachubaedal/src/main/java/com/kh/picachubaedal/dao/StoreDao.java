package com.kh.picachubaedal.dao;

import java.util.List;

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

	// 수정 (가게 수정)
	public boolean update(StoreDto storeDto) {
	    String sql = "update store set "
	            + "store_name=?, store_address=?, store_category=?, store_type=?, store_contact=?, "
	            + "store_intro=?, store_dtip=?, store_minprice=?, store_hours=?, "
	            + "store_delivery=?, store_closed=? "; // store_image 제거
	    // store_image는 조건에 따라 추가되도록 함
	    Object[] data;
	    if (storeDto.getStoreImage() != null) {
	        sql += ", store_image=?"; // store_image가 null이 아닌 경우에만 추가
	        data = new Object[]{
	                storeDto.getStoreName(), storeDto.getStoreAddress(), storeDto.getStoreCategory(),
	                storeDto.getStoreType(), storeDto.getStoreContact(), 
	                storeDto.getStoreIntro(), storeDto.getStoreDtip(), storeDto.getStoreMinprice(),
	                storeDto.getStoreHours(), storeDto.getStoreDelivery(), storeDto.getStoreClosed(),
	                storeDto.getStoreImage(), // store_image 추가
	                storeDto.getStoreNo()
	        };
	    } else {
	        data = new Object[]{
	                storeDto.getStoreName(), storeDto.getStoreAddress(), storeDto.getStoreCategory(),
	                storeDto.getStoreType(), storeDto.getStoreContact(), 
	                storeDto.getStoreIntro(), storeDto.getStoreDtip(), storeDto.getStoreMinprice(),
	                storeDto.getStoreHours(), storeDto.getStoreDelivery(), storeDto.getStoreClosed(),
	                storeDto.getStoreNo()
	        };
	    }
	    sql += " where store_no=?"; // WHERE 조건 추가
	    return jdbcTemplate.update(sql, data) > 0;
	}



	// 삭제 (가게 삭제)
	public boolean delete(int storeNo) {
		String sql = "delete store where store_no = ?";
		Object[] data = { storeNo };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 목록, 검색
	public List<StoreDto> selectList() {
		String sql = "select * from store order by store_no asc";
		return jdbcTemplate.query(sql, storeMapper);
	}

	public List<StoreDto> selectList(String column, String keyword) {
		String sql = "select * from store " + "where instr(upper(" + column + "), upper(?)) > 0 " + "order by " + column
				+ " asc, store_no asc";
		Object[] data = {keyword};
		return jdbcTemplate.query(sql, storeMapper, data);
	}
	public StoreDto selectOne(int storeNo) {
	    String sql = "select * from store where store_no = ?";
	    Object[] data = { storeNo };
	    List<StoreDto> list = jdbcTemplate.query(sql, storeMapper, data);
	    return list.isEmpty() ? null : list.get(0);
	}

	
}
