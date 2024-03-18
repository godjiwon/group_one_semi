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
	
	//장바구니 추가
	public void add(CartDto cartDto) {
		String sql = "insert into cart("
				+ "cart_no, cart_count, member_no, menu_no, "
				+ "store_no, store_name, menu_name, cart_price) "
				+ "values(cart_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
		Object[] data = {
				cartDto.getCartNo(), cartDto.getMemberNo(),
				cartDto.getMenuNo(), cartDto.getStoreNo(),
				cartDto.getStoreName(), cartDto.getMenuName(),
				cartDto.getCartPrice()
		};
		jdbcTemplate.update(sql, data);
	}
	
	//장바구니 목록
	public List<CartDto> selectList(){
		String sql = "select * from cart";
		return jdbcTemplate.query(sql, cartMapper);
	}
}