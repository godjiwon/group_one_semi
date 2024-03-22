<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>찜한 가게 목록</title>
    <style>
        .store-card {
            width: 18rem;
            margin: 10px;
        }
        .store-img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="center">
        <h1>찜 목록</h1>
    </div>
    <c:if test="${not empty likeList}">
        <div class="row">
            <c:forEach items="${likeList}" var="store">
                <div class="col-md-4">
                    <div class="card store-card">
                        <img src="${imagePath}" class="card-img-top store-img" alt="${store.storeName}">
                        <div class="card-body">
                            <h5 class="card-title">${store.storeName}</h5>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item text-center">An item</li>
                            <li class="list-group-item text-center">음식 카테고리 : ${store.storeCategory}</li>
                            <li class="list-group-item text-center">최소주문금액 ${store.storeMinprice}원</li>
                            <li class="list-group-item text-center">배달팁 ${store.storeDtip}원</li>
                        </ul>
                        <div class="card-body">
                            <a href="#" class="card-link">Card link</a>
                            <a href="#" class="card-link">Another link</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${empty likeList}">
        <div class="center">
            <p>찜한 가게가 없습니다.</p>
        </div>
    </c:if>
</div>
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
