<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.container {
	display: grid;
	margin-top: 50px;
	margin-bottom: 50px; padding : 60px;
	border: 1px solid #ffffff;
	background-color: #ffffff;
	box-shadow: 0 0 5px 5px rgb(255,245,213);
	padding: 60px;
}

.btn {
	/*a태그를 버튼으로 쓸 경우*/
	color: #2d3436;
	text-decoration: none;
	/* 밑줄 제거 */
	display: inline-block;
	text-align: center;
	cursor: pointer;
	border: none;
	background-color: rgb(254, 210, 61);
}
</style>

	<!-- jquery cdn -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <!-- 내가 만든 스크립트 추가(jQuery를 사용했으니 jQuery CDN 아래 작성) -->
    <script src="commons.js"></script>
    <!-- javascript를 의도적으로 head 자리에 배치해서 가장 먼저 실행되도록 구현-->
    <script type="text/javascript">
	$(function() {
		//상태 객체
		var state = {
			pointNameValid : false,
			pointPriceValid : false,
			pointChargeValid : false,
			ok : function() {
				return this.pointNameValid && this.pointPriceValid
						&& this.pointChargeValid;
			}
		};

		$(".check-form").submit(function() {
			$(this).find("[name]").blur();

			if (state.ok()) {
				var formData = $(this).serialize();
				$.ajax({
					url : "http://localhost:8080/point/regist",
					method : "post",
					data : {formData : value},
					success : function(response) {
						console.log(response);
					},
					error : function(xhr, status, error) {
						console.error(xhr.responseText);
					}
				});
			} else {
				console.log("Form validation failed.");
			}
		});

		$("[name=pointName]").blur(
				function() {
					var regex = /^[A-Za-z가-힣0-9]+$/;
					state.pointNameValid = regex.test($(this).val());
					$(this).removeClass("success fail").addClass(
							state.pointNameValid ? "success" : "fail");
				});
		$("[name=pointPrice]").blur(
				function() {
					var regex = /^[0-9]+$/;
					state.pointPriceValid = regex.test($(this).val());
					$(this).removeClass("success fail").addClass(
							state.pointPriceValid ? "success" : "fail");
				});
		$("[name=pointCharge]").blur(
				function() {
					var regex = /^[0-9]+$/;
					state.pointChargeValid = regex.test($(this).val());
					$(this).removeClass("success fail").addClass(
							state.pointChargeValid ? "success" : "fail");
				});
	});
</script>
</head>

<body>

	<form action="regist" method="post" autocomplete="off" enctype="multipart/form-data"	
		 class="check-form">
		<div class="container w-800">
			<div class="cell center">
				<h2 style="font-family:빙그레 메로나체, sans-serif">포켓볼 충전상품 등록</h2>
			</div>
			<div class="cell">
				<label>이미지</label> <input type="file" name="attach"
					class="tool w-100">
			</div>
			<div class="cell">
				<label>상품명</label> <input type="text" class="tool w-100"
					placeholder="상품명" name="pointName">
				<div class="fail-feedback">상품명을 작성하세요</div>
			</div>
			<div class="cell">
				<label>판매가</label> <input type="text" class="tool w-100"
					placeholder="판매가격(원)" name="pointPrice">
				<div class="fail-feedback">판매가를 설정하세요</div>
			</div>
			<div class="cell">
				<label>포켓볼</label> <input type="text" class="tool w-100"
					placeholder="포켓볼(개)" name="pointCharge">
				<div class="fail-feedback">포켓볼을 설정하세요</div>
			</div>
			<div class="cell my-30">
				<button class="btn w-100">등록</button>
			</div>

		</div>
	</form>

</body>

</html>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>