<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>충전 상품 수정</h1>

<form action="edit" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pointNo" value="${pointDto.pointNo}">
	
	상품명 <input type="text" name="pointName" value="${pointDto.pointName}">
	판매가격 <input type="number" name="pointPrice" value="${pointDto.pointPrice}">
	충전금액 <input type="number" name="pointCharge" value="${pointDto.pointCharge}">
	
	<input type="file" name="attach"> <br>
	
	<img src="image?pointNo=${pointDto.pointNo}" width="100"><br><br>

	<button>변경</button>
</form>





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>