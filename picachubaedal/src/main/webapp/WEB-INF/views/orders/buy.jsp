<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
* {
	font-family: 빙그레 메로나체, sans-serif;
}

.container {
	display: grid;
	margin-top: 50px;
	margin-bottom: 50px;
	padding: 60px;
	border: 1px solid #ffffff;
	background-color: #ffffff;
	box-shadow: 0 0 5px 5px rgb(255, 245, 213);
	padding: 60px;
}

.buyBox {
	border: 2px solid rgb(255, 227, 118);
	border-radius: 10px;
	padding: 10px;
}

.ms-100 {
	margin-left: 100px;
}

.typeTool {
	font-size: 16px;
	padding: 5px;
	outline: none;
	border: 1px solid #636e72;
	border-radius: 0.2em;
}

.btn-notpay {
	display: inline;
	color: #2d3436;
	background-color: rgb(233, 233, 233);
	text-align: center;
	cursor: pointer;
	border: none;
}

.btn-pay {
	display: inline;
	color: #2d3436;
	background-color: rgb(254, 210, 61);
	text-align: center;
	cursor: pointer;
	border: none;
}
</style>

<script type="text/javascript">
	//하나씩 체크되게
	//카드일 때 
	function uncheckOtherRadios(clickedRadio) {
		var allRadios = document
				.querySelectorAll(".cardCheck, .meetCheck, .kakaoCheck");
		allRadios.forEach(function(radio) {
			if (radio !== clickedRadio) {
				radio.checked = false;
			}
		});
	}
	function uncheckCard() {
		var cardCheck = document.querySelector(".cardCheck");
		if (cardCheck.checked) {
			uncheckOtherRadios(cardCheck);
		}
	}
	function uncheckMeet() {
		var meetCheck = document.querySelector(".meetCheck");
		if (meetCheck.checked) {
			uncheckOtherRadios(meetCheck);
		}
	}
	function uncheckKakao() {
		var kakaoCheck = document.querySelector(".kakaoCheck");
		if (kakaoCheck.checked) {
			uncheckOtherRadios(kakaoCheck);
		}
	}
	function checkPayRequired() {
		// 필수 체크박스의 상태를 가져옵니다.
		var cardCheckBox = document.querySelector(".cardCheck");
		var meetCheckBox = document.querySelector(".meetCheck");
		var kakaoCheckBox = document.querySelector(".kakaoCheck");
		// 버튼과 필수 체크박스를 연결합니다.
		var buttons = document.querySelectorAll(".buy");
		// 필수 체크박스 중 하나라도 선택되었는지 확인합니다.
		var isChecked = cardCheckBox.checked || meetCheckBox.checked
				|| kakaoCheckBox.checked;
		buttons.forEach(function(button) {
			// 버튼에 대한 클래스를 변경하고 활성화/비활성화합니다.
			button.classList.remove("btn-notpay");
			button.classList.add(isChecked ? "btn-pay" : "btn-notpay");
			button.disabled = !isChecked;
		});
	}
	//결제하기 때 알림창
	$(function() {
		$(".buy").click(function() {
			var message = $(this).data("message");
			if (message == undefined) {
				message = "결제 하시겠습니까?"
			}
			var choice = window.confirm(message);
			return choice;
		});
	});
</script>

