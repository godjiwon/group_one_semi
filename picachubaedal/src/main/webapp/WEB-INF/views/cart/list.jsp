<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<div class="container w-1000">
<div class="cell center">
	<h1>장바구니</h1>
</div>

<div class="cell">
<h3>가게이름</h3>
<form>
<img src="menu_no">
<h3>메뉴명</h3>
<h3>수량</h3>
<h3>X (삭제버튼)</h3>
<a><h3>더담기 (가능하면 구현)</h3></a>
<button>주문(결제)(최소주문금액 이상일 경우 버튼 클릭가능)</button>
</form>
</div>

<h1>장바구니</h1>

<table class="table table-border">
	<tr>
		<th>가게</th>
		<th>메뉴</th>
		<th>수량</th>
		<th>가격</th>
	</tr>
	<c:forEach var="cartDto" items="${list}">
		<tr>
			<td>${cartDto.storeNo}</td>
			<td>${cartDto.menuName}</td>
			<td>${cartDto.cartCount}</td>
			<td>${cartDto.menuPrice}원</td>
		</tr>
	</c:forEach>
</table>
</div>
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>