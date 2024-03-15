<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

	<form action="findId" method="post" autocomplete="off">
<c:if test="${not empty memberId}">
				<div class="cell center">
					<h2>${memberNick}님의아이디는 다음과 같습니다:</h2>
					<h3>${memberId}</h3>
				</div>
			</c:if>
			</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>