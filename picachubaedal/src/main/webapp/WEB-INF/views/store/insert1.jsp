<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
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
*{
	font-family:빙그레 메로나체, sans-serif;
}
.container {
	display: grid;
	margin-top: 50px;
	margin-bottom: 50px; padding : 60px;
	border: 1px solid #ffffff;
	background-color: #ffffff;
	box-shadow: 0 0 5px 5px rgb(255,245,213);
	padding: 60px;
}
</style>

<!-- jquery cdn -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<!-- 내가 만든 스크립트 추가(jQuery를 사용했으니 jQuery CDN 아래 작성) -->

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- javascript를 의도적으로 head 자리에 배치해서 가장 먼저 실행되도록 구현-->
<script type="text/javascript">

    $(function(){
	    //상태객체(React의 state로 개념이 이어짐)
	    var state = {
	        //key : value
	        storeNoValid : false,
	        storeNameValid : false,
	        storeAddress1Valid : false,
	        storeAddress2Valid : false,
	        storePostValid : false,
	        storeCategoryValid : false,
	        storeTypeValid : false,
	        storeContactValid : false, //false 필수항목 true 선택항목
	        storeIntroValid : false,
	        storeDtipValid : false,
	        storeMinpriceValid : false,
	        storeOpenHourValid : false,
	        storeCloseHourValid : false,
	        storeBusinessNumberValid : false,
	        storeClosedValid : false,
	        memberNoValid : false,
	        //객체에 함수를 변수처럼 생성할 수 있다
	        //- this는 객체 자신(자바와 동일하지만 생략이 불가능)
	        ok : function(){
	            return this.storeIdValid 
	                    && this.storeNoValid && this.storeNameValid
	                    && this.storeAddressValid && this.storeCategoryValid
	                    && this.storeTypeValid && this.storeContactValid
	                    && this.storeImageValid && this.storeIntroValid
	                    && this.storeDtipValid && this.storeMinpriceValid
	                    && this.storeHoursValid && this.storeClosedValid
	                    && this.memberNoValid;
	        },
	    };
		
	 // 사업자 등록번호 형식검사
	    $(function(){
	        $("[name=storeBusinessNumber]").blur(function(){
	        	// 수정된 정규식: 정확히 10자리의 숫자만을 허용
		        var regex = /^\d{10}$/;

		        var isValidLength = storeBusinessNumber.length === 10; // 10자리인지 확인
		        var isValidFormat = regex.test(storeBusinessNumber); // 숫자로만 이루어져 있는지 확인

		        // 10자리이면서 숫자로만 이루어져 있을 때 success 반환
		        var isValid = isValidLength && isValidFormat;
		        
	            if (isValid) {
	                $(this).removeClass("success").addClass("fail");
	            } else {
	                $(this).removeClass("fail").addClass("success");
	            }
	        });
	    });

	    
	    //전화번호 형식검사
	    $("[name=storeContact]").blur(function(){
	    	var regex = /^\d{2,3}-\d{3,4}-\d{4}$/;
	        var value = $(this).val();
	
	        if(regex.test(value)) {//전화번호 형식 검사를 통과했다면
	            $.ajax({
	                url : "/rest/store/checkstoreContact",
	                method : "post",
	                data: {
	                    storeId : value
	                },
	                success : function(response) {
	                    //console.log(response);
	                    if(response == "NNNNN") {
	                        $("[name=storeContact]").removeClass("success fail fail2").addClass("fail2");
	                        state.storeIdValid = false;
	                    }
	                    else if(response == "NNNNY") {
	                        $("[name=storeContact]").removeClass("success fail fail2").addClass("success");
	                        state.storeIdValid = true;
	                    }
	                }
	            });
	        }
	        else {//아이디가 형식검사를 통과하지 못했다면
	            $("[name=storeContact]").removeClass("success fail fail2").addClass("fail");
	            state.storeIdValid = false;
	        }
	    });
	    
	    //배달팁 형식검사 
	    $("[name=storeDtip]").on("blur", function(){
	    	var regex = /^\d+$/; //숫자로만

	        state.storePwValid = regex.test($(this).val());
	        $(this).removeClass("success fail")
	                    .addClass(state.storePwValid ? "success" : "fail");
	    });
	    
	    //사용자가 입력한 배달팁을 storeDtip에 저장
	    $("#Dtip-reinput").blur(function(){
	        var storeDtip = $("[name=storeDtip]").val();
	        //입력된 storeDtip값과 동일한지 확인 하고 그결과를 storeDtipCheckValid에 저장
	        state.storeDtipCheckValid = storeDtip == $(this).val();
	        
	        if(storeDtip.length == 0) {
	            $(this).removeClass("success fail fail2").addClass("fail2");
	        }
	        else {
	            $(this).removeClass("success fail fail2")
	                        .addClass(state.storeDtipCheckValid ? "success" : "fail");
	        }
	    });
	    //최소주문금액 형식검사
	    $("[name=storeMinprice]").blur(function(){
	    	var regex = /^\d+$/; //숫자로만
	        var value = $(this).val();
	
	        if(regex.test(value)) {
	            $.ajax({
	                url:"/rest/store/checkstoreMinprice",
	                method:"post",
	                data : { storeNick : value },
	                success:function(response){
	                    if(response) {//사용 가능한 경우 - success
	                        state.storeNickValid = true;
	                        $("[name=storeMinprice]")
	                            .removeClass("success fail fail2")
	                            .addClass("success");
	                    }
	                    else {//이미 사용중인 경우 - fail2
	                        state.storeNickValid = false;
	                        $("[name=storeMinprice]")
	                            .removeClass("success fail fail2")
	                            .addClass("fail2");
	                    }
	                }
	            });
	        }
	        else {//형식이 맞지 않는 경우 - fail
	            state.storeNickValid = false;
	            $("[name=storeMinprice]")
	                .removeClass("success fail fail2")
	                .addClass("fail");
	        }
	    });
	    
        
	    $("[name=storeDelivery]").blur(function(){
	    	var regex = /^[가-힣]+$/;
	        var value = $(this).val();
	        state.storeContactValid = value.length == 0 || regex.test(value);
	        $(this).removeClass("success fail")
	                    .addClass(state.storeContactValid ? "success" : "fail");
	    
	
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
	
	    //form 전송
	    $(".check-form").submit(function(){
	        //$(this).find("[name], #pw-reinput").blur();
	        //$(this).find(".tool").blur();//모든 창
	     
	        // 모든 입력란을 검사하여 형식이 올바른지 확인
	        if (!state.ok()) {
	            // 형식 검사 통과하지 못한 경우 폼 제출을 막고 알림창 표시
	            event.preventDefault();
	            alert('모든 입력란을 채워주세요.');
	        } else {
	            // 형식 검사를 통과한 경우 알림창을 표시하지 않고 폼을 제출
	            alert('등록이 완료되었습니다.');
	        }
	        
	        //입력창 중에서 success fail fail2가 없는 창
	        $(this).find(".tool").not(".success, .fail, .fail2").blur();
	        return state.ok();
	        
	     
	     
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    
    
    $(function(){
        // form 전송 시 이벤트 처리 지도
        $(".check-form").submit(function(event){
            // 주소 입력란의 값 가져오기
            var post = $("[name=storePost]").val();
            var address1 = $("[name=storeAddress1]").val();
            var address2 = $("[name=storeAddress2]").val();
            
            // 주소 입력 여부 확인
            var isAddressEmpty = post.trim() === '' || address1.trim() === '' || address2.trim() === '';
            
            // 주소 입력 여부에 따라 처리
            if (isAddressEmpty) {
                // 주소 입력이 완료되지 않은 경우 폼 제출 막기
                event.preventDefault();
                // 알림창 표시
                alert('주소를 모두 입력하세요.');
            }
        });
    });

    
    
    $(function(){
        //음식카테고리, 배달/포장, 소개글, 휴무일, 배달가능지역 입력란의 blur 이벤트 설정
        $("[name=storeName],[name=storeCategory],[name=storeType],[name=storeIntro],[name=storeClosed],[name=storeDelivery]").blur(function(){
            // 입력된 값 가져오기
            var value = $(this).val();
            
            // 입력값이 비어 있는지 확인
            var isEmpty = value.trim() === '';

            // 입력값이 비어 있으면 fail 클래스 추가하고 success 클래스 제거
            // 입력값이 있으면 success 클래스 추가하고 fail 클래스 제거
            if (isEmpty) {
                $(this).removeClass("success").addClass("fail");
            } else {
                $(this).removeClass("fail").addClass("success");
            }
        });
    });


   


    
</script>


</head>

<body>

	<form action="insert1" method="post" enctype="multipart/form-data"
		autocomplete="off" class="check-form" id="registerForm">

		<input type="text" name="memberNo" placeholder="멤버넘버"  value="<%=session.getAttribute("memberNo")%>">
		<div class="container w-600">
			<h2>가게 등록 페이지(임시)</h2>
			<div class="cell">


				<div class="cell">
					<label> 가게 이름 <i class="fa-solid fa-asterisk red"></i>
					</label> <input type="text" id="storeName" name="storeName"
						placeholder="가게 이름을 작성해주세요" class="tool w-100"
						onblur="checkstoreName()">

					<div class="fail-feedback">
						<i class="fa-solid fa-triangle-exclamation"></i> 가게 이름을 반드시 입력하세요
					</div>

				</div>

				<div class="cell page">
					<!-- 주소 : 모두 입력하든가 입력하지 않든가 -->
					<div class="cell">
						<label>주소</label>
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
						<div class="fail-feedback">주소를 모두 작성하세요</div>
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
						<div class="fail-feedback">
							<i class="fa-solid fa-triangle-exclamation"></i> 음식 카테고리를 선택하세요
						</div>
					</div>

					<div class="cell">
						<label> 배달/포장 가능 여부
						<i class="fa-solid fa-asterisk red"></i>
						</label>
						<div class="cell">
							<input type="checkbox" id="delivery" name="storeType"
								class="storeType" value="배달"> 배달만 <input type="checkbox"
								id="takeout" name="storeType" class="storeType" value="포장">
							포장만
							<input type="checkbox"
								id="takeout" name="storeType" class="storeType" value="배달,포장">
						 배달,포장 모두 가능
							
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
							<i class="fa-solid fa-triangle-exclamation"></i> 잘못된 전화번호 형식입니다
						</div>
					</div>
				</div>

				<div class="cell">
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
				</label> <select class="tool w-100" id="storeOpenHour" name="storeOpenHour" onblur="checkStoreOpenHour()">
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
				</select> <span>부터</span>

				<select class="tool w-100" id="storeCloseHour" name="storeCloseHour">
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
				</select> <span>까지
					운영합니다.</span>

				<div class="cell" name="storeClosed">
					<label> 휴무일 선택 </label>
					<div class="cell center">
						<input type="checkbox" id="monday" name="storeClosed" value="월요일">
<label for="monday">월요일</label>

<input type="checkbox" id="tuesday" name="storeClosed" value="화요일">
<label for="tuesday">화요일</label>

<input type="checkbox" id="wednesday" name="storeClosed" value="수요일">
<label for="wednesday">수요일</label>

<input type="checkbox" id="thursday" name="storeClosed" value="목요일">
<label for="thursday">목요일</label>

<input type="checkbox" id="friday" name="storeClosed" value="금요일">
<label for="friday">금요일</label>

<input type="checkbox" id="saturday" name="storeClosed" value="토요일">
<label for="saturday">토요일</label>

<input type="checkbox" id="sunday" name="storeClosed" value="일요일">
<label for="sunday">일요일</label>

					</div>
				</div>
				<div class="cell">
					<label> 배달 가능 지역 <i class="fa-solid fa-asterisk red"></i>
					</label> <input type="text" name="storeDelivery"
						placeholder="ex.노원구(구 단위만 입력)" class="tool w-100">
				</div>
			</div>
			<div class="cell">
    <label> 사업자 등록번호 <i class="fa-solid fa-asterisk red"></i> </label>
    <input type="text" name="storeBusinessNumber" id="storeBusinessNumber" placeholder="ex.'-'(하이픈) 없이 입력" class="tool w-100" onblur="checkBusinessNumber()">
    <div class="success-feedback">정확한 입력값</div>
    <div class="fail-feedback">
        <i class="fa-solid fa-triangle-exclamation"></i> 올바른 형식이 아닙니다
    </div>
</div>
		



		<div class="cell right">
			<button class="btn positive w-100" type="submit">등록하기</button>
		</div>
		</div>
	</form>

</body>

</html>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>