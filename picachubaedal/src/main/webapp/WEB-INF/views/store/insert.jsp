<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가게 등록</title>
</head>
<body>


    <h2>임시페이지로 전환</h2>
    <form action="insert" method="post" enctype="multipart/form-data" autocomplete="off" class="check-form">
        <div class="cell">
        
        
        <div class="cell">
            <label for="storeName">* 가게이름:</label><br>
            <input type="text" id="storeName" name="storeName"><br><br>
        </div>
        
        <div class="cell">
            <label for="storeAddress">* 주소:</label><br>
            <input type="text" id="storeAddress" name="storeAddress"><br><br>
        </div>
        
        <div class="cell">
            <label for="storeCategory">* 음식 카테고리:</label><br>
            <input type="text" id="storeCategory" name="storeCategory"><br><br>
        </div>
        
        <div class="cell">
            <label for="storeType">* 배달 or 포장:</label><br>
            <input type="text" id="storeType" name="storeType"><br><br>
        </div>
        
        <div class="cell">
            <label for="storeContact">* 연락처:</label><br>
            <input type="text" id="storeContact" name="storeContact"><br><br>
        </div>
        
         <div class="cell">
            <label for="storeImage">* 가게 사진:</label><br>
            <input type="file" id="storeImage" name="storeImage"><br><br>
        </div>
        
        
        
        <div class="cell">
            <label for="storeIntro">* 가게 소개글:</label><br>
            <textarea id="storeIntro" name="storeIntro" rows="4" cols="50"></textarea><br><br>
        </div>
        
        <div class="cell">
            <label for="storeDtip">* 배달팁:</label><br>
            <input type="number" id="storeDtip" name="storeDtip"><br><br>
        </div>
        
        <div class="cell">
            <label for="storeMinprice">* 최소 주문금액:</label><br>
            <input type="number" id="storeMinprice" name="storeMinprice"><br><br>
        </div>
        
       
        
        <div class="cell">
            <label for="storeHours">* 가게 운영시간:</label><br>
            <input type="text" id="storeHours" name="storeHours"><br><br>
        </div>
        
        <div class="cell">
            <label for="storeDelivery">* 배달 가능지역:</label><br>
            <input type="text" id="storeDelivery" name="storeDelivery"><br><br>
        </div>
        
        
        
        <div class="cell">
            <label for="storeClosed">* 가게 휴무일:</label><br>
            <input type="text" id="storeClosed" name="storeClosed"><br><br>
        </div>
        
        <button type="submit">가게 등록</button>
    </form>
</body>
</html>
