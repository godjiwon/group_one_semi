<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>배츄 로그인</title>

<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- 내가 구현한 스타일 -->
<link rel="stylesheet" type="text/css" href="/css/commons.css">
<link rel="stylesheet" type="text/css" href="/css/test.css">

<!-- font awesome 아이콘 CDN -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
.btn.positive {
	background-color: pink;
}

.tool.success {
	border-color: #00b894 !important;
}

.tool.fail {
	border-color: #d63031 !important;
}

.success-feedback {
	color: #00b894;
	display: none;
}

.fail-feedback {
	color: #d63031;
	display: none;
}

.tool.success ~ .success-feedback, .tool.fail ~ .fail-feedback {
	display: block;
}
.kakao{
	background-color:rgb(255,235,51);
}
</style>
<!-- 아이디,비밀번호 유효성 검사 -->
<script type="text/javascript">
	function checkId() {
		var inputTarget = document.querySelector("[name=memberId]");
		var memberId = inputTarget.value;
		var regex = /^[a-z][a-z0-9]{7,19}$/;
		var isValid = regex.test(memberId);

		inputTarget.classList.remove("success", "fail");
		inputTarget.classList.add(isValid ? "success" : "fail");
	}
	function checkPw() {
		var inputTarget = document.querySelector("input[name=memberPw]");
		var memberPw = inputTarget.value;

		var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{6,15}$/;
		var isValid = regex.test(memberPw);

		inputTarget.classList.remove("success", "fail");
		inputTarget.classList.add(isValid ? "success" : "fail");
	}
	function checkForm() {
		var idValid = checkId();
		var pwValid = checkPw();
		return idValid && pwValid;
	}
</script>

<!--  카카오 계정 로그인 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
	Kakao.init('71758ab36b8b8732582af48d99fe3500'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
		Kakao.Auth.login({
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
			},
			fail : function(error) {
				console.log(error)
			},
		})
	}
	//카카오로그아웃  
	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url : '/v1/user/unlink',
				success : function(response) {
					console.log(response)
				},
				fail : function(error) {
					console.log(error)
				},
			})
			Kakao.Auth.setAccessToken(undefined)
		}
	}
</script>
</head>

<body>
	<form action="signin" method="post" autocomplete="off"
		onsubmit="return checkForm();">
		<div class="container w-400">
			<div class="cell center">
				<h1>로그인</h1>
			</div>

			<div class="cell">
				<label>아이디</label> <input type="text" name="memberId" required
					class="tool w-100" onblur="checkId();">
				<div class="fail-feedback">아이디는 소문자 시작, 숫자 포함 8~20자로 작성하세요</div>
			</div>
			<div class="cell">
				<label>비밀번호</label> <input type="password" name="memberPw" required
					class="tool w-100">
			</div>
			<div class="cell">
				<button class="btn positive w-100">로그인</button>
			</div>
			<div class="cell btn w-100 kakao" onclick="kakaoLogin();">
				<span>카카오 계정 로그인</span>
			</div>

			<div class="cell center">
				<a href="findId">아이디가 기억나지 않습니다</a>
			</div>
			<div class="cell center">
				<a href="findPw">비밀번호가 기억나지 않습니다</a>
			</div>
			<c:if test="${param.error != null}">
				<div class="cell center">
					<h3 style="color: red">로그인 정보가 일치하지 않습니다</h3>
				</div>
			</c:if>
		</div>

	</form>

</body>
</html>

