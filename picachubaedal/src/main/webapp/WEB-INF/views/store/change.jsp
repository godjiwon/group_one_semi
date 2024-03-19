<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가게 등록 페이지</title>

<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- 내가 구현한 스타일 -->
<link rel="stylesheet" type="text/css" href="../css/commons.css">
<link rel="stylesheet" type="text/css" href="../css/test.css">

<!-- font awesome 아이콘 CDN -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
</style>

<!-- jquery cdn -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<!-- 내가 만든 스크립트 추가(jQuery를 사용했으니 jQuery CDN 아래 작성) -->

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- javascript를 의도적으로 head 자리에 배치해서 가장 먼저 실행되도록 구현-->
<script type="text/javascript">

        
$(document).ready(function() {
    // 서버에서 기존 가게 정보를 가져와서 해당 입력 필드에 채움
    $("#storeName").val("${dto.storeName}");
    $("#store_post").val("${dto.storePost}");
    $("#store_address1").val("${dto.storeAddress1}");
    $("#store_address2").val("${dto.storeAddress2}");
    $("#store_category").val("${dto.storeCategory}");
    $("#store_type").val("${dto.storeType}");
    $("#store_contact").val("${dto.storeContact}");
    $("#store_intro").val("${dto.storeIntro}");
    $("#store_dtip").val("${dto.storeDtip}");
    $("#store_minprice").val("${dto.storeMinprice}");
    $("#store_like").val("${dto.storeLike}");
    $("#store_open_hour").val("${dto.storeOpenHour}");
    $("#store_close_hour").val("${dto.storeCloseHour}");
    $("#store_delivery").val("${dto.storeDelivery}");
    $("#store_closed").val("${dto.storeClosed}");
    $("#store_business_number").val("${dto.storeBusinessNumber}");
    // 여기에 필요한 입력 필드들의 기존 정보를 가져와서 채우는 코드 추가
});

// 폼 전송 시 실행되는 부분
$(".check-form").submit(function() {
    // 각 입력 필드에 대해 기존 정보를 유지하고 사용자가 입력한 값만 업데이트
    $("[name=storeName]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeName}");
        }
    });
    $("[name=storePost]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storePost}");
        }
    });
    $("[name=storeAddress1]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeAddress1}");
        }
    });
    $("[name=storeAddress2]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeAddress2}");
        }
    });
    $("[name=storeCategory]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeCategory}");
        }
    });
    $("[name=storeType]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeType}");
        }
    });
    $("[name=storeContact]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeContact}");
        }
    });
    $("[name=storeIntro]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeIntro}");
        }
    });
    $("[name=storeDtip]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeDtip}");
        }
    });
    $("[name=storeMinprice]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeMinprice}");
        }
    });
    $("[name=storeLike]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeLike}");
        }
    });
    $("[name=storeOpenHour]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeOpenHour}");
        }
    });
    $("[name=storeCloseHour]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeCloseHour}");
        }
    });
    $("[name=storeDelivery]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeDelivery}");
        }
    });
    $("[name=storeClosed]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeClosed}");
        }
    });
    $("[name=storeBusinessNumber]").each(function() {
        if ($(this).val().trim() === '') {
            $(this).val("${dto.storeBusinessNumber}");
        }
    });

    // 유효성 검사 없이 폼을 제출
    return true;
});

	    
	
	    //주소는 세 개의 입력창이 모두 입력되거나 안되거나 둘 중 하나
	    $("[name=storeAddress2]").blur(function(){
	        var post = $("[name=storePost]").val();
	        var address1 = $("[name=storeAddress1]").val();
	        var address2 = $("[name=storeAddress2]").val();
	
	        var isClear = post.length == 0 && address1.length == 0 && address2.length == 0;
	        var isFill = post.length > 0 && address1.length > 0 && address2.length > 0;
	
	        state.storeAddressValid = isClear || isFill;
	
	        $("[name=storePost], [name=storeAddress1], [name=storeAddress2]")
	                .removeClass("success fail")
	                .addClass(state.storeAddressValid ? "success" : "fail");
	    });
	
	 // 폼 전송 시 실행되는 부분
	    $(".check-form").submit(function() {
	        // 각 입력 필드에 대해 기존 정보를 유지하고 사용자가 입력한 값만 업데이트
	        $("[name=storeName]").each(function() {
	            if ($(this).val().trim() === '') {
	                $(this).val("${dto.storeName}");
	            }
	            // 여기에 다른 필드들에 대한 로직 추가
	        });
	    
	    var storeTypes = [];
	    $(".storeType").change(function() {
	        storeTypes = []; // 기존 값 초기화
	        $(".storeType:checked").each(function() {
	            storeTypes.push($(this).val());
	        });
	    });
	    
	    function checkStoreType() {
	        var selectedType = document.getElementById("storeType").value;
	        var successFeedback = document.querySelector(".success-feedback");
	        var failFeedback = document.querySelector(".fail-feedback");

	        if (selectedCategory !== "") {
	            // 유효한 카테고리가 선택된 경우
	            successFeedback.style.display = "block";
	            failFeedback.style.display = "none";
	        } else {
	            // 유효하지 않은 카테고리가 선택된 경우
	            successFeedback.style.display = "none";
	            failFeedback.style.display = "block";
	        }
	    }
	    
	    function checkStoreCategory() {
	        var selectedCategory = document.getElementById("storeCategory").value;
	        var successFeedback = document.querySelector(".success-feedback");
	        var failFeedback = document.querySelector(".fail-feedback");

	        if (selectedCategory !== "") {
	            // 유효한 카테고리가 선택된 경우
	            successFeedback.style.display = "block";
	            failFeedback.style.display = "none";
	        } else {
	            // 유효하지 않은 카테고리가 선택된 경우
	            successFeedback.style.display = "none";
	            failFeedback.style.display = "block";
	        }
	    }
	    
	    function checkStoreClosed() {
	        var checkboxes = document.getElementsByName("storeClosed");
	        var successFeedback = document.querySelector(".success-feedback");
	        var failFeedback = document.querySelector(".fail-feedback");

	        var selectedDays = [];
	        for (var i = 0; i < checkboxes.length; i++) {
	            if (checkboxes[i].checked) {
	                selectedDays.push(checkboxes[i].value);
	            }
	        }

	        if (selectedDays.length > 0) {
	            // 최소한 하나 이상의 요일이 선택된 경우
	            successFeedback.style.display = "block";
	            failFeedback.style.display = "none";
	        } else {
	            // 어떤 요일도 선택되지 않은 경우
	            successFeedback.style.display = "none";
	            failFeedback.style.display = "block";
	        }
	    }

	    
	    


	});
