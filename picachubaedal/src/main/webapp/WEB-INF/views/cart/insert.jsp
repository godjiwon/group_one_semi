<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<div class="container w-500">

	<form action="insert" method="post" autocomplete="off">
		<div class="cell center">
			<h1>장바구니등록(담기테스트)</h1>
		</div>

		<div class="cell">
			<label>멤버번호(밸류테스트)</label> <input type="text" name="memberNo"
				class="tool w-100" value="<%=session.getAttribute("memberNo")%>">
		</div>


		<div class="cell">
			<label>메뉴번호(나중에 dto.메뉴번호 반복문)</label> <input type="text"
				name="menuNo" placeholder="메뉴이름써라" class="tool w-100">
		</div>

		<div class="cell">
			<label>아이템이름(나중에 dto.메뉴이름 반복문)</label> <input type="text" name="itemName"
				placeholder="아이템이름(메뉴이름)" class="tool w-100">
		</div>

		<div class="cell">
			<label>아이템가격(나중에 dto.메뉴가격 반복문)</label> <input type="text" name="itemPrice"
				placeholder="아이템가격(메뉴가격)" class="tool w-100">
		</div>

		<div class="cell">
			<label>아이템수량(나중에 dto.메뉴수량 반복문)</label> <input type="text" name="itemQuantify"
				placeholder="아이템수량(메뉴수량)" class="tool w-100">
		</div>

		<div>
			<button type="submit" class="btn positive"
				style="background-color: rgb(254, 210, 61);">
				<i class="fa-solid fa-user"></i> 메뉴등록
			</button>
		</div>

	</form>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>