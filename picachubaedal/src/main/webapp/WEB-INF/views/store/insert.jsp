<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가게 등록 임시페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .cell {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="number"],
        textarea,
        input[type="file"] {
            width: calc(100% - 10px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>가게 등록</h2>
        <form action="insert" method="post" enctype="multipart/form-data" autocomplete="off" class="check-form">

            <div class="cell">
                <label for="storeName">* 가게이름:</label>
                <input type="text" id="storeName" name="storeName">
            </div>

            <div class="cell">
                <label for="storeAddress">* 주소:</label>
                <input type="text" id="storeAddress" name="storeAddress">
            </div>

            <div class="cell">
                <label for="storeCategory">* 음식 카테고리:</label>
                <input type="text" id="storeCategory" name="storeCategory">
            </div>

            <div class="cell">
                <label for="storeType">* 배달 or 포장:</label>
                <input type="text" id="storeType" name="storeType">
            </div>

            <div class="cell">
                <label for="storeContact">* 연락처:</label>
                <input type="text" id="storeContact" name="storeContact">
            </div>

            <div class="cell">
                <label for="storeImage">* 가게 사진:</label>
                <input type="file" id="storeImage" name="storeImage">
            </div>

            <div class="cell">
                <label for="storeIntro">* 가게 소개글:</label>
                <textarea id="storeIntro" name="storeIntro"></textarea>
            </div>

            <div class="cell">
                <label for="storeDtip">* 배달팁:</label>
                <input type="number" id="storeDtip" name="storeDtip">
            </div>

            <div class="cell">
                <label for="storeMinprice">* 최소 주문금액:</label>
                <input type="number" id="storeMinprice" name="storeMinprice">
            </div>

            <div class="cell">
                <label for="storeHours">* 가게 운영시간:</label>
                <input type="text" id="storeHours" name="storeHours">
            </div>

            <div class="cell">
                <label for="storeDelivery">* 배달 가능지역:</label>
                <input type="text" id="storeDelivery" name="storeDelivery">
            </div>

            <div class="cell">
                <label for="storeClosed">* 가게 휴무일:</label>
                <input type="text" id="storeClosed" name="storeClosed">
            </div>

            <button type="submit">가게 등록</button>
        </form>
    </div>
</body>

</html>
