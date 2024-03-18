<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.category {
		text-decoration : none;
		color: #2d3436;
		padding: 30px; 
}
	}
</style>
</head>
<body>
<div class="container center w-800">
	<form action="#" method="get" autocomplete="off">
	<div class="cell center my-50" style="position: relative; display: inline-block;">
		<input type="text" class="tool w-80" size="25" placeholder="메뉴 검색">
		<button type="button" class="btn tool menu_seach" style="background-color:rgb(254,210,61);">
			<i class="fa-solid fa-magnifying-glass"></i>
		</button>
	</div>
	</form>

	<br><br>

<div class="cell center">
	<a href="#" class="category">
		치킨<img src="https://media.discordapp.net/attachments/1187318496942628876/1218122788485992449/image0.jpg?ex=66068440&is=65f40f40&hm=ec7ef7954591f58f89ca309828ab4161c6f33b923b02051b2916dcf5b2041294&=&format=webp">
	</a>
	<a href="#" class="category">
		피자 <img src="https://media.discordapp.net/attachments/1187318496942628876/1218122853250236529/image0.jpg?ex=6606844f&is=65f40f4f&hm=e50e3b7c614936111a4fa91c296efd97cbd300397dfa63c9d20d14b7bc651a05&=&format=webp">
	</a>
	<a href="#" class="category">
		중식<img src="https://media.discordapp.net/attachments/1187318496942628876/1218122456359899196/image0.jpg?ex=660683f1&is=65f40ef1&hm=d287dcb573221b40eaa37566038d51acb1739349ad3fa97e077f1aac50537ec3&=&format=webp">
	</a>
	<a href="#" class="category">
		한식<img src="https://media.discordapp.net/attachments/1187318496942628876/1218123161405624430/image0.jpg?ex=66068499&is=65f40f99&hm=7896af7406ef73d7bc46257ff1545611fc6f262b480e5ad2bc848367f9ad5f11&=&format=webp">
	</a>
</div>
<div class="cell center">
	<a href="#" class="category">
		일식<img src="https://media.discordapp.net/attachments/1187318496942628876/1218123251591544832/image0.jpg?ex=660684ae&is=65f40fae&hm=cdaa532ed83c07d08a53f8f2569a04dd5f3d208d362497cbb3b4bd622b2c66b1&=&format=webp">
	</a>
	<a href="#" class="category">
		야식<img src="https://media.discordapp.net/attachments/1187318496942628876/1218123415324590170/image0.jpg?ex=660684d5&is=65f40fd5&hm=76d3d6399f074a3e19bcb7db68ab7025143e0c8eeb0a0a73cdccb2872864fb83&=&format=webp">
	</a>
	<a href="#" class="category">
		분식<img src="https://media.discordapp.net/attachments/1187318496942628876/1218123475240357888/image0.jpg?ex=660684e4&is=65f40fe4&hm=afe6026b2cbf238c0b0d7a545a4e8455cac496d54f698b07c87a1cbe90b7edbc&=&format=webp">
	</a>
	<a href="#" class="category">
		카페<img src="https://cdn.discordapp.com/attachments/1187318496942628876/1218123541439053844/image0.jpg?ex=660684f3&is=65f40ff3&hm=f18cf93c233c619a3e125b5d257f9935bc765cc643a3e2551a8786ed4e9457bf&">
	</a>
</div>
	</div>
<br><br><br><br>


</body>
</html>
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


