<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>    

<style>
*{
	font-family: 빙그레 메로나체, sans-serif;
}
</style>
    
<div class="container w-500">
	<div class="cell center my-50">
		<img src="/image/pikachu-dduk.png" width="200px;">
	</div>
	<div class="cell center"> 
		<h1 style="color:rgb(232,79,31);">존재하지 않는 가게입니다</h1>
	</div>
	<div class="cell center my-50">
	<a href="/store/change" class="link">
		<i class="fa-solid fa-reply"></i>
		다시 시도
	</a>
</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>