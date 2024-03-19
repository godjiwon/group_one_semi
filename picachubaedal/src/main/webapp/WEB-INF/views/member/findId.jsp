<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
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
<!-- 여기에 CSS 링크 및 필요한 스타일 시트 등을 추가할 수 있습니다. -->
</head>
<body>
		<form action="findId" method="post" autocomplete="off">
			<div class="container center w-500">
				<div class="cell center mb-50">
					<h1>아이디 찾기</h1>
				</div>
				
				<div class="cell mt-0 flex-cell">
					<input type="text" name="memberNick" required class="tool w-100"
						placeholder="닉네임을 입력하세요">
					<button type="submit" class="btn positive"
						style="background-color: rgb(254, 210, 61);">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>

			</div>
		</form>


	<%-- 템플릿 페이지를 불러오는 코드 --%>
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>