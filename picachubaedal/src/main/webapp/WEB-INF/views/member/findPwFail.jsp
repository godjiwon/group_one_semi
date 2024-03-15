<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


        <form action="findPw" method="post" autocomplete="off">
<c:if test="${empty foundPw && empty memberId}">
	<div class="cell center" style="color: red;">
		<h2>아이디 또는 이메일 정보가 일치하지 않습니다</h2>
	</div>
</c:if>
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>



