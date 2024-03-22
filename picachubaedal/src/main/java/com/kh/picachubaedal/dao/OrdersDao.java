package com.kh.picachubaedal.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.picachubaedal.dto.OrdersDto;
import com.kh.picachubaedal.mapper.OrdersMapper;

@Repository
public class OrdersDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private OrdersMapper ordersMapper;

	// 가게번호받고 가게 배달팁반환
	public int getStoreDtip(int storeNo) {

		String sql = "select store_dtip from store where store_no = ?";
		Object[] data = { storeNo };
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}

	// 구매 등록
	public void insert(OrdersDto ordersDto) {
		String sql = "insert into orders(orders_no, member_id, store_no, orders_item_name, "
				+ "orders_request, orders_type, orders_total, orders_pay) "
				+ "values(orders_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
		Object[] data = { ordersDto.getMemberId(), ordersDto.getStoreNo(), ordersDto.getOrdersItemName(),
				ordersDto.getOrdersRequest(), ordersDto.getOrdersType(), ordersDto.getOrdersTotal(),
				ordersDto.getOrdersPay() };
		jdbcTemplate.update(sql, data);
	}

	// 회원의 구매내역 출력
	public List<OrdersDto> userOrderList(String memberId) {
		String sql = "select * from orders where member_id=? order by orders_no desc";
		Object[] data = { memberId };
		return jdbcTemplate.query(sql, ordersMapper, data);
	}
}
