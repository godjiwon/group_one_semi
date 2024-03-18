<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.thx {
    	width : 10%;
     }
    .thx:hover {
        transform: rotate(360deg);
        transition : transform 1s;
    }
</style>

<div class="container w-800">
	<div class="cell center p-20 my-50">
		<h2 style="font-family:빙그레 메로나체, sans-serif">포켓볼 등록 완료!</h2>
		<img src="/image/pocketball.png" class="thx">
	</div>
	<div class="cell right">
		<a href="/point/regist" class="link">
			<i class="fa-solid fa-plus green"></i>
			포켓볼 추가 등록
		</a>
	</div>
	<div class="cell right">
		<a href="/point/list" class="link">
			<i class="fa-solid fa-bars" style="color:rgb(197,88,18)"></i>
			포켓볼 상품 목록
		</a>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>