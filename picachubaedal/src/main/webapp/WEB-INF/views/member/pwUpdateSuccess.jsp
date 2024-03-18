<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.success:hover {
	transform: rotate(360deg);
   	transition : transform 1s;
}
</style>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-800 my-50 p-50" >
	<div class="cell center">
		<h1 style="font-family: 빙그레 메로나체, sans-serif;">비밀번호 변경을 완료하였습니다.</h1>
	</div>
	<div class="cell center my-50">
		<img  class="success" src="/image/pocketball.png" width="100px">
	</div>
	<div class="cell right">
		<a href="/member/mypage" class="link">
			<i class="fa-solid fa-user"></i>
			내 정보
		</a>
	</div>
</div>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>