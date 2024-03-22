package com.kh.picachubaedal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.picachubaedal.dto.StoreDto;

@Service
public class StoreListMapper implements RowMapper<StoreDto> {

	@Override
	public StoreDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		StoreDto storeDto = new StoreDto();

		storeDto.setStoreNo(rs.getInt("store_no"));
		storeDto.setStoreName(rs.getString("store_name"));
		storeDto.setStorePost(rs.getString("store_post"));
		storeDto.setStoreAddress1(rs.getString("store_address1"));
		storeDto.setStoreAddress2(rs.getString("store_address2"));
		storeDto.setStoreCategory(rs.getString("store_category"));
		storeDto.setStoreType(rs.getString("store_type"));
		storeDto.setStoreContact(rs.getString("store_contact"));
		storeDto.setStoreIntro(rs.getString("store_intro"));
		storeDto.setStoreDtip(rs.getInt("store_dtip"));
		storeDto.setStoreMinprice(rs.getInt("store_minprice"));
		storeDto.setStoreLike(rs.getInt("store_like"));
		storeDto.setStoreOpenHour(rs.getString("store_open_hour"));
		storeDto.setStoreCloseHour(rs.getString("store_close_hour"));
		storeDto.setStoreDelivery(rs.getString("store_delivery"));
		storeDto.setStoreClosed(rs.getString("store_closed"));
		storeDto.setStoreTime(rs.getDate("store_time"));
		storeDto.setStoreUpdate(rs.getDate("store_update"));
		storeDto.setStoreBusinessNumber(rs.getString("store_business_number"));
		storeDto.setMemberNo(rs.getInt("member_no"));
		return storeDto;
	}

}
