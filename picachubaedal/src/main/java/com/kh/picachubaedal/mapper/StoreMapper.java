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
        dto.setStorePost(rs.getString("store_post"));
        dto.setStoreAddress1(rs.getString("store_address1"));
        dto.setStoreAddress2(rs.getString("store_address2"));
        dto.setStoreCategory(rs.getString("store_category"));
        dto.setStoreType(rs.getString("store_type"));
        dto.setStoreContact(rs.getString("store_contact"));
        dto.setStoreIntro(rs.getString("store_intro"));
        dto.setStoreDtip(rs.getInt("store_dtip"));
        dto.setStoreMinprice(rs.getInt("store_minprice"));
        dto.setStoreLike(rs.getInt("store_like"));
        dto.setStoreOpenHour(rs.getString("store_open_hour"));
        dto.setStoreCloseHour(rs.getString("store_close_hour"));
        dto.setStoreDelivery(rs.getString("store_delivery"));
        dto.setStoreClosed(rs.getString("store_closed"));
        dto.setStoreTime(rs.getDate("store_time"));
        dto.setStoreUpdate(rs.getDate("store_update"));
        dto.setStoreBusinessNumber(rs.getString("store_business_number"));
        dto.setMemberNo(rs.getInt("member_no"));
        //dto.setStoreImgLink(rs.getString("store_img_link"));

        return dto;
    }
}
