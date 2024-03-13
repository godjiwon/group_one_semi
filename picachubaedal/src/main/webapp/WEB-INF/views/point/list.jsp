<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<h1>충전 상품 목록</h1>

<h3><a href="regist">신규등록</a></h3>

<table border="1">
	<c:forEach var="pointDto" items="${list}">
		<tr>
			<td><img src="image?pointNo=${pointDto.pointNo}"></td>
			<td>${pointDto.pointName}</td>
			<td>${pointDto.pointPrice}원</td>
			<td>${pointDto.pointCharge}포인트 충전</td>
			<td>
				<a href="edit?pointNo=${pointDto.pointNo}">수정</a>
<%-- 		<a href="/admin/item/delete?itemNo=${pointDto.pointNo}">삭제</a> 절대경로 --%>
				<a href="delete?pointNo=${pointDto.pointNo}">삭제</a>
			</td>
		</tr>
	</c:forEach>
</table>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>