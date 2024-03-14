<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-800">
	<div class="cell center">
		<h1>가게 목록</h1>
	</div>
	<div class="cell center">
		<%-- 검색창 --%>
		<form action="list" method="get">
			<select name="column" class="tool">
				<option value="store_name" ${param.column == 'store_name' ? 'selected' : ''}>가게이름</option>
				<option value="store_address" ${param.column == 'store_address' ? 'selected' : ''}>주소</option>
				<option value="store_category" ${param.column == 'store_category' ? 'selected' : ''}>음식 카테고리</option>
				<option value="store_type" ${param.column == 'store_type' ? 'selected' : ''}>배달 or 포장</option>
				<option value="store_contact" ${param.column == 'store_contact' ? 'selected' : ''}>연락처</option>
				<option value="store_hours" ${param.column == 'store_hours' ? 'selected' : ''}>가게 운영시간</option>
				<option value="store_delivery" ${param.column == 'store_delivery' ? 'selected' : ''}>배달 가능지역</option>
				<option value="store_closed" ${param.column == 'store_closed' ? 'selected' : ''}>가게 휴무일</option>
			</select>
			<input type="text" name="keyword" placeholder="검색어 입력" required value="${param.keyword}" class="tool">
			<button class="btn positive">검색</button>
		</form>
	</div>
	<div class="cell right">
		<h2><a class="link link-animation" href="insert">신규 가게 등록</a></h2>		
	</div>
	
	<div class="cell">
		<%-- 목록 출력 --%>
		<table class="table table-horizontal">
			<thead>
				<tr>
					<th>가게번호</th>
					<th>가게이름</th>
					<th>주소</th>
					<th>음식 카테고리</th>
					<th>배달 or 포장</th>
					<th>연락처</th>
					<th>가게 운영시간</th>
					<th>배달 가능지역</th>
					<th>가게 휴무일</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="dto" items="${list}">
				<tr onclick="window.location.href='detail?storeNo=${dto.storeNo}'" style="cursor: pointer;">
					<td>${dto.storeNo}</td>
					<td>${dto.storeName}</td>
					<td>${dto.storeAddress}</td>
					<td>${dto.storeCategory}</td>
					<td>${dto.storeType}</td>
					<td>${dto.storeContact}</td>
					<td>${dto.storeHours}</td>
					<td>${dto.storeDelivery}</td>
					<td>${dto.storeClosed}</td>
				</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
</div>

<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
