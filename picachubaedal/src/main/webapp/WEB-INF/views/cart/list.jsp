<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<style>
.container {
	display: grid;
	font-family: 빙그레 메로나체, sans-serif;
	margin-top: 50px;
	margin-bottom: 50px;
	padding: 60px;
	border: 1px solid #ffffff;
	background-color: #ffffff;
	box-shadow: 0 0 5px 5px rgb(255, 245, 213);
	padding: 30px;
}

.basketBox {
	border: 2px solid rgb(255, 227, 118);
	border-radius: 10px;
	text-align: center;
}

.btn-deleteAll {
	border-radius: 5px;
	background-color: rgb(236, 109, 70);
	color: white;
	width:80px;
	height:25px;
}
.w-20{
	width:20%;
}
.w-10{
	width:10%;
}
</style>

<script type="text/javascript">
$(function () {
    $(".cart-delete").click(function () {
        var message = $(this).data("message");
        if (message == undefined) {
            message = "해당 메뉴를 삭제 하시겠습니까?"
        }
        var choice = window.confirm(message);
        return choice;
    });
});
</script>

<div class="container w-800">
	<div class="cell center mt-30">
		<h2>
			장바구니 <i class="fa-solid fa-basket-shopping"></i>
		</h2>
	</div>

	<input type="hidden" name="memberNo" class="tool w-100"
		value="<%=session.getAttribute("memberNo")%>" readonly>


	<div class="cell">

		<%-- 로그인 && 장바구니가 안비어있을 때 나타남 --%>
		<c:choose>
			<c:when test="${sessionScope.memberNo != null && not empty qwer}">

				<%-- 전체삭제 버튼 --%>
				<div class="cell ms-50">
					<a href="deleteAll" class="btn btn-deleteAll cart-delete" data-message="전체 삭제 하시겠습니까?">전체 삭제</a>
				</div>

				<div class="cell pb-50 ps-50 pe-50">
					<c:forEach var="ppp" items="${qwer}">
						<div class="cell basketBox">
							<h3>(가게 이름)</h3>
							<hr style="border-top: 1px solid rgb(255, 227, 118)">
							<div class="cell flex-cell">

								<div class="cell w-50">
									<label> <i class="fa-solid fa-utensils"
										style="color: gray;"></i> 메뉴명
									</label>
									<h3>${ppp.itemName}</h3>
								</div>
								<div class="cell w-20">
									<label>수량</label>
									<h3>${ppp.itemQuantify}개</h3>
								</div>
								<div class="cell w-20">
									<label> <i class="fa-solid fa-coins"
										style="color: rgb(254, 210, 61)"></i> 가격
									</label>
									<h3>${ppp.itemPrice}원</h3>
								</div>

								<%-- 개별 삭제 창 --%>
								<div class="cell center w-10 mt-50">
									<a href="delete?cartNo=${ppp.cartNo}" class="cart-delete">
										<i class="fa-solid fa-xmark" style="color:rgb(224,67,36)"></i>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>


				<div class="cell center">
					<form action="/orders/buy" method="get">
						<button class="btn"
							style="width: 20%; height: 50px; background-color: rgb(254, 210, 61); font-size: 20px;">
							주문하기</button>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div class="cell center my-20">
					<img src="/image/pikachu-dduk.png" style="width: 40%">
					<h2>장바구니가 비었습니다.</h2>
				</div>
				<div class="cell center mt-50">
					<a href="/" class="link"> <i class="fa-solid fa-utensils gray"></i>
						주문하러 가기
					</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>


</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>