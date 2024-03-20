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

	//장바구니 등록
	public void insert(CartDto cartDto) {
		String sql = "insert into cart(cart_no, member_no, menu_no, " + "item_name, item_quantify, item_price) "
				+ "values(cart9_seq.nextval, ?, ?, ?, ?, ?)";
		Object[] data = { cartDto.getMemberNo(), cartDto.getMenuNo(), cartDto.getItemName(), cartDto.getItemQuantify(),
				cartDto.getItemPrice() };
		jdbcTemplate.update(sql, data);
	}
	
	//장바구니 목록
	public List<CartDto> selectList(){
        String sql = "select * from cart order by cart_no asc";
        return jdbcTemplate.query(sql, cartMapper);
    }
	
	//장바구니 삭제(테스트전용)
	public boolean delete(int cartNo) {
		String sql = "delete cart where cart_no=?";
		Object[] data = {cartNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
}