<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
* {
	font-family: 빙그레 메로나체, sans-serif; 
	<%-- font-family: "Noto Sans KR", sans-serif; --%>
}

.table.table-horizontal {
	border-top: 2px solid rgb(197, 88, 18);
	border-bottom: 2px solid rgb(197, 88, 18);
}

.table.table-horizontal>thead {
	border-bottom: 2px solid rgb(197, 88, 18);
}

.table.table-horizontal>tfoot {
	border-top: 2px solid rgb(197, 88, 18);
}

.table.table-horizontal>tbody>tr:not(tr:last-child) {
	border-bottom: 1px solid rgb(197, 88, 18);
}

.link-new {
	text-decoration: none;
	color: #2d3436;
	display: inline-block;
	transition: transform 0.2s ease-out;
}

.link-new:hover {
	color: white;
	transform: scale(1.05);
}
</style>

<div class="container w-800">

	<div class="cell center">
		<h1>충전 상품 목록</h1>
	</div>

	<div class="cell right">
		<button class="btn" style="background-color: rgb(254, 210, 61)">
			<i class="fa-solid fa-ghost white"></i>
			<a href="regist" class="link-new">신규등록</a>
		</button>
	</div>

	<div class="cell">
		<table class="table table-horizontal">
			<c:forEach var="pointDto" items="${list}">
				<tr>
					<td><img src="image?pointNo=${pointDto.pointNo}"></td>
					<td>${pointDto.pointName}</td>
					<td>${pointDto.pointPrice}원</td>
					<td>${pointDto.pointCharge}포인트충전</td>
					<td>
						<a href="edit?pointNo=${pointDto.pointNo}" class="link">
						<i class="fa-solid fa-pen green"></i> 수정
						</a>
						<a href="delete?pointNo=${pointDto.pointNo}" class="link">
						<i class="fa-regular fa-trash-can red"></i> 삭제
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>