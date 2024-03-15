<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="findPw" method="post" autocomplete="off">
	
	<c:if test="${not empty foundPw}">
    <div class="cell center">
        <h1>${memberId}님의 비밀번호: ${foundPw}</h1>
    </div>
</c:if>
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>