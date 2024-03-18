<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
*{
	font-family: 빙그레 메로나체, sans-serif;
}
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


	<form action="findId" method="post" autocomplete="off">
	<div class="container w-500">
		<c:if test="${not empty memberId}">
			<div class="cell center">
				<h2>'${memberNick}'님의 아이디 :</h2>
			</div>
			<div class="cell center">
				<h3>${memberId}</h3>
			</div>
		</c:if>
		</div>
	</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>