</script>
<!-- 카카오 api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
    $(function(){
        $(".btn-address-search").click(function(){
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    $("[name=storePost]").val(data.zonecode);
                    $("[name=storeAddress1]").val(addr);
                    
                    // 커서를 상세주소 필드로 이동한다.
                    $("[name=storeAddress2]").focus();
                }
            }).open();
        });
        
        $(".btn-address-clear").click(function(){
        	$("[name=storePost]").val("");
        	$("[name=storeAddress1]").val("");
        	$("[name=storeAddress2]").val("");
        });
    });
    
   



    
</script>
<body>

	<form action="insert1" method="post" enctype="multipart/form-data"
		autocomplete="off" class="check-form">


		<div class="container w-500">
			<h2>가게 정보 수정</h2>
			<div class="cell">

				<div class="cell">
					<label> 가게 이름 <i class="fa-solid fa-asterisk red"></i>
					</label> <input type="text" id="storeName" name="storeName"
						placeholder="가게 이름을 작성해주세요" class="tool w-100"
						onblur="checkstoreName()" value="${dto.storeName}">

					<div class="cell page">
						<!-- 주소 : 모두 입력하든가 입력하지 않든가 -->
						<div class="cell">

							<div class="cell">
								<div>현재주소 : ${dto.storeAddress1} ${dto.storeAddress2}</div>
							</div>

							<label>주소 변경하기</label>
						</div>
						<div class="cell">
							<input type="text" name="storePost" readonly placeholder="우편번호"
								class="tool" size="6" maxlength="6">
							<button type="button" class="btn positive btn-address-search">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
							<button type="button" class="btn negative btn-address-clear">
								<i class="fa-solid fa-xmark"></i>
							</button>
						</div>
						<div class="cell">
							<input type="text" name="storeAddress1" placeholder="기본주소"
								class="tool w-100" readonly>
						</div>
						<div class="cell">
							<input type="text" name="storeAddress2" placeholder="상세주소"
								class="tool w-100">
							<div class="success-feedback">
								<i class="fa-solid fa-check"></i>
							</div>

							<div class="cell">
								<label> 음식 카테고리 <i class="fa-solid fa-asterisk red"></i>
								</label> <select class="tool w-100" id="storeCategory"
									name="storeCategory" onblur="checkStoreCategory()">
									<option value="">선택하세요</option>
									<option value="치킨">치킨</option>
									<option value="피자/양식">피자/양식</option>
									<option value="중국집">중국집</option>
									<option value="한식">한식</option>
									<option value="일식/돈까스">일식/돈까스</option>
									<option value="족발/보쌈">족발/보쌈</option>
									<option value="야식">야식</option>
									<option value="분식">분식</option>
									<option value="카페/디저트">카페/디저트</option>
								</select>
								<div class="success-feedback">
									<i class="fa-solid fa-check"></i>
								</div>

								<div class="cell">
									<label> 배달/포장 가능 여부 <i class="fa-solid fa-asterisk red"></i>
									</label>
									<div class="cell">
										<input type="checkbox" id="delivery" name="storeType"
											class="storeType" value="배달"> 배달만 <input
											type="checkbox" id="takeout" name="storeType"
											class="storeType" value="포장"> 포장만 <input
											type="checkbox" id="takeout" name="storeType"
											class="storeType" value="배달,포장"> 배달,포장 모두 가능

									</div>
								</div>

								<div class="cell">
									<label> 가게 연락처 <i class="fa-solid fa-asterisk red"></i>
									</label> <input type="text" name="storeContact"
										placeholder=" - 제외 숫자만 입력하세요" class="tool w-100"
										onblur="checkStoreContact()">
									<div class="success-feedback">
										<i class="fa-solid fa-check"></i>
									</div>
									<div class="fail-feedback">
										<i class="fa-solid fa-triangle-exclamation"></i> 잘못된 전화번호
										형식입니다
									</div>
								</div>
							</div>



							<div class="cell page">
								<div class="cell">
									<label>가게 이미지</label> <input type="file" name="attach"
										class="tool w-100">
								</div>

								<div class="flex-cell"></div>
							</div>
						</div>




						<div class="cell storeIntro">
							<label> 가게 소개글 </label>
							<textarea class="tool w-100" name="storeIntro"></textarea>
						</div>
						<div class="cell">
							<label> 배달팁<!-- 포켓볼 사진 input에 추가  --> <i
								class="fa-solid fa-asterisk red"></i>
							</label> <input type="text" name="storeDtip" placeholder="ex.3,000원"
								class="tool w-100">

						</div>
						<div class="cell">
							<label> 최소 주문 금액<!-- 포켓볼 사진 input에 추가  --> <i
								class="fa-solid fa-asterisk red"></i>
							</label> <input type="text" name="storeMinprice" placeholder="ex.12,000원"
								class="tool w-100">

						</div>

						<div class="cell">
							<label> 영업시간 <i class="fa-solid fa-asterisk red"></i>
							</label> <select class="tool w-100" id="storeOpenHour"
								name="storeOpenHour" onblur="checkStoreOpenHour()">
								<option value="">운영 시작 시간</option>
								<option value="00:00">00:00</option>
								<option value="01:00">01:00</option>
								<option value="02:00">02:00</option>
								<option value="03:00">03:00</option>
								<option value="04:00">04:00</option>
								<option value="05:00">05:00</option>
								<option value="06:00">06:00</option>
								<option value="07:00">07:00</option>
								<option value="08:00">08:00</option>
								<option value="09:00">09:00</option>
								<option value="10:00">10:00</option>
								<option value="11:00">11:00</option>
								<option value="12:00">12:00</option>
								<option value="13:00">13:00</option>
								<option value="14:00">14:00</option>
								<option value="15:00">15:00</option>
								<option value="16:00">16:00</option>
								<option value="17:00">17:00</option>
								<option value="18:00">18:00</option>
								<option value="19:00">19:00</option>
								<option value="20:00">20:00</option>
								<option value="21:00">21:00</option>
								<option value="22:00">22:00</option>
								<option value="23:00">23:00</option>
								<option value="24:00">24:00</option>
							</select> <span>부터</span> <select class="tool w-100" id="storeCloseHour"
								name="storeCloseHour">
								<option value="">운영 종료 시간</option>
								<option value="00:00">00:00</option>
								<option value="01:00">01:00</option>
								<option value="02:00">02:00</option>
								<option value="03:00">03:00</option>
								<option value="04:00">04:00</option>
								<option value="05:00">05:00</option>
								<option value="06:00">06:00</option>
								<option value="07:00">07:00</option>
								<option value="08:00">08:00</option>
								<option value="09:00">09:00</option>
								<option value="10:00">10:00</option>
								<option value="11:00">11:00</option>
								<option value="12:00">12:00</option>
								<option value="13:00">13:00</option>
								<option value="14:00">14:00</option>
								<option value="15:00">15:00</option>
								<option value="16:00">16:00</option>
								<option value="17:00">17:00</option>
								<option value="18:00">18:00</option>
								<option value="19:00">19:00</option>
								<option value="20:00">20:00</option>
								<option value="21:00">21:00</option>
								<option value="22:00">22:00</option>
								<option value="23:00">23:00</option>
								<option value="24:00">24:00</option>
							</select> <span>까지 운영합니다.</span>

							<div class="cell" name="storeClosed">
								<label> 휴무일 선택 </label>
								<div class="cell center">
									<input type="checkbox" id="monday" name="storeClosed"
										value="월요일"> <label for="monday">월요일</label> <input
										type="checkbox" id="tuesday" name="storeClosed" value="화요일">
									<label for="tuesday">화요일</label> <input type="checkbox"
										id="wednesday" name="storeClosed" value="수요일"> <label
										for="wednesday">수요일</label> <input type="checkbox"
										id="thursday" name="storeClosed" value="목요일"> <label
										for="thursday">목요일</label> <input type="checkbox" id="friday"
										name="storeClosed" value="금요일"> <label for="friday">금요일</label>

									<input type="checkbox" id="saturday" name="storeClosed"
										value="토요일"> <label for="saturday">토요일</label> <input
										type="checkbox" id="sunday" name="storeClosed" value="일요일">
									<label for="sunday">일요일</label>

								</div>
							</div>
							<div class="cell">
								<label> 배달 가능 지역 <i class="fa-solid fa-asterisk red"></i>
								</label> <input type="text" name="storeDelivery"
									placeholder="ex.노원구(구 단위만 입력)" class="tool w-100">
							</div>
						</div>

						<div class="cell right">
							<button class="btn positive w-100" type="submit">등록하기</button>
						</div>
					</div>
	</form>
