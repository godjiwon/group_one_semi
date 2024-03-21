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
	
	//장바구니 목록 -- 임시
	public List<CartDto> selectList(){
        String sql = "select * from cart order by cart_no asc";
        return jdbcTemplate.query(sql, cartMapper);
    }
	
	//장바구니 개별 삭제 -- 임시
	public boolean delete(int cartNo) {
		String sql = "delete cart where cart_no=?";
		Object[] data = {cartNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	//장바구니 전체 삭제 -- 임시
	public void deleteAll() {
		String sql = "delete from cart";
		jdbcTemplate.update(sql);
	}
	
	//유저번호검색한 장바구니리스트
	public List<CartDto> userCart(int memberNo){
		
        String sql = "select * from cart where member_no=? order by cart_no asc";
        Object[] data = {memberNo};
        return jdbcTemplate.query(sql, cartMapper ,data);
		
	}
}