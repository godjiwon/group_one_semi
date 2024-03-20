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
.basketBox {
	border : 2px solid rgb(236,190,70);
	border-radius : 10px;
	text-align : center;
}

</style>

<div class="container w-800">
	<div class="cell center mt-50">
		<h2>장바구니 <i class="fa-solid fa-basket-shopping"></i></h2>
	</div>
	
<input type="hidden" name="memberNo" class="tool w-100" value="<%=session.getAttribute("memberNo")%>" readonly>

<div class="cell">
<c:choose>
	<c:when test="${sessionScope.memberNo != null && not empty qwer}">
	<div class="cell p-50">
		<c:forEach var="ppp" items="${qwer}">
			<div class="cell basketBox">
				<h3>(가게 이름)</h3>
				<hr style="border-top:1px solid rgb(236,190,70)">
					<div class="cell flex-cell">
				
						<div class="cell w-50">
							<label>
								<i class="fa-solid fa-utensils" style="color:gray;"></i>
								메뉴명
							</label>
							<h3>${ppp.itemName}</h3>
						</div>
						<div class="cell w-25">
							<label>수량</label>
							<h3>${ppp.itemQuantify} 개</h3>
						</div>
						<div class="cell w-25">
							<label>
								<i class="fa-solid fa-coins" style="color:rgb(254,210,61)"></i>
								가격
							</label>
							<h3>${ppp.itemPrice} 원</h3>
						</div>
						
						<%-- 테스트 확인용 삭제 창 --%>
						<div><a href="delete?cartNo=${ppp.cartNo}">삭제</a></div>
						
				</div>
				<div></div>
			</div>
		</c:forEach>
	</div>
	
		 
		<div class="cell center">
		<form action="/orders/buy" method="get">
			<button class="btn" style="width:20%; height:50px; background-color:rgb(254,210,61)">주문하기</button>
		</form>
		</div>
	</c:when>
	<c:otherwise>
		<h2>장바구니가 비었습니다</h2>
	</c:otherwise>
</c:choose>
</div>


</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>