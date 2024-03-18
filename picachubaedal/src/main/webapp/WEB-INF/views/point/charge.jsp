<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
* {
	font-family: 빙그레 메로나체, sans-serif;
}

.charge-item {
	width: 70%;
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

.hr-pay {
	background: rgb(233, 88, 43);
	width : 500px;
	height: 1px;
	border: 0;
}
</style>

<!-- jquery cdn -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<!-- 내가 만든 스크립트 추가(jQuery를 사용했으니 jQuery CDN 아래 작성) -->
<script src="commons.js"></script>
<!-- javascript를 의도적으로 head 자리에 배치해서 가장 먼저 실행되도록 구현-->
<script type="text/javascript">
	//하나씩 체크되게
	function uncheckCard() {
		var cardCheck = document.querySelector(".cardCheck");
		if (cardCheck.checked) {
			var accountCheck = document.querySelector(".accountCheck");
			accountCheck.checked = false;
		}
	}
	function uncheckAccount() {
		var accountCheck = document.querySelector(".accountCheck");
		if (accountCheck.checked) {
			var cardCheck = document.querySelector(".cardCheck");
			cardCheck.checked = false;
		}
	}

	//결제 수단 선택해야 구매 가능하게
	function checkPayRequired() {
		// 필수 체크박스의 상태를 가져옵니다.
		var cardCheckbox = document.querySelector(".cardCheck");
		var accountCheckbox = document.querySelector(".accountCheck");

		// 버튼과 필수 체크박스를 연결합니다.
		var buttons = document.querySelectorAll(".buy-charge");

		// 필수 체크박스 중 하나라도 선택되었는지 확인합니다.
		var isChecked = cardCheckbox.checked || accountCheckbox.checked;

		// 버튼에 대한 클래스를 변경합니다.
		buttons.forEach(function(button) {
			button.classList.remove("btn-notpay");
			button.classList.add(isChecked ? "btn-pay" : "btn-notpay");
			button.disabled = !isChecked;
		});
	}

	$(function() {
		$(".buy-charge").click(function() {
			var message = $(this).data("message");
			if (message == undefined) {
				message = "결제 하시겠습니까?"
			}
			var choice = window.confirm(message);
			return choice;
		});
	});
</script>
</head>

<body>

	<div class="container w-800">
		<div class="cell center my-50">
			<h1>포켓볼 충전</h1>
		</div>

		<hr class="hr-pay">
		<div class="cell center">
			<h3>
				<i class="fa-solid fa-asterisk red"></i>
				결제 수단 선택
			</h3>
		</div>

		<div class="cell flex-cell my-30">
			<div class="w-50 right">
				<span> <input type="radio" class="cardCheck check-required" onclick="uncheckCard();" oninput="checkPayRequired();">
					카드결제
					<i class="fa-regular fa-credit-card"></i>
				</span>
			</div>
			<div class="w-50">
				<span> <input type="radio"
					class="accountCheck check-required" onclick="uncheckAccount();" oninput="checkPayRequired();">
					계좌 이체
					<i class="fa-solid fa-sack-dollar"></i>
				</span>
			</div>
		</div>
		<hr class="hr-pay">

		<div class="cell flex-cell my-50">
			<div class="w-50 center p-20">
				<form action="charge" method="post" autocomplete="off">
					<input type="hidden" name="pointCharge" value="10">
					<img src="/image/pb10.png" class="charge-item"><br>
					<button class="btn btn-notpay buy-charge" disabled>구매</button>
				</form>
			</div>
			<div class="w-50 center p-20">
				<form action="charge" method="post" autocomplete="off">
					<input type="hidden" name="pointCharge" value="20">
					<img src="/image/pb20.png" class="charge-item"><br>
					<button class="btn btn-notpay buy-charge" disabled>구매</button>
				</form>
			</div>
		</div>
		<div class="cell flex-cell my-50">
			<div class="w-50 center p-20">
				<form action="charge" method="post" autocomplete="off">
					<input type="hidden" name="pointCharge" value="30">
					<img src="/image/pb30.png" class="charge-item"><br>
					<button class="btn btn-notpay buy-charge" disabled>구매</button>
				</form>
			</div>
			<div class="w-50 center p-20">
				<form action="charge" method="post" autocomplete="off">
					<input type="hidden" name="pointCharge" value="50">
					<img src="/image/pb50.png" class="charge-item"><br>
					<button class="btn btn-notpay buy-charge" disabled>구매</button>
				</form>
			</div>
		</div>
	</div>

</body>

</html>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>