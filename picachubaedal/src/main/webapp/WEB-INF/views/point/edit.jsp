<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.container {
            display: grid;
            margin-top: 50px;
            margin-bottom: 50px;
            padding: 60px;
            border: 1px solid #ffffff;
            background-color: #ffffff;
            box-shadow: 0 0 5px 5px rgb(255,245,213);
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
        $(function () {
            //상태 객체
            var state = {
                pointNameValid: false,
                pointPriceValid: false,
                pointChargeValid: false,
                ok: function () {
                    return this.pointNameValid
                        && this.pointPriceValid
                        && this.pointChargeValid;
                }
            };

        $("[name=pointName]").blur(function () {
            var regex = /^[A-Za-z가-힣0-9]+$/;
            state.pointNameValid = regex.test($(this).val());
            $(this).removeClass("success fail")
                .addClass(state.pointNameValid ? "success" : "fail");
        });
        $("[name=pointPrice]").blur(function () {
            var regex = /^[0-9]+$/;
            state.pointPriceValid = regex.test($(this).val());
            $(this).removeClass("success fail")
                .addClass(state.pointPriceValid ? "success" : "fail");
        });
        $("[name=pointCharge]").blur(function () {
            var regex = /^[0-9]+$/;
            state.pointChargeValid = regex.test($(this).val());
            $(this).removeClass("success fail")
                .addClass(state.pointChargeValid ? "success" : "fail");
        });
        });
    </script>

<div class="container w-800">
<div class="cell center">
<h2 style="font-family:빙그레 메로나체, sans-serif">포켓볼 충전 상품 수정</h2>
</div>
<form action="edit" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pointNo" value="${pointDto.pointNo}">
	
	<div class="cell">
		<label>이미지</label><br>
		<img src="image?pointNo=${pointDto.pointNo}" class="w-100" style="width:20%"> <br>
		<input type="file" class="tool w-100" name="attach">
	</div>
	<div class="cell">
		<label>상품명</label>
		<input type="text" class="tool w-100" name="pointName" value="${pointDto.pointName}" placeholder="상품명">
		<div class="fail-feedback">상품명을 작성하세요</div>
	</div>
	<div class="cell">
		<label>판매가</label>
		<input type="text" class="tool w-100" name="pointPrice" value="${pointDto.pointPrice}" placeholder="판매가격(원)">
		<div class="fail-feedback">판매가를 설정하세요</div>
	</div>
	<div class="cell">
		<label>포켓볼</label>
		<input type="text" class="tool w-100" name="pointCharge" value="${pointDto.pointCharge}" placeholder="포켓볼(개)">
		<div class="fail-feedback">포켓볼을 설정하세요</div>
	</div>
	<div class="cell my-30">
		<button class="btn w-100">변경</button>
	</div>
</form>
</div>





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>