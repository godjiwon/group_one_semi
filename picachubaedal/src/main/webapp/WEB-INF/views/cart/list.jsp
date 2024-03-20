<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<style>
.container {
	display: grid;
	font-family : 빙그레 메로나체, sans-serif;
	margin-top: 50px;
	margin-bottom: 50px; padding : 60px;
	border: 1px solid #ffffff;
	background-color: #ffffff;
	box-shadow: 0 0 5px 5px rgb(255,245,213);
	padding: 30px;
}
</style>

<div class="container w-800">
	<div class="cell center">
		<h2>장바구니</h2>
	</div>
<input type="text" name="memberNo" class="tool w-100" value="<%=session.getAttribute("memberNo")%>" readonly>

<c:choose>
	<c:when test="${sessionScope.memberNo != null && not empty qwer}">
		<table border="1">
			<thead>
				<tr>
					<th>메뉴명</th>
					<th>수량</th>
					<th>총 금액</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ppp" items="${qwer}">
					<tr>
						<td>${ppp.itemName}</td>
						<td>${ppp.itemQuantify}</td>
						<td>${ppp.itemPrice}</td>
						<td><a href="delete?cartNo=${ppp.cartNo}">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form action="/orders/buy" method="get">
			<input type="text" name="memberNo" class="tool w-100" value="<%=session.getAttribute("memberNo")%>" readonly>
			<input type="text" name="menuNo" value="${ppp.menuNo}" readonly>
			<button>주문</button>
		</form>
	</c:when>
	<c:otherwise>
		<h2>장바구니가 비었습니다</h2>
	</c:otherwise>
</c:choose>

</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>