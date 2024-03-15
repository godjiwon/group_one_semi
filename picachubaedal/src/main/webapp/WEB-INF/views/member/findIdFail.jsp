<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty memberId}">
				<div class="cell center" style="color: red;">
					<h3>닉네임 정보가 일치하지 않습니다</h3>
				</div>
			</c:if>
</body>
</html>