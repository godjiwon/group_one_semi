<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
    .btn {
        background-color: rgb(254, 210, 61);
        color: black;
        padding: 10px 20px;
        font-size: 16px;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .btn:hover {
        background-color: rgb(239, 64, 54);
        color: white;
    }
</style>





<div class="container">
    <div class="row">
        <div class="col-12 text-center">
            <h1 class="mb-4">가게 목록</h1>
        </div>
    </div>
    

    <div class="cell right">
    	<!-- 사장님일 경우만 신규가게등록 보여주기 -->
					<c:if test="${sessionScope.loginGrade == '사장님'}">
    
        <h2><a class="link link-animation" href="insert1" class="btn btn-primary">신규 가게 등록</a></h2>

    </div>
    </c:if>

    <div class="container">
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <c:forEach var="dto" items="${categoryList}">
            <div class="col">
                <div class="card">
                    <img src="${pageContext.request.contextPath}${dto.storeImgLink}" class="card-img-top"style="width: 100%; height: 250px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title text-center">${dto.storeName}</h5>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item text-center">주소 : ${dto.storeAddress1}</p>
                        <li class="list-group-item text-center">음식 카테고리 : ${dto.storeCategory}</p>
                        <li class="list-group-item text-center">${dto.storeType}</li>
                        <li class="list-group-item text-center">연락처 : ${dto.storeContact}</li>
                        <li class="list-group-item text-center">운영시간 : ${dto.storeOpenHour} - ${dto.storeCloseHour}</li>
                        <li class="list-group-item text-center">배달 가능 지역 : ${dto.storeDelivery}</li>
                        <li class="list-group-item text-center">휴무일 : ${dto.storeClosed}</li>
                        <li class="list-group-item text-center">가게 거리 : ${dto.userDistance}km</li>
                    </ul>
                    <div class="card-body text-center">
                        <a href="${pageContext.request.contextPath}/menu/customerMenuList?storeNo=${dto.storeNo}" class="btn btn-primary">가게 보기</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


	
	</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
