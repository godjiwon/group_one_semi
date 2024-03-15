<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

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

<form action="profileEdit" method="post" autocomplete="off">

<div class="container w-500">
	<div class="cell center"><h1>개인정보 변경</h1></div>
	<div class="cell">
		<label>닉네임<b style="color:red">*</b></label>
		<input type="text" name="memberNick" placeholder="한글숫자 2~10자" required class="tool w-100" value="${memberDto.memberNick}">
	</div>
	<div class="cell">
		<label>이메일<b style="color:red">*</b></label>
		<input type="email" name="memberEmail" required class="tool w-100" value="${memberDto.memberEmail}">
	</div>
	<div class="cell">
		<label>휴대전화</label>
		<input type="tel" name="memberContact" class="tool w-100" value="${memberDto.memberContact}">
	</div>
	
	<div class="cell">
		<label>주소</label>
	</div>
	<div class="cell">
		<input type="text" name="memberPost" placeholder="우편번호" class="tool" size="8" value="${memberDto.memberPost}">
		<button class="btn positive btn-address-search" style="background-color:rgb(254,210,61);">검색</button>
	</div>
	<div class="cell">
		<input type="text" name="memberAddress1" placeholder="기본주소" class="tool w-100" value="${memberDto.memberAddress1}">
	</div>
	<div class="cell">
		<input type="text" name="memberAddress2" placeholder="상세주소" class="tool w-100" value="${memberDto.memberAddress2}">
	</div>
	<div class="cell mt-20">
		<label>비밀번호 확인<b style="color:red">*</b></label>
		<input type="password" name="memberPw" required class="tool w-100">
	</div>
	<div class="cell">
		<button class="btn positive w-100" style="background-color:rgb(254,210,61);">변경하기</button>
	</div>
	
	<c:if test="${param.error != null}">
	<div class="cell center">
		<h3 style="color:red">비밀번호가 일치하지 않습니다</h3>
	</div>
	</c:if>
</div>

</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>







