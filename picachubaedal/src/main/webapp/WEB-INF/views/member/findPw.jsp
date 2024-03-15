<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<!-- 여기에 CSS 링크 및 필요한 스타일 시트 등을 추가할 수 있습니다. -->
</head>
<body>
	<div class="cell">
		<form action="findPw" method="post" autocomplete="off">
			<div class="container center w-400">
				<div class="cell center">
					<h1>비밀번호 찾기</h1>
				</div>
				<div class="cell mt-0 flex-cell">
					<input type="text" name="memberId" required class="tool w-100"
						placeholder="아이디를 입력하세요">
				</div>
				<div class="cell mt-0 flex-cell">
					<input type="text" name="memberEmail" required class="tool w-100"
						placeholder="이메일을 입력하세요">
				</div>
				<button type="submit" class="btn positive" style="background-color:rgb(254,210,61);">
					찾기 <i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</div>
			<div class="cell">
			<c:if test="${not empty foundPw}">
				<div class="cell center">
					<h1>${memberId}님의비밀번호: ${foundPw}</h1>
				</div>
			</c:if>

			<c:if test="${empty foundPw && empty memberId && 
			not empty param.memberId && not empty param.memberEmail}">
				<div class="cell center" style="color: red;">
					<h3>아이디 또는 이메일 정보가 일치하지 않습니다</h3>
				</div>
			</c:if>

</div>
		</form>

	</div>

	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>