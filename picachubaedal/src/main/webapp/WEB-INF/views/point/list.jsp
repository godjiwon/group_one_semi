<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
* {
	font-family: 빙그레 메로나체, sans-serif; 
}

.table.table-horizontal {
	border-top: 2px solid rgb(197, 88, 18);
	border-bottom: 2px solid rgb(197, 88, 18);
	font-size : 16px;
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
.charge-img {
	width : 100%;
}
</style>

<script type="text/javascript">
        $(function(){
            $("a.remove-confirm").click(function(){
                var message = $(this).data("message");
                if(message == undefined) {
                     message = "삭제하시겠습니까?";
                }
                var choice = window.confirm(message);
                return choice;
            });
        });
</script>

<div class="container w-800">

	<div class="cell center">
		<h1>
			<i class="fa-solid fa-gear fa-spin" style="color:rgb(195,195,195)"></i>
			충전 상품 목록
		</h1>
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
					<td style="width:30%"><img src="image?pointNo=${pointDto.pointNo}" class="charge-img"></td>
					<td>${pointDto.pointName}</td>
					<td>
						<fmt:formatNumber value="${pointDto.pointPrice}" pattern="#,##0"/>원
					</td>
					<td>
						포켓볼<fmt:formatNumber value="${pointDto.pointCharge}" pattern="#,##0"/>개
					</td>
					<td>
						<a href="edit?pointNo=${pointDto.pointNo}" class="link">
						<i class="fa-solid fa-pen green"></i>
						수정
						</a>
						&nbsp&nbsp
						<a href="delete?pointNo=${pointDto.pointNo}" class="link remove-confirm">
						<i class="fa-regular fa-trash-can red"></i>
						삭제
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>