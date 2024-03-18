<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>가게 정보 수정 임시</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        form {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        h1 {
            text-align: center;
        }
        input[type="text"] {
            width: calc(100% - 20px);
            margin-bottom: 10px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h1>가게 정보 수정 임시</h1>

<form action="change" method="post">
    <input type="hidden" name="storeNo" value="${dto.storeNo}">
    
    <label for="storeName">가게 이름</label>
    <input type="text" id="storeName" name="storeName" value="${dto.storeName}">
    <br>
    
    <label for="storeAddress">가게 주소</label>
    <input type="text" id="storeAddress" name="storeAddress" value="${dto.storeAddress}">
    <br>
    
    <label for="storeCategory">음식 카테고리</label>
    <input type="text" id="storeCategory" name="storeCategory" value="${dto.storeCategory}">
    <br>
    
    <label for="storeType">배달/포장 여부</label>
    <input type="text" id="storeType" name="storeType" value="${dto.storeType}">
    <br>
    
    <label for="storeContact">연락처</label>
    <input type="text" id="storeContact" name="storeContact" value="${dto.storeContact}">
    <br>
    
    <label for="storeImage">가게 사진</label>
    <input type="text" id="storeImage" name="storeImage" value="${dto.storeImage}">
    <br>
    
    <label for="storeIntro">가게 소개글</label>
    <input type="text" id="storeIntro" name="storeIntro" value="${dto.storeIntro}">
    <br>
    
    <label for="storeDtip">배달팁</label>
    <input type="text" id="storeDtip" name="storeDtip" value="${dto.storeDtip}">
    <br>
    
    <label for="storeMinprice">최소 주문금액</label>
    <input type="text" id="storeMinprice" name="storeMinprice" value="${dto.storeMinprice}">
    <br>
    
    <label for="storeHours">가게 운영시간</label>
    <input type="text" id="storeHours" name="storeHours" value="${dto.storeHours}">
    <br>
    
    <label for="storeDelivery">배달 가능 지역</label>
    <input type="text" id="storeDelivery" name="storeDelivery" value="${dto.storeDelivery}">
    <br>
    
    <label for="storeClosed">가게 휴무일</label>
    <input type="text" id="storeClosed" name="storeClosed" value="${dto.storeClosed}">
    <br>
    
    <button type="submit">변경하기</button>
</form>

</body>
</html>
