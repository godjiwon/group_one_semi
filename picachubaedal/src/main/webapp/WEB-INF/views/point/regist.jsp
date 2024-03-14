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
	box-shadow: 0 0 10px 10px #ccc;
	padding: 60px;
}

.title-icon {
	margin-top: 30px;
	margin-bottom: 30px;;
	color: rgb(254, 210, 61);
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
				<h3>포켓볼 충전 등록</h3>
			</div>
			<div class="cell">
				<label>이미지</label> <input type="file" name="attach"
					class="tool w-100">
			</div>
			<div>
				<label>상품명</label> <input type="text" class="tool w-100"
					placeholder="상품명" name="pointName">
				<div class="fail-feedback">이름을 반드시 작성하세요</div>
			</div>
			<div>
				<label>판매가</label> <input type="text" class="tool w-100"
					placeholder="판매 할 가격" name="pointPrice">
				<div class="fail-feedback">가격을 작성하세요</div>
			</div>
			<div>
				<label>포인트</label> <input type="text" class="tool w-100"
					placeholder="충전 할 포켓볼 개수" name="pointCharge">
				<div class="fail-feedback">포인트를 작성하세요</div>
			</div>
			<div class="cell my-30">
				<button class="btn w-100">등록</button>
			</div>

		</div>
	</form>

</body>

</html>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>