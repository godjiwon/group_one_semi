package com.kh.picachubaedal.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.picachubaedal.dao.StoreDao;
import com.kh.picachubaedal.dto.StoreDto;

@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    private StoreDao storeDao;

//    @Override
//    public List<StoreDto> getStoresByCategory(String category) {
//        return storeDao.getStoresByCategory(category);
//    }

    @Override
    public List<StoreDto> searchStoresByMenuName(String menuName) {
        return storeDao.searchStoresByMenuName(menuName);
    }

	@Override
	public List<StoreDto> getStoresByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}
}
