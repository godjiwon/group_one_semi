<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-1000">
	<div class="cell">
		<h1>${memberDto.memberId}님의 페이지</h1>
	</div>
	<div class="cell floating-cell">
		<div class="w-25">
			<div class="cell center">
				<img src="image" width="150" height="150">
			</div>
			<div class="cell center">
				<h2><a class="link link-animation" href="/member/password">비밀번호 변경</a></h2>
			</div>
			<div class="cell center">
				<h2><a class="link link-animation" href="/member/change">개인정보 변경</a></h2>
			</div>
			<div class="cell center">
				<h2><a class="link link-animation" href="/member/exit">회원 탈퇴</a></h2>
			</div>
		</div>
		<div class="w-75">
			<div class="cell">
				<h2>가입 정보</h2>
			</div>
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
						<th>포인트</th>
						<td class="left">${memberDto.memberPoint} point</td>
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
					포인트 구매 내역
					<a class="link link-animation ms-30" href="/point/charge">
						<i class="fa-regular fa-credit-card"></i>
						추가구매
					</a>
				</h2>
			</div>
			<div class="cell">
				<table class="table table-horizontal">
					<thead>
						<tr>
							<th>번호</th>
							<th>상품명</th>
							<th>수량</th>
							<th>구매금액</th>
							<th>구매일시</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="buyDto" items="${buyList}">
						<tr>
							<td>${buyDto.buySerial}</td>
							<td>${buyDto.itemName}</td>
							<td>${buyDto.buyQty}</td>
							<td>
								<fmt:formatNumber value="${buyDto.buyTotal}" pattern="#,##0"/>
							</td>
							<td>
								<fmt:formatDate value="${buyDto.buyTime}" 
																pattern="yyyy-MM-dd HH:mm"/>
							</td>
						</tr>		
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>





