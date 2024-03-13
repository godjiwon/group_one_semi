<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입테스트</h1>
	<div>
		<form action="signup" method="post" enctype="multipart/form-data">
			아이디 * <input type="text" name="memberId"
				placeholder="소문자 시작, 숫자 포함 8~20자" required> <br> <br>
			비밀번호 * <input type="password" name="memberPw"
				placeholder="대소문자,숫자,특수문자 포함 6~15자" required><br> <br>
			닉네임 * <input type="text" name="memberNick" placeholder="한글숫자 2~10자"
				required> <br> <br> <input type="text"
				name="memberPost" placeholder="우편번호"> <br>
			<br> <input type="text" name="memberAddress1" placeholder="기본주소">
			<br>
			<br> <input type="text" name="memberAddress2" placeholder="상세주소">
			<br> <input type="text" name="memberContact" placeholder="전화번호써라">
			<br> <input type="text" name="memberEmail" placeholder="이메일써라">
			<br>
			<br> 프로필 이미지 <input type="file" name="attach"> <br>
			<br>

			<button>회원가입</button>
		</form>
	</div>
</body>
</html>