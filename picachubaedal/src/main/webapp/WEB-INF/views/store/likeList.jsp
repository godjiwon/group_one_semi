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
            padding: 8px;
            width: 500px;
            display: inline-block;
            float: left;
        }
        .store-img {
            max-width: 100%;
            height: auto;
            float: left;
            margin-right: 10px; 
            margin: 10px;
           /* 이미지 오른쪽 여백 추가 */
        }
        .footer {
            clear: both; /* 푸터가 옆으로 나오는 것을 방지 */
        }
    </style>
</head>
<body>
<div class="container" >
    <div class="center">
        <h1>찜한 가게 목록</h1>
    </div>
    <c:if test="${not empty likeList}">
        <div class="cell">

            <c:forEach items="${likeList}" var="store">
                <div class="store-box" > 
                
                    <img class="store-img center" src="${imagePath}" style="width:160px; height:180px;">
                    <div>
                        <h2>${store.storeName}</h2>
                        <h4>${store.storeCategory}</h4> 
                        <h4>최소주문  ${store.storeMinprice}</h4>
                        <h4>배달팁 ${store.storeDtip}</h4>
                        <h4>휴무일 ${store.storeClosed}</h4> 
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
<div class="footer">
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</div>
</body>