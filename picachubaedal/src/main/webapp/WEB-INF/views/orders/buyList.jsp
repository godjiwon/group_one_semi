<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
* {
	font-family: 빙그레 메로나체, sans-serif;
}
.container {
	display: grid;
	margin-top: 50px;
	margin-bottom: 50px;
	padding: 60px;
	border: 1px solid #ffffff;
	background-color: #ffffff;
	box-shadow: 0 0 5px 5px rgb(255, 245, 213);
	padding: 60px;
}
.w-20 {
	width: 20%;
}
.w-30 {
	width: 30%;
}
.w-40 {
	width: 40%;
}
.w-65 {
	width:65%;
}
.listBox {
	border: 1px solid rgb(254, 210, 61);
	border-radius: 8px;
	padding: 5px;
}
.listBox-hr {
	border-top : 1px;
	color : rgb(254, 210, 61);
}
.detailBox {
	border: 0.5px solid rgb(255, 230, 142);
	border-radius: 10px;
	text-decoration: none;
	text-align: center;
	padding: 2px;
	color: #2d3436;
	background-color: rgb(255, 230, 142);
}
.write {
	text-decoration: none;
	color: #2d3436;
}
.date {
	font-weight: bold;
	margin-left : 20px;
}
.text-info {
	font-weight: bold;
	font-size : 16px;
}
<%--
div, ul, li, header, nav, section, aside, article, footer {
    box-shadow: 0 0 1px 0 gray;
}
--%>
</style>
<div class="container w-600">
	<div class="cell center">
		<h1>구매 내역</h1>
	</div>
	<c:forEach var="order" items="${buyList}">
		<div class="cell listBox">
			<div class="cell">
				<div class="cell date">
					${order.ordersDate}
				</div>
				<hr class="listBox-hr">
			</div>
			<div class="cell flex-cell">
				<div class="cell w-30 ms-20">가게사진
				<img src="${order.storeImageLink}">
				</div>
				<div class="width-fill">
					<div class="cell date">가게이름${order.storeName}</div>
					<div class="cell text-info">${order.ordersItemName}</div>
					<div class="cell text-info ms-20">
					<fmt:formatNumber value="${order.ordersTotal}" pattern="#,##0"></fmt:formatNumber>원
					</div>
					<hr class="listBox-hr">
					<div class="cell flex-cell">
						<div class="cell w-65 right"> 
							<a href="#" class="detailBox">상세보기</a>
						</div>
						<div class="cell w-30 right" style="flex-grow: 1;">
							<a href="#" class="write"> <i
								class="fa-solid fa-pen-to-square"></i> 리뷰쓰기
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>