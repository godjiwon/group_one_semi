package com.kh.picachubaedal.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import com.kh.picachubaedal.dto.StoreDto;

@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<StoreDto> getStoresByCategory(String category) {
        String sql = "SELECT * FROM store WHERE storeCategory = ?";
        return jdbcTemplate.query(sql, new Object[]{category}, (rs, rowNum) -> {
            StoreDto store = new StoreDto();
            store.setStoreNo(rs.getInt("storeNo"));
            store.setStoreName(rs.getString("storeName"));
            store.setStoreCategory(rs.getString("storeCategory"));
            // 나머지 필드도 동일하게 설정
            return store;
        });
    }
}
