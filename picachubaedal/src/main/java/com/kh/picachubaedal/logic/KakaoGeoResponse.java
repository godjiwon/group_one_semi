package com.kh.picachubaedal.logic;

import java.util.List;

public class KakaoGeoResponse {
    private List<Document> documents;

    // Getter와 Setter
    public List<Document> getDocuments() {
        return documents;
    }

    public void setDocuments(List<Document> documents) {
        this.documents = documents;
    }
}

class Document {
    private String address_name;
    private String x; // 경도
    private String y; // 위도

    // Getter와 Setter
    public String getAddress_name() {
        return address_name;
    }

    public void setAddress_name(String address_name) {
        this.address_name = address_name;
    }

    public String getX() {
        return x;
    }

    public void setX(String x) {
        this.x = x;
    }

    public String getY() {
        return y;
    }

    public void setY(String y) {
        this.y = y;
    }
}
