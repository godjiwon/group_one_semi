package com.kh.picachubaedal.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class MapService {
	
	@Autowired
	private KakaoApiKeyProperties kakaoApiKeyProperties;
	
    private RestTemplate restTemplate;
    private String apiUrl = "https://dapi.kakao.com/v2/local/search/address.json";

    public MapService() {
        this.restTemplate = new RestTemplate();
    }

    public Location getLocationFromAddress(String address) {
    	String kakaoRestApiKey = kakaoApiKeyProperties.getKey();
    	
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "KakaoAK " + kakaoRestApiKey);
        HttpEntity<String> entity = new HttpEntity<>(headers);

        ResponseEntity<KakaoGeoResponse> response = restTemplate.exchange(
                apiUrl + "?query=" + address,
                HttpMethod.GET,
                entity,
                KakaoGeoResponse.class);

        KakaoGeoResponse body = response.getBody();
        if (body != null && !body.getDocuments().isEmpty()) {
            Document document = body.getDocuments().get(0);
            Location location = new Location();
            location.setX(document.getX());
            location.setY(document.getY());
            return location;
        } else {
            return null;
        }
    }
}