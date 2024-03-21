package com.kh.picachubaedal.logic;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.picachubaedal.dto.StoreDto;

import jakarta.servlet.http.HttpSession;

@Service
public class DistanceCalculator {

	@Autowired
	MapService mapService;

	private double calculateDistance(Location location1, Location location2) {
		final int R = 6371; // 지구의 반지름 (단위: km)
		double latDistance = Math
				.toRadians(Double.parseDouble(location2.getX()) - Double.parseDouble(location1.getX()));
		double lonDistance = Math
				.toRadians(Double.parseDouble(location2.getY()) - Double.parseDouble(location1.getY()));
		double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
				+ Math.cos(Math.toRadians(Double.parseDouble(location1.getX())))
						* Math.cos(Math.toRadians(Double.parseDouble(location2.getX()))) * Math.sin(lonDistance / 2)
						* Math.sin(lonDistance / 2);
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		double distance = R * c; // 거리 (단위: km)

		return distance;
	}

	public List<StoreDto> calculateDistanceBetweenAddresses(HttpSession session, List<StoreDto> list) {

		String userAddress = (String) session.getAttribute("memberAddress1");
		Location userLocation = mapService.getLocationFromAddress(userAddress);

		List<StoreDto> okList = new ArrayList<>();

		if (list == null || list.isEmpty()) {
			return okList;
		}

		for (StoreDto dto : list) {
			Location storeLocation = mapService.getLocationFromAddress(dto.getStoreAddress1());

			if (storeLocation == null) {
				// storeLocation이 null이면, 이 항목을 건너뛰고 다음 항목으로 이동
				continue;
			}

			double distance = calculateDistance(userLocation, storeLocation);

			if (distance <= 5.0) {
				dto.setUserDistance(distance);
				okList.add(dto);
			}
		}

		return okList;
	}
}
