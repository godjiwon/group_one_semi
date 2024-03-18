<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
        //음식카테고리,배달/포장,소개글,휴무일,배달가능지역
    	// storeName 입력란의 blur 이벤트 설정
        $("[name=storeName],[name=storeCategory],[name=storeType],[name=storeIntro],[name=storeClosed],[name=storeDelivery]").blur(function(){
            // 입력된 가게 이름 가져오기
            var storeName = $(this).val();
            
            // 여기서 추가적으로 수행할 작업을 작성합니다.
            // 예를 들어, 가게 이름이 입력되었는지 확인하거나 다른 유효성 검사를 수행할 수 있습니다.
            
            // 예시: 가게 이름이 비어 있지 않은 경우에만 유효성 검사 통과 처리
            if(storeName.trim() !== '') {
                // 가게 이름이 비어 있지 않은 경우 success 클래스 추가
                $(this).addClass("success");
                // 다른 작업 수행 가능
            } else {
                // 가게 이름이 비어 있는 경우 fail 클래스 추가
                $(this).addClass("fail");
                // 다른 작업 수행 가능
            }
        });
    });



    
</script>
<body>

<form action="insert1" method="post" enctype="multipart/form-data"
		autocomplete="off" class="check-form">

		
		<div class="container w-500">
			<h2>가게 등록 페이지(임시)</h2>
			<div class="cell">


				<div class="cell">
					<label> 가게 이름
					<i class="fa-solid fa-asterisk red"></i>
					</label> 
<input type="text" id="storeName" name="storeName"
			placeholder="가게 이름을 작성해주세요" class="tool w-100"
						onblur="checkstoreName()" value="${dto.storeName}">
    
    <label for="storeAddress1">가게 주소</label>
    <input type="text" id="storeAddress1" name="storeAddress1" value="${dto.storeAddress1}">
    <br>
    
    <label for="storeAddress2">가게 상세 주소</label>
    <input type="text" id="storeAddress2" name="storeAddress2" value="${dto.storeAddress2}">
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
    <input type="text" id="storeImage" name="storeImage" value="">
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
    
    <label for="storeOpenHour">가게 운영시간</label>
    <input type="text" id="storeOpenHour" name="storeOpenHour" value="${dto.storeOpenHour}">
    <br>
    
    <label for="storeDelivery">배달 가능 지역</label>
    <input type="text" id="storeDelivery" name="storeDelivery" value="${dto.storeDelivery}">
    <br>
    
    <label for="storeClosed">가게 휴무일</label>
    <input type="text" id="storeClosed" name="storeClosed" value="${dto.storeClosed}">
    <br>
    
    <label for="storeClosed">사업자 등록번호</label>
    <input type="text" id="storeBusinessNumber" name="storeBusinessNumber" value="${dto.storeBusinessNumber}">
    
    <button type="submit">변경하기</button>
</form>

</body>
</html>
