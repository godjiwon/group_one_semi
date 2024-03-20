package com.kh.picachubaedal.service;

import java.util.List;
import com.kh.picachubaedal.dto.StoreDto;

public interface StoreService {
    List<StoreDto> getStoresByCategory(String category);
}
