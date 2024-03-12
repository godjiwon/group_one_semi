<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제목을 설정하세요</title>

    <!-- 구글 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- 내가 구현한 스타일 -->
    <link rel="stylesheet" type="text/css" href="/css/commons.css">
    <link rel="stylesheet" type="text/css" href="/css/test.css">

    <!-- font awesome 아이콘 CDN -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <style>
        
    </style>
    <!--jquery CDN-->
    <script src="
    https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

    <!-- lightpick CDN-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.min.css">
    <script src="https://cdn.jsdelivr.net/npm/moment@2.30.1/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>

<script type="text/javascript">
	$(function() {
		//상태객체(React의 state로 개념이 이어짐)
		var state = {
			//key : value
			memberIdValid : false,
			memberPwValid : false,
			memberPwCheckValid : false,
			memberNickValid : false,
			memberEmailValid : false,
			memberContactValid : false, 
			memberAddressValid : false,
			//객체에 함수를 변수처럼 생성할 수 있다
			//- this는 객체 자신(자바와 동일하지만 생략이 불가능)
			ok : function() {
				return this.memberIdValid && this.memberPwValid
						&& this.memberPwCheckValid && this.memberNickValid
						&& this.memberEmailValid && this.memberContactValid
						&& this.memberAddressValid;
			},
		};

		$("[name=memberId]").blur(
				function() {
					var regex = /^[a-z][a-z0-9]{7,19}$/;
					var value = $(this).val();

					if (regex.test(value)) {//아이디 형식 검사를 통과했다면
						$.ajax({
							url : "/rest/member/checkId",
							method : "post",
							data : {
								memberId : value
							},
							success : function(response) {
								//console.log(response);
								if (response == "NNNNN") {
									$("[name=memberId]").removeClass(
											"success fail fail2").addClass(
											"fail2");
									state.memberIdValid = false;
								} else if (response == "NNNNY") {
									$("[name=memberId]").removeClass(
											"success fail fail2").addClass(
											"success");
									state.memberIdValid = true;
								}
							}
						});
					} else {//아이디가 형식검사를 통과하지 못했다면
						$("[name=memberId]").removeClass("success fail fail2")
								.addClass("fail");
						state.memberIdValid = false;
					}
				});
		$("[name=memberPw]")
				.on(
						"blur",
						function() {
							var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{6,15}$/;
							state.memberPwValid = regex.test($(this).val());
							$(this).removeClass("success fail").addClass(
									state.memberPwValid ? "success" : "fail");
						});
		$("#pw-reinput").blur(
				function() {
					var memberPw = $("[name=memberPw]").val();
					state.memberPwCheckValid = memberPw == $(this).val();

					if (memberPw.length == 0) {
						$(this).removeClass("success fail fail2").addClass(
								"fail2");
					} else {
						$(this).removeClass("success fail fail2").addClass(
								state.memberPwCheckValid ? "success" : "fail");
					}
				});
		$("[name=memberNick]").blur(
				function() {
					var regex = /^[가-힣0-9]{2,10}$/;
					var value = $(this).val();

					if (regex.test(value)) {
						$.ajax({
							url : "/rest/member/checkMemberNick",
							method : "post",
							data : {
								memberNick : value
							},
							success : function(response) {
								if (response) {//사용 가능한 경우 - success
									state.memberNickValid = true;
									$("[name=memberNick]").removeClass(
											"success fail fail2").addClass(
											"success");
								} else {//이미 사용중인 경우 - fail2
									state.memberNickValid = false;
									$("[name=memberNick]").removeClass(
											"success fail fail2").addClass(
											"fail2");
								}
							}
						});
					} else {//형식이 맞지 않는 경우 - fail
						state.memberNickValid = false;
						$("[name=memberNick]")
								.removeClass("success fail fail2").addClass(
										"fail");
					}
				});

		$("[name=memberContact]").blur(
				function() {
					var regex = /^010[1-9][0-9]{7}$/;
					var value = $(this).val();
					state.memberContactValid = value.length == 0
							|| regex.test(value);
					$(this).removeClass("success fail").addClass(
							state.memberContactValid ? "success" : "fail");
				});

		//주소는 세 개의 입력창이 모두 입력되거나 안되거나 둘 중 하나
		$("[name=memberAddress2]")
				.blur(
						function() {
							var post = $("[name=memberPost]").val();
							var address1 = $("[name=memberAddress1]").val();
							var address2 = $("[name=memberAddress2]").val();

							var isClear = post.length == 0
									&& address1.length == 0
									&& address2.length == 0;
							var isFill = post.length > 0 && address1.length > 0
									&& address2.length > 0;

							state.memberAddressValid = isClear || isFill;

							$(
									"[name=memberPost], [name=memberAddress1], [name=memberAddress2]")
									.removeClass("success fail")
									.addClass(
											state.memberAddressValid ? "success"
													: "fail");
						});

		//form 전송
		$(".check-form").submit(function(e) {
			//$(this).find("[name], #pw-reinput").blur();
			//$(this).find(".tool").blur();//모든 창

			//입력창 중에서 success fail fail2가 없는 창
			$(this).find(".tool").not(".success, .fail, .fail2").blur();
			 if (state.ok()) {
	                e.preventDefault(); // 폼 전송을 막음
	                alert("모든 입력 항목을 올바르게 작성해주세요.");
	            }
	        });
	    });
