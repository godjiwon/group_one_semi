<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.storeImage {
        width: 250px;
        height: 250px;
        display: block; /* 이미지를 블록 레벨 요소로 설정하여 가운데 정렬합니다. */
        margin: 0 auto; /* 이미지를 가운데 정렬합니다. */
}
.a-list {
	width:100%;
	padding: 0.5em 1em;
	outline: none;
	background-color: #ffeaa7;
	border-radius: 0.1em;
	color: #2d3436;
}
.a-edit {
	width: 100%;
	padding: 0.5em 1em;
	outline: none;
	background-color: #55efc4;
	border-radius: 0.1em;
}
.a-delete {
	width: 100%;
	padding: 0.5em 1em;
	outline: none;
	background-color: #fab1a0;
	border-radius: 0.1em;
}
</style>

<<<<<<< HEAD
<div class="container w-1000 my-50">
	<div class="cell center">
=======

<div class="container w-1000">
	<div class="cell">
>>>>>>> branch 'main' of https://github.com/godjiwon/group_one_semi
		<h1>${storeDto.storeName}</h1>
	</div>
	<div class="cell floating-cell" >
		<div class="w-25 row">
		<div class="col-md-3">
			<div class="cell center">
				<img class="storeImage" src="${storeDto.storeImgLink}" width="150" height="150">
			</div>
			
			<div class="cell center">
				<h2><a class="link a-list" href="/store/list">목록으로</a></h2>
			</div>

			<div class="cell center">
    <h2><a class="link link-animation" href="/store/change?storeNo=${storeDto.storeNo}">가게 정보 수정</a></h2>
</div>

				<div class="cell center">
    <h2><a class="link link-animation" href="delete?storeNo=${storeDto.storeNo}" style="color:red";>가게 삭제</a></h2>
</div>

		</div>
		</div>
		<div></div>
		<div class="w-75">
    		<div class="cell">
       			<table class="table table-horizontal">
		            <tr>
		                <th width="30%">가게 이름</th>
		                <td class="left">${storeDto.storeName}</td>
		            </tr>
		            <tr>
		                <th>가게 번호</th>
		                <td class="left">${storeDto.storeNo}</td>
		            </tr>
		            <tr>
		                <th>주소</th>
		                <td class="left">
		                    ${storeDto.storeAddress1} ${storeDto.storeAddress2}
		                </td>
		            </tr>
		            <tr>
		                <th>음식 카테고리</th>
		                <td class="left">${storeDto.storeCategory}</td>
		            </tr>
		            <tr>
		                <th>배달/포장</th>
		                <td class="left">${storeDto.storeType}</td>
		            </tr>
		            <tr>
		                <th>연락처</th>
		                <td class="left">${storeDto.storeContact}</td>
		            </tr>
		            <tr>
		                <th>가게 소개</th>
		                <td class="left">${storeDto.storeIntro}</td>
		            </tr>
		            <tr>
		                <th>배달팁</th>
		                <td class="left">${storeDto.storeDtip}</td>
		            </tr>
		            <tr>
		                <th>최소 주문금액</th>
		                <td class="left">${storeDto.storeMinprice}</td>
		            </tr>
		            <tr>
		                <th>좋아요 수</th>
		                <td class="left">${storeDto.storeLike}</td>
		            </tr>
		            <tr>
		                <th>영업 시간</th>
		                <td class="left">${storeDto.storeOpenHour} - ${storeDto.storeCloseHour}</td>
		            </tr>
		            <tr>
		                <th>배달 가능 지역</th>
		                <td class="left">${storeDto.storeDelivery}</td>
		            </tr>
		            <tr>
		                <th>휴무일</th>
		                <td class="left">${storeDto.storeClosed}</td>
		            </tr>
		            <tr>
		                <th>가게 등록일</th>
		                <td class="left">${storeDto.storeTime}</td>
		            </tr>
		            <tr>
		                <th>가게 수정일</th>
		                <td class="left">${storeDto.storeUpdate}</td>
		            </tr>
		            <tr>
		                <th>사업자 등록번호</th>
		                <td class="left">${storeDto.storeBusinessNumber}</td>
		            </tr>
		      </table>
    </div>

    <div class="cell">
        <table class="table table-horizontal">
            <tr>
                <th width="30%">가게 이름</th>
                <td class="left">${storeDto.storeName}</td>
            </tr>
            <tr>
                <th>가게 번호</th>
                <td class="left">${storeDto.storeNo}</td>
            </tr>
            <tr>
                <th>주소</th>
                <td class="left">
                    ${storeDto.storeAddress1} ${storeDto.storeAddress2}
                </td>
            </tr>
            <tr>
                <th>음식 카테고리</th>
                <td class="left">${storeDto.storeCategory}</td>
            </tr>
            <tr>
                <th>배달/포장</th>
                <td class="left">${storeDto.storeType}</td>
            </tr>
            <tr>
                <th>연락처</th>
                <td class="left">${storeDto.storeContact}</td>
            </tr>
            <tr>
                <th>가게 소개</th>
                <td class="left">${storeDto.storeIntro}</td>
            </tr>
            <tr>
                <th>배달팁</th>
                <td class="left">${storeDto.storeDtip}</td>
            </tr>
            <tr>
                <th>최소 주문금액</th>
                <td class="left">${storeDto.storeMinprice}</td>
            </tr>
            <tr>
                <th>좋아요 수</th>
                <td class="left">${storeDto.storeLike}</td>
            </tr>
            <tr>
                <th>영업 시간</th>
                <td class="left">${storeDto.storeOpenHour} - ${storeDto.storeCloseHour}</td>
            </tr>
            <tr>
                <th>배달 가능 지역</th>
                <td class="left">${storeDto.storeDelivery}</td>
            </tr>
            <tr>
                <th>휴무일</th>
                <td class="left">${storeDto.storeClosed}</td>
            </tr>
            <tr>
                <th>가게 등록일</th>
                <td class="left">${storeDto.storeTime}</td>
            </tr>
            <tr>
                <th>가게 수정일</th>
                <td class="left">${storeDto.storeUpdate}</td>
            </tr>
            <tr>
                <th>사업자 등록번호</th>
                <td class="left">${storeDto.storeBusinessNumber}</td>
            </tr>
        </table>
        
        
    </div>

</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>