package com.kh.picachubaedal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.picachubaedal.dto.CartDto;

@Service
public class CartMapper implements RowMapper<CartDto> {

	@Override
	public CartDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		CartDto cartDto = new CartDto();
		cartDto.setCartNo(rs.getInt("cart_no"));
		cartDto.setCartCount(rs.getInt("cart_count"));
		cartDto.setMemberNo(rs.getInt("member_no"));
		cartDto.setStoreNo(rs.getInt("store_no"));
		cartDto.setStoreName(rs.getString("store_name"));
		cartDto.setMenuName(rs.getString("menu_name"));
		cartDto.setCartPrice(rs.getInt("cart_price"));
		return cartDto;
	}

}