<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>전체가게 리스트</h1>

<div class="container w-800">
<c:forEach var="storeDto" items="${listAll}">
<div class="flex-cell">
	<div>${storeDto.storeName}</div>
	<div><a href="#">가게 상세페이지(임시미구현)</a></div>
</div>
</c:forEach>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>