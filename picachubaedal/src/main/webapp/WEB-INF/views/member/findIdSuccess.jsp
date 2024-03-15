<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty memberId}">
				<div class="cell center">
					<h2>${memberNick}님의아이디는 다음과 같습니다:</h2>
					<h3>${memberId}</h3>
				</div>
			</c:if>
</body>
</html>