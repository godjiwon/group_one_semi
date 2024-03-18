<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
* {
	font-family: 빙그레 메로나체, sans-serif;
}
</style>

<form action="findPw" method="post" autocomplete="off">
<div class="container w-500">
	<div class="cell center my-50">
		<img src="/image/pikachu-dduk.png" width="200px;">
	</div>
<c:if test="${empty foundPw && empty memberId}">
	<div class="cell center my-50">
		<h2 style="color: rgb(232,79,31);">아이디 또는 이메일 정보가 일치하지 않습니다</h2>
	</div>
</c:if>
</div>
</form>
<div class="cell center my-50">
	<a href="/member/findPw" class="link">
		<i class="fa-solid fa-reply"></i>
		다시 시도
	</a>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>



