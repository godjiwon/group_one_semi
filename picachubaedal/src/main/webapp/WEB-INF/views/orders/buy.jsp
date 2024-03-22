<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	padding-left: 10px;
}

.ms-100 {
	margin-left: 100px;
}
.w-80{
	width:80%;
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
.storeName {
	font-weight: bold;
	font-size : 26px;
	margin-left : 20px;
}
.menuName {
	font-weight: bold;
	font-size : 20px;
	margin-left : 20px;
}
.onlydelivery{
	font-weight: bold;
	font-size : 18px;
	margin-left : 20px;
	color : rgb(233,88,43);
}
.tool {
	font-size: 16px;
    padding: -0.5em 1em;
    outline: none; /*선택 시 자동 강조효과 제거*/
    border: 1px solid rgb(254, 210, 61);
    border-radius: 5px;
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
    $(function () {
        $(".buy").click(function () {
            var message = $(this).data("message");
            if (message == undefined) {
                message = "결제 하시겠습니까?"
            }
            var yesChoice = window.confirm(message);
            if(yesChoice == true){
                alert("결제가 완료되었습니다.");
                return yesChoice;
            }
            else{
                alert("결제가 취소되었습니다.");
                return false;
            }
        });
    });

	//요청사항 글자 수 (100글자까지)
    function lengthCheck(){
        var request = document.querySelector(".request");
        var count = request.value.length;

        while(count > 100) {
            //1글자 자르는 코드
            var content = request.value;
            request.value = content.substring(0, content.length-1);
            count--;
        }
    };
</script>

<div class="container w-600">
	<div class="cell center">
		<h1>결제</h1>
	</div>
	<form action="buy" method="post">
		<div class="cell buyBox">
			<div class="cell flex-cell">
				<label class="storeName">${dto.storeName}</label>
				<input type="hidden" name="storeNo" value="${dto.storeNo}">
				<input type="hidden" name="memberId" value="<%=session.getAttribute("loginId")%>">
			</div>
			<hr style="border-top: 1px solid rgb(255, 227, 118);">
			<div class="cell flex-cell">
				<div class="cell">
					<label class="menuName">${dto.purchaseList}</label>
					<input type="hidden" name="ordersItemName" value="${dto.purchaseList}">
				</div>
			</div>
			<div class="cell flex-cell">
				<div class="cell">
					<label style="font-weight: bold;">
						<i class="fa-solid fa-motorcycle gray ms-20"></i>
						배달비
						<fmt:formatNumber value="${dto.storeDtip}" pattern="#,##0"></fmt:formatNumber>원
					</label>
				</div>
			</div>
			<div class="cell mt-20">
					<h3 class="ms-20">
						총 결제 금액 :
						<fmt:formatNumber value="${dto.total}" pattern="#,##0"></fmt:formatNumber>원
						<input type="hidden" name="ordersTotal" value="${dto.total}">
					</h3>
			</div>
		</div>

		<div class="cell ms-20">
			<label>
				<i class="fa-solid fa-house-user"></i>
				회원 주소
			</label> <br>
			<input type="text" class="tool w-80"
				name="memberAddress1" value="<%=session.getAttribute("memberAddress1")%>" readonly>
			<br>
			<input type="text" name="memberAddress2" class="tool w-80"
				value="<%=session.getAttribute("memberAddress2")%>" readonly>
		</div>

		<%-- store type이 배달,포장일 때 선택하게 보이기 / 둘 중 하나만 있으면 출력해서 보여주기만. --%>
		<div class="cell ms-20">
			<i class="fa-regular fa-clipboard"></i>
			<label>주문 타입</label> <br>
			<input type="text"  class="tool" style="width:10%" value="배달" readonly>
			<input type="hidden"  name="ordersType" value="배달">
			<label class="onlydelivery">지금은 배달 주문만 가능합니다.</label>
		</div>


		<div class="cell ms-20">
			<label>요청사항</label>
			<input type="text" class="tool typeTool w-80 request" oninput="lengthCheck();"
				name="ordersRequest" placeholder="요청사항을 입력하세요.(최대 100글자)">
		</div>
		<div class="cell ms-20">
			<h3>
				결제 수단 선택 <i class="fa-solid fa-asterisk red"></i>
			</h3>
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


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>