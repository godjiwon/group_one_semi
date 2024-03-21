package com.kh.picachubaedal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.picachubaedal.dto.StoreDto;

@Service
public class StoreLikeMapper implements RowMapper<StoreDto>{

	@Override
	public StoreDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		StoreDto dto = new StoreDto();
		dto.setStoreNo(rs.getInt("store_no"));
		dto.setMemberId(rs.getString("member_id"));
		return dto;
	}
	
	

}
