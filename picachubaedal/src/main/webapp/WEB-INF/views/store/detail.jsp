<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>가게 정보 상세 임시</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
        th {
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="container w-500">
        <div class="cell center">
            <h1>제목</h1>
        </div>
        <div class="cell">
            <h1>가게 정보 상세 임시</h1>
            <table>
                <tr>
                    <th width="35%">항목</th>
                    <th>정보</th>
                </tr>
                <tr>
                    <td>가게 번호</td>
                    <td>${dto.storeNo}</td>
                </tr>
                <tr>
                    <td>가게 이름</td>
                    <td>${dto.storeName}</td>
                </tr>
                <tr>
                    <td>가게 주소</td>
                    <td>${dto.storeAddress}</td>
                </tr>
                <tr>
                    <td>음식 카테고리</td>
                    <td>${dto.storeCategory}</td>
                </tr>
                <tr>
                    <td>배달/포장 여부</td>
                    <td>${dto.storeType}</td>
                </tr>
                <tr>
                    <td>가게 연락처</td>
                    <td>${dto.storeContact}</td>
                </tr>
                <tr>
                    <td>가게 사진</td>
                    <td>${dto.storeImage}</td>
                </tr>
                <tr>
                    <td>가게 소개글</td>
                    <td>${dto.storeIntro}</td>
                </tr>
                <tr>
                    <td>배달팁</td>
                    <td>${dto.storeDtip}</td>
                </tr>
                <tr>
                    <td>최소 주문금액</td>
                    <td>${dto.storeMinprice}</td>
                </tr>
                <tr>
                    <td>찜(좋아요)</td>
                    <td>${dto.storeLike}</td>
                </tr>
                <tr>
                    <td>가게 운영시간</td>
                    <td>${dto.storeHours}</td>
                </tr>
                <tr>
                    <td>배달 가능지역</td>
                    <td>${dto.storeDelivery}</td>
                </tr>
                <tr>
                    <td>가게 생성일</td>
                    <td>${dto.storeTime}</td>
                </tr>
                <tr>
                    <td>가게 정보 수정일</td>
                    <td>${dto.storeTime}</td>
                </tr>
                <tr>
                    <td>휴무일</td>
                    <td>${dto.storeClosed}</td>
                </tr>
            </table>
            <form action="/store/change" method="get">
                <input type="hidden" name="storeNo" value="${dto.storeNo}">
                <button type="submit">수정하기</button>
            </form>
        </div>
    </div>
</body>
</html>
