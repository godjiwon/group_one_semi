<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	* {
		font-family : 빙그레 메로나체, sans-serif;
	}
	.information{
		display: flex;
	}
</style>

<div class="container w-1000 my-50">
	<div class="cell information">
		<div class="cell w-50"></div>
		<div class="cell right w-50">
			<h1>${memberDto.memberId}님의 정보</h1>
		</div>
		<div class="cell w-50">
			<img src="/image/transparent-cute-pikachu.png" width="25%;">
		</div>
	</div>
	<div class="cell floating-cell" >
		<div class="w-25 row">
		<div class="col-md-3">
			<div class="cell center">
				<img src="profilePhoto" width="150" height="150">
			</div>

			<div class="cell center">
				<h2><a class="link link-animation" href="/member/pwUpdate">비밀번호 변경</a></h2>
			</div>
			<div class="cell center">
				<h2><a class="link link-animation" href="/member/profileEdit">개인정보 변경</a></h2>
			</div>

			<div class="cell center">
				<h2><a class="link link-animation" href="http://localhost:8080/store/likeList">찜 목록</a></h2>
			</div>
			<div class="cell center">
				<h2><a class="link link-animation" href="/member/delete_account" style="color:red";>회원 탈퇴</a></h2>
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
						<td class="left">
							[${memberDto.memberPost}] 
							${memberDto.memberAddress1}
							${memberDto.memberAddress2}
						</td>
					</tr>
					<tr>
						<th>등급</th>
						<td class="left">${memberDto.memberGrade}</td>
					</tr>
					<tr>
						<th>포켓볼</th>
						<td class="left">${memberDto.memberPoint} 개</td>
					</tr>
					<tr>
						<th>가입일시</th>
						<td class="left">
							<fmt:formatDate value="${memberDto.memberJoin}" 
														pattern="y년 M월 d일 H시 m분 s초"/>
						</td>
					</tr>
					<tr>
						<th>로그인일시</th>
						<td class="left">
							<fmt:formatDate value="${memberDto.memberUpdate}" 
														pattern="y년 M월 d일 H시 m분 s초"/>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="cell">
				<h2>
					주문 내역
				</h2>
			</div>
			<div class="cell">
				<table class="table table-horizontal">
					<thead>
						<tr>
							<th>가게</th>
							<th>메뉴</th>
							<th>수량</th>
							<th>총 금액</th>
							<th>구매일시</th>
							<th>리뷰</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ordersDto" items="${ordersList}">
						<tr>
							<td>${ordersDto.storeName}</td>
							<td>${ordersDto.menuName}</td>
							<td>${ordersDto.ordersqty}</td>
							<td>
								<fmt:formatNumber value="${ordersDto.ordersTotal}" pattern="#,##0"/>
							</td>
							<td>
								<fmt:formatDate value="${ordersDto.ordersTime}" 
																pattern="yyyy-MM-dd HH:mm"/>
							</td>
							<td>
								<i class="fa-regular fa-pen-to-square"></i>
							</td>
						</tr>		
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>
<br>

<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