</script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function() {
		$(".btn-address-search").click(function() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					$("[name=memberPost]").val(data.zonecode);
					$("[name=memberAddress1]").val(addr);

					// 커서를 상세주소 필드로 이동한다.
					$("[name=memberAddress2]").focus();
				}
			}).open();
		});

		$(".btn-address-clear").click(function() {
			$("[name=memberPost]").val("");
			$("[name=memberAddress1]").val("");
			$("[name=memberAddress2]").val("");
		});
	});
</script>
<body>
<form action="signup" method="post" enctype="multipart/form-data"
	autocomplete="off" class="check-form">

	<div class="container w-500">

		<div class="cell center">
			<h1>회원 정보 입력</h1>
		</div>

		<div class="cell">
			<div class="cell">
				<label> 아이디 <i class="fa-solid fa-asterisk red"></i>
				</label> <input type="text" name="memberId"
					placeholder="영문 소문자시작, 숫자 포함 8~20자" class="tool w-100">
				<div class="success-feedback">멋진 아이디네요!</div>
				<div class="fail-feedback">아이디는 소문자 시작, 숫자 포함 8~20자로 작성하세요</div>
				<div class="fail2-feedback">이미 사용중인 아이디입니다</div>
			</div>
			<div class="cell">
				<label> 비밀번호 <i class="fa-solid fa-asterisk red"></i>
				</label> <input type="password" name="memberPw"
					placeholder="영문 대소문자, 숫자, 특수문자 1개 이상 포함 6~15자" class="tool w-100">
				<div class="success-feedback">비밀번호가 올바른 형식입니다</div>
				<div class="fail-feedback">비밀번호에는 반드시 영문 대,소문자와 숫자, 특수문자가
					포함되어야 합니다</div>
			</div>
			<div class="cell">
				<label> 비밀번호 확인 <i class="fa-solid fa-asterisk red"></i>
				</label>
				<!-- 비밀번호 확인은 백엔드로 전송되지 않도록 이름을 부여하지 않는다 -->
				<input type="password" placeholder="" id="pw-reinput"
					class="tool w-100">
				<div class="success-feedback">비밀번호가 일치합니다</div>
				<div class="fail-feedback">비밀번호가 일치하지 않습니다</div>
				<div class="fail2-feedback">비밀번호를 먼저 입력하세요</div>
			</div>
		</div>

		<div class="cell">
			<div class="cell">
				<label> 닉네임 <i class="fa-solid fa-asterisk red"></i>
				</label> <input type="text" name="memberNick" placeholder="한글,숫자 2~10글자"
					class="tool w-100">
				<div class="success-feedback">사용 가능한 닉네임입니다</div>
				<div class="fail-feedback">닉네임을 한글,숫자 2~10글자로 작성하세요</div>
				<div class="fail2-feedback">이미 사용중인 닉네임입니다</div>
			</div>
		</div>

		<div class="cell">
			<div class="cell">
				<label>이메일<i class="fa-solid fa-asterisk red"></i></label>

				<div class="flex-cell" style="flex-wrap: wrap;">
					<input type="email" name="memberEmail" placeholder="test@kh.com"
						class="tool width-fill">

					<div class="fail-feedback w-100">잘못된 이메일 형식입니다</div>
				</div>
			</div>


			<div class="cell">
				<div class="cell">
					<label>연락처  <i class="fa-solid fa-asterisk red"></i>
					</label> <input type="tel" name="memberContact"
						placeholder="- 제외하고 입력" class="tool w-100">
					<div class="fail-feedback">잘못된 휴대전화 번호 형식입니다</div>
				</div>


			</div>

			<div class="cell">
				<!-- 주소 : 모두 입력하든가 입력하지 않든가 -->
				<div class="cell">
					<label>주소  <i class="fa-solid fa-asterisk red"></i> </label>
				</div>
				<div class="cell">
					<input type="text" name="memberPost" readonly placeholder="우편번호"
						class="tool" size="6" maxlength="6">
					<button type="button" class="btn positive btn-address-search">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
					<button type="button" class="btn negative btn-address-clear">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
				<div class="cell">
					<input type="text" name="memberAddress1" placeholder="기본주소"
						class="tool w-100" readonly>
				</div>
				<div class="cell">
					<input type="text" name="memberAddress2" placeholder="상세주소"
						class="tool w-100">
					<div class="fail-feedback">주소를 모두 작성하세요</div>
				</div>

				<div class="flex-cell"></div>

				<div class="cell">
					<div class="cell">
						<label>프로필 이미지</label> <input type="file" name="attach"
							class="tool w-100">
					</div>

					<div class="w-100 right">
						<button type="submit" class="btn positive">
							<i class="fa-solid fa-user"></i> 회원가입
						</button>
					</div>
				</div>
			</div>
</div>
		</div>
</form>
</head>
</html>
</body>


