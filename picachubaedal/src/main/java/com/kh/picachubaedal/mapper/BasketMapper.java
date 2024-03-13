package com.kh.picachubaedal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.picachubaedal.dto.BasketDto;

@Service
public class BasketMapper implements RowMapper<BasketDto> {

	@Override
	public BasketDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		BasketDto basketDto = new BasketDto();
		basketDto.setBasketNo(rs.getInt("basket_no"));
		basketDto.setBasketCount(rs.getInt("basket_count"));
		basketDto.setBasketId(rs.getString("basket_id"));
		basketDto.setBasketOrder(rs.getInt("basket_order"));
		basketDto.setBasketStore(rs.getInt("basket_store"));
		basketDto.setBasketMenu(rs.getInt("basket_menu"));
		return basketDto;
	}

}
