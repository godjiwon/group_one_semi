<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/commons.css">
</head>

<style>
body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f7f7f7;
    color: #333;
    margin: 0;
    padding: 20px;
}
.container1 {
    max-width: 800px;
    margin: auto;
    background: white;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    padding: 20px;
    border-radius: 8px;
}
.cell1 {
    margin: 10px 0;
}
input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-sizing: border-box; /* So padding doesn't affect the width */
    min-height: 180px;
}
button {
    background-color: #007BFF;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}
button:hover {
    background-color: #0056b3;
}
h1 {
    color: #333;
}


</style>

<body>

	<div class="container1 w-1000">
	
	<div class="cell1 center">
	<img src="${pageContext.request.contextPath}/image/pica.png" width="250px" height="250px">
	</div>
	
	<div class="cell1 center"><h1>리뷰는 사장님에게 힘이 됩니다</h1></div>
	
	<form action="write" method="post" autocomplete="off">
	
	<div class="cell1 center">
		<textarea name="reviewBoardContent" required placeholder="리뷰내용"></textarea>
	</div>
	
	<div class="cell1 center">
	<input type="hidden" name="reviewBoardStoreNo" required placeholder="가게번호입력해라(임시)"
	value="${param.storeNo}">
	</div>
	
	<input type="hidden" name="reviewBoardWriter" required placeholder=" 회원번호 임시"
	value="<%=session.getAttribute("loginId")%>">
	</div>
	
	<div class="cell1 center"><button>작성하기</button></div>
	</form>
	
	</div>
</body>
</html>