<div class="container w-600">
	<div class="cell center">
		<h1>결제페이지</h1>
	</div>
	<form action="buy" method="post">
		<div class="cell buyBox">
			<div class="cell flex-cell">
				가게 이름<input type="text" name="storeNo" value="${dto.storeName}"
					readonly>
			</div>
			<hr style="border-top: 1px solid rgb(255, 227, 118);">
			<div class="cell flex-cell">
				<div class="cell w-50">
					메뉴이름<input type="text" name="ordersItemName"
						value="${dto.purchaseList}" readonly>
				</div>

			</div>
			<div class="cell flex-cell">
				<div class="cell w-50">
					총 가격<input type="text" name="ordersTotal" value="${dto.total}"
						readonly>
				</div>
				<div class="cell">
					<i class="fa-solid fa-plus" style="color: #2d3436;"></i>
				</div>
				<div class="cell ms-10">
					배달비(스토어정보)<input type="text" name="storeDtip"
						value="${dto.storeDtip}" readonly>
				</div>
			</div>
			<div class="cell mt-20">
				<label>
					<h3>
						총 금액<input type="text" name="ordersTotal" value="${dto.total}"
							readonly>
					</h3>
				</label>
			</div>
		</div>

		<div class="cell">
			<label>회원 주소</label><br> 주소 1<input type="text"
				name="memberAddress1" value="<%=session.getAttribute("memberAddress1")%>">
			<br> 주소 2<input type="text" name="memberAddress2"
				value="<%=session.getAttribute("memberAddress2")%>">
		</div>

		<%-- store type이 배달,포장일 때 선택하게 보이기 / 둘 중 하나만 있으면 출력해서 보여주기만. --%>
		<div class="cell">
			<select class="typeTool" name="ordersType">
				<option value="">주문 타입</option>
				<option value="배달">배달</option>
				<option value="포장">포장</option>
			</select>

			<%-- 선택 안되면 타입 선택하게 onblur ? --%>
			<div class="fail-feedback">주문 타입을 선택하세요.</div>
		</div>


		<div class="cell">
			<label>요청사항</label> <input type="text" class="typeTool w-100"
				name="ordersRequest" placeholder="요청사항을 입력하세요.(최대 **글자)">
		</div>
		<div class="cell">
			<h2>
				결제 수단 선택 <i class="fa-solid fa-asterisk red"></i>
			</h2>
			<div class="cell flex-cell my-30">
				<div class="w-50">
					<span> <input type="radio" class="cardCheck check-required"
						name="ordersPay" value="카드 결제" onclick="uncheckOtherRadios(this)"
						oninput="checkPayRequired();"> 카드 결제 <i
						class="fa-regular fa-credit-card gray"></i>
					</span>
				</div>
				<div class="w-50">
					<span> <input type="radio" class="meetCheck check-required"
						name="ordersPay" value="만나서 결제" onclick="uncheckOtherRadios(this)"
						oninput="checkPayRequired();"> 만나서 결제 <i
						class="fa-solid fa-sack-dollar gray"></i>
					</span>
				</div>
				<div class="w-50">
					<span> <input type="radio" class="kakaoCheck check-required"
						name="ordersPay" value="카카오 페이" onclick="uncheckOtherRadios(this)"
						oninput="checkPayRequired();"> 카카오 페이 <i
						class="fa-solid fa-comments-dollar gray"></i>
					</span>
				</div>
			</div>
		</div>

		<div class="cell center mt-50">
			<button class="btn btn-notpay buy" disabled>결제하기</button>
		</div>
	</form>
</div>
<%-- 
<h1>테스트용 구매페이지</h1>
<form action="buy" method="post">
	멤버넘버 임시(나중에히든) <input type="text" name="memberNo"
		value="<%=session.getAttribute("memberNo")%>">
	<div>
		가게 번호<input type="text" name="storeNo">
	</div>
	<div>
		메뉴이름및수량 <input type="text" name="ordersItemName">
	</div>
	<div>
		요청사항<input type="text" name="ordersRequest">
	</div>
	<div>
		<label>타입</label> <select name="ordersType">
			<option value="">배달,포장</option>
			<option value="배달">배달</option>
			<option value="포장">포장</option>
		</select>
	</div>
	<div>
		총금액<input type="text" name="ordersTotal">
	</div>
	<div>
		<label>결제수단</label> <select name="ordersPay">
			<option value="">결제수단</option>
			<option value="카드">카드</option>
			<option value="계좌이체">계좌이체</option>
		</select>
	</div>
	<button>결제</button>
</form>
--%>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>