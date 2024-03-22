package com.kh.picachubaedal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.picachubaedal.dto.OrdersDto;

@Service
public class OrdersMapper implements RowMapper<OrdersDto> {

	@Override
	public OrdersDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		OrdersDto ordersDto = new OrdersDto();
		ordersDto.setOrdersNo(rs.getInt("orders_no"));
		ordersDto.setMemberId(rs.getString("member_id"));
		ordersDto.setStoreNo(rs.getInt("store_no"));
		ordersDto.setOrdersItemName(rs.getString("orders_item_name"));
		ordersDto.setOrdersRequest(rs.getString("orders_request"));
		ordersDto.setOrdersType(rs.getString("orders_type"));
		ordersDto.setOrdersTotal(rs.getInt("orders_total"));
		ordersDto.setOrdersPay(rs.getString("orders_pay"));
		ordersDto.setOrdersDate(rs.getDate("orders_date"));
		return ordersDto;
	}
}