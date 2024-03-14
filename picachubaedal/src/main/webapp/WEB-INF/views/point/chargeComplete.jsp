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
	<div class="cell center p-20">
		<h2 style="font-family:빙그레 메로나체, sans-serif">포인트 충전 완료!</h2>
		<img src="/image/pocketball.png" class="thx">
	</div>
	<div class="cell center p-20">
		<span>충전해 주셔서 감사합니다.</span>
	</div>
	<div class="cell right">
		<a href="/point/charge" class="link">
			<i class="fa-regular fa-credit-card green"></i>
			포켓볼 추가 구매
		</a>
	</div>
	<div class="cell right">
		<a href="/member/mypage" class="link">
			<i class="fa-solid fa-user" style="color:rgb(254,210,61)"></i>
			내 정보
		</a>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

