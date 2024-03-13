package com.kh.picachubaedal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.picachubaedal.dto.StoreDto;

@Service
public class StoreMapper implements RowMapper<StoreDto> {

    @Override
    public StoreDto mapRow(ResultSet rs, int idx) throws SQLException {
        StoreDto dto = new StoreDto();
        dto.setStoreNo(rs.getInt("store_no"));
        dto.setStoreName(rs.getString("store_name"));
        dto.setStoreAddress(rs.getString("store_address"));
        dto.setStoreCategory(rs.getString("store_category"));
        dto.setStoreType(rs.getString("store_type"));
        dto.setStoreContact(rs.getString("store_contact"));
        dto.setStoreImage(rs.getString("store_image")); // 이미지 파일의 경로를 문자열로 설정

        dto.setStoreIntro(rs.getString("store_intro"));
        dto.setStoreDtip(rs.getInt("store_dtip"));
        dto.setStoreMinprice(rs.getInt("store_minprice"));
        dto.setStoreLike(rs.getInt("store_like"));
        dto.setStoreHours(rs.getString("store_hours"));
        dto.setStoreDelivery(rs.getString("store_delivery"));
        dto.setStoreTime(rs.getDate("store_time"));
        dto.setStoreUpdate(rs.getDate("store_update"));
        dto.setStoreClosed(rs.getString("store_closed"));
        
        return dto;
    }
}
