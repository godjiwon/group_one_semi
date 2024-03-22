<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
* {
	font-family: 빙그레 메로나체, sans-serif;
}

.information {
	display: flex;
}
</style>

<div class="container w-1000 my-50">
	<div class="cell information">
		<div class="cell w-50"></div>
		<div class="cell right w-50">
			<h1>${memberDto.memberId}님의정보</h1>
		</div>
		<div class="cell w-50">
			<img src="/image/transparent-cute-pikachu.png" width="25%;">
		</div>
	</div>
	<div class="cell floating-cell">
		<div class="w-25 row">
			<div class="col-md-3">
				<div class="cell center">
					<img src="profilePhoto" width="150" height="150">
				</div>

				<div class="cell center">
					<h2>
						<a class="link link-animation" href="/member/pwUpdate">비밀번호 변경</a>
					</h2>
				</div>
				<div class="cell center">
					<h2>
						<a class="link link-animation" href="/member/profileEdit">개인정보
							변경</a>
					</h2>
				</div>

				<div class="cell center">
					<h2>
						<a class="link link-animation"
							href="http://localhost:8080/store/likeList">찜 목록</a>
					</h2>
				</div>

				<div class="cell center">
					<!-- 사장님일 경우만 내가게 보여주기 -->
					<c:if test="${sessionScope.loginGrade == '사장님'}">

						<h2>
							<a class="link link-animation"
								href="http://localhost:8080/store/list">내 가게</a>
						</h2>
						
							<h2>
								<a class="link link-animation" href="insert1">신규 가게 등록</a>
							</h2>
						
					</c:if>
				</div>
				<div class="cell center">
					<h2>
						<a class="link link-animation" href="/member/delete_account"
							style="color: red";>회원 탈퇴</a>
					</h2>
				</div>
			</div>
		</div>
		<div class="w-75">
			<div class="cell">
				<table class="table table-horizontal">
					<tr>
						<th width="30%">닉네임</th>
						<td class="left">${memberDto.memberNick}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td class="left">${memberDto.memberEmail}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td class="left">${memberDto.memberContact}</td>
					</tr>

					<tr>
						<th>주소</th>
						<td class="left">[${memberDto.memberPost}]
							${memberDto.memberAddress1} ${memberDto.memberAddress2}</td>
					</tr>
					<tr>
						<th>등급</th>
						<td class="left">${memberDto.memberGrade}</td>
					</tr>
					<tr>
						<th>가입일시</th>
						<td class="left"><fmt:formatDate
								value="${memberDto.memberJoin}" pattern="y년 M월 d일 H시 m분 s초" /></td>
					</tr>
					<tr>
						<th>로그인일시</th>
						<td class="left"><fmt:formatDate
								value="${memberDto.memberUpdate}" pattern="y년 M월 d일 H시 m분 s초" />
						</td>
					</tr>
				</table>
			</div>

			
		</div>
	</div>

</div>
<br>

<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

