<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
*{
	font-family: 빙그레 메로나체, sans-serif;
}
</style>

<div class="container w-500 my-50">
<div class="cell center">
	<h1>가게 등록 완료!</h1>
	<br>
	<br> <img class="img center"
		src=https://media.giphy.com/media/sdR7KXjYmKegU/giphy.gif><br>
	<br> <br>
	<br>
</div>
<div class="cell center my-50">
		<a href="/store/list" class="link">
			<i class="fa-solid fa-list-ul"></i>
			가게 목록
		</a>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>