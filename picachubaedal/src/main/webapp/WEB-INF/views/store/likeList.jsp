<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>찜한 가게 목록</title>
    <style>
        .store-box {
            border: 1px solid #ccc;
            margin: 10px;
            padding: 10px;
            width: 500px;
            display: inline-block;
            float: left;
        }
        .store-img {
            max-width: 100%;
            height: auto;
            float: left;
            margin-right: 10px; 
           /* 이미지 오른쪽 여백 추가 */
        }
    </style>
</head>
<body>
<div class="container">
    <h1>찜한 가게 목록</h1>
    <c:if test="${not empty likeList}">
        <div class="cell">

            <c:forEach items="${likeList}" var="store">
                <div class="store-box" > 
                     <img class="store-img" src="${imagePath}" style="width:150px; height:150px;">
                    <div>
                        <h3>${store.storeName}</h3>
                        <p>${store.storeCategory}</p> 
                        <p>최소주문  ${store.storeMinprice}</p>
                        <p>배달팁 ${store.storeDtip}</p> 
                    </div>
                </div> 
            </c:forEach>
        </div>
    </c:if>
    <div>
    <c:if test="${empty likeList}">
        <p>찜한 가게가 없습니다.</p>
    </c:if>
    </div>
    </div>
</body>
</html><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>