=======
    <meta charset="UTF-8">
    <title>가게 정보 수정 임시</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        form {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        h1 {
            text-align: center;
        }
        input[type="text"] {
            width: calc(100% - 20px);
            margin-bottom: 10px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h1>가게 정보 수정 임시</h1>

<form action="change" method="post">
    <input type="hidden" name="storeNo" value="${dto.storeNo}">
    
    <label for="storeName">가게 이름</label>
    <input type="text" id="storeName" name="storeName" value="${dto.storeName}">
    <br>
    
    <label for="storeAddress">가게 주소</label>
    <input type="text" id="storeAddress" name="storeAddress" value="${dto.storeAddress}">
    <br>
    
    <label for="storeCategory">음식 카테고리</label>
    <input type="text" id="storeCategory" name="storeCategory" value="${dto.storeCategory}">
    <br>
    
    <label for="storeType">배달/포장 여부</label>
    <input type="text" id="storeType" name="storeType" value="${dto.storeType}">
    <br>
    
    <label for="storeContact">연락처</label>
    <input type="text" id="storeContact" name="storeContact" value="${dto.storeContact}">
    <br>
    
    <label for="storeImage">가게 사진</label>
    <input type="text" id="storeImage" name="storeImage" value="${dto.storeImage}">
    <br>
    
    <label for="storeIntro">가게 소개글</label>
    <input type="text" id="storeIntro" name="storeIntro" value="${dto.storeIntro}">
    <br>
    
    <label for="storeDtip">배달팁</label>
    <input type="text" id="storeDtip" name="storeDtip" value="${dto.storeDtip}">
    <br>
    
    <label for="storeMinprice">최소 주문금액</label>
    <input type="text" id="storeMinprice" name="storeMinprice" value="${dto.storeMinprice}">
    <br>
    
    <label for="storeHours">가게 운영시간</label>
    <input type="text" id="storeHours" name="storeHours" value="${dto.storeHours}">
    <br>
    
    <label for="storeDelivery">배달 가능 지역</label>
    <input type="text" id="storeDelivery" name="storeDelivery" value="${dto.storeDelivery}">
    <br>
    
    <label for="storeClosed">가게 휴무일</label>
    <input type="text" id="storeClosed" name="storeClosed" value="${dto.storeClosed}">
    <br>
    
    <button type="submit">변경하기</button>
</form>

</body>
</html>
