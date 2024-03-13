<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="findId" method="post" autocomplete="off">
	<div class="container center w-400">
		<div class="cell center">
			<h1>비밀번호 찾기</h1>
		</div>
		<div class="cell mt-0 flex-cell">
			<input type="text" name="memberId" required class="tool w-100"
				placeholder="아이디를 입력하세요"> <br>
			<br>
			<button type="submit" class="btn positive">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</div>
		</div>
		
	
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>