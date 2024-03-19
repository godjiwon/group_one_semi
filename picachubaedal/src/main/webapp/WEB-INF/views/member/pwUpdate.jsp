<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.container {
	display: grid;
	margin-top: 50px;
	margin-bottom: 50px; padding : 60px;
	border: 1px solid #ffffff;
	background-color: #ffffff;
	box-shadow: 0 0 5px 5px rgb(255,245,213);
	padding: 60px;
}
</style>


<form action="pwUpdate" method="post">

<div class="container w-500">
	<div class="cell center"><h1>비밀번호 변경</h1></div>
	<div class="cell">
		<label>기존 비밀번호</label>
		<input type="password" name="originPw" class="tool w-100">
	</div>
	<div class="cell">
		<label>변경 비밀번호</label>
		<input type="password" name="changePw" class="tool w-100">
	</div>
	<div class="cell">
		<button class="btn w-100" style="background-color:rgb(254,210,61)";>비밀번호 변경하기</button>
	</div>
	<c:if test="${param.error != null}">
	<div class="cell">
		<h3 style="color:red">기존 비밀번호가 일치하지 않습니다</h3>
	</div>
	</c:if>
</div>
	
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>