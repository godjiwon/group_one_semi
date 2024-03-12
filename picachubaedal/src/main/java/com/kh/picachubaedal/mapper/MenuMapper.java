package com.kh.picachubaedal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.picachubaedal.dto.MenuDto;

@Service
public class MenuMapper implements RowMapper<MenuDto>{

	@Override
	public MenuDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		MenuDto menuDto = new MenuDto();
		
		menuDto.setMenuNo(rs.getInt("menu_no"));
		menuDto.setStoreNo(rs.getInt("store_no"));
		menuDto.setMenuCategory(rs.getString("menu_category"));
		menuDto.setMenuName(rs.getString("menu_name"));
		menuDto.setMenuPrice(rs.getInt("menu_price"));
		menuDto.setMenuImage(rs.getString("menu_image"));
		menuDto.setMenuState(rs.getString("menu_state"));
		menuDto.setMenuTime(rs.getDate("menu_time"));
		menuDto.setMenuUpdate(rs.getDate("menu_update"));
		
		return menuDto;
	}

		
}
