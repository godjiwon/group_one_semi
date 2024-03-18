<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>    


<style>
*{
	font-family: 빙그레 메로나체, sans-serif;
}
.success:hover {
	transform: rotate(360deg);
   	transition : transform 1s;
}
</style>
    
<div class="container w-500">
	<div class="cell center my-50"> 
		<h1>가게 정보 변경이 완료되었습니다!</h1>
	</div>
	<div class="cell center my-50">
		<img  class="success" src="/image/pocketball.png" width="100px">
	</div>
	<div class="cell center my-50">
		<a href="/store/list" class="link">
			<i class="fa-solid fa-list-ul"></i>
			가게 목록
		</a>
	</div>
</div>





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>