package com.kh.picachubaedal.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.picachubaedal.dto.CartDto;
import com.kh.picachubaedal.mapper.CartMapper;

@Repository
public class CartDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private CartMapper cartMapper;

	public void insert(CartDto cartDto) {

		String sql = "insert into cart(cart_no, member_no, menu_no, " + "item_name, item_quantify, item_price) "
				+ "values(cart9_seq.nextval, ?, ?, ?, ?, ?)";
		Object[] data = { cartDto.getMemberNo(), cartDto.getMenuNo(), cartDto.getItemName(), cartDto.getItemQuantify(),
				cartDto.getItemPrice() };
		jdbcTemplate.update(sql, data);
	}
}