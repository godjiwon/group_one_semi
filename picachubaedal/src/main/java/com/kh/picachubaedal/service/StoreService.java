package com.kh.picachubaedal.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.kh.picachubaedal.dto.StoreDto;

@Service
public interface StoreService {

    List<StoreDto> getStoresByCategory(String category);

    List<StoreDto> searchStoresByMenuName(String menuName);

}

