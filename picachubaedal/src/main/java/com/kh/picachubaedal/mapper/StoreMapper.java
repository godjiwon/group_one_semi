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
        // 이미지는 문자열 대신 MultipartFile로 설정
        // 이미지 데이터는 DB에서 가져오지 않으므로 이 부분을 수정해야 합니다.
        // 파일의 경로 또는 기타 파일 관련 정보를 DTO에 저장할 수 있어야 합니다.
        // 따라서 DB에서 이미지 경로를 가져와서 DTO에 설정하거나, 필요에 따라 처리해야 합니다.
        // 이 예시에서는 MultipartFile을 직접 설정하지 않습니다.
        // dto.setStoreImage(rs.getString("store_image")); 

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
