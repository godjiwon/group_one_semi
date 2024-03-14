<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가게 등록 페이지</title>

    <!-- 구글 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- 내가 구현한 스타일 -->
    <link rel="stylesheet" type="text/css" href="../css/commons.css">
    <link rel="stylesheet" type="text/css" href="../css/test.css">

    <!-- font awesome 아이콘 CDN -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>

    </style>

    <!-- jquery cdn -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <!-- 내가 만든 스크립트 추가(jQuery를 사용했으니 jQuery CDN 아래 작성) -->
    <script src="commons.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- javascript를 의도적으로 head 자리에 배치해서 가장 먼저 실행되도록 구현-->
    <script type="text/javascript">

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
	
	    //음식 카테고리 form 전송
	    $(".check-form").submit(function(){
	        //$(this).find("[name], #pw-reinput").blur();
	        //$(this).find(".tool").blur();//모든 창
	        
	        //입력창 중에서 success fail fail2가 없는 창
	        $(this).find(".tool").not(".success, .fail, .fail2").blur();
	        return state.ok();
	    });
	
	    function updateCategory() {
	        var selectedCategory = document.getElementById("storeCategory").value;
	        
	        // AJAX를 사용하여 서버에 선택된 카테고리 값을 전송
	        $.ajax({
	            type: "POST",
	            url: "update_category.php", // 카테고리를 업데이트하는 서버 측의 스크립트 경로
	            data: { category: selectedCategory },
	            success: function(response) {
	                // 서버에서 응답을 받았을 때 수행할 작업 (예: 성공 메시지 표시 등)
	                console.log("카테고리가 성공적으로 업데이트되었습니다.");
	            },
	            error: function(xhr, status, error) {
	                // 서버 통신 오류 발생 시 수행할 작업
	                console.error("서버 통신 중 오류가 발생했습니다: " + error);
	            }
	        });
	    }

	    
    </script>

<!-- 카카오 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
    
 // 입력 필드 유효성 검사 함수 주소!!
    function validateInputFields() {
        // 필수 입력 필드들을 배열로 정의합니다.
        var requiredFields = ["storeName", "storeCategory", "storeContact", "storePost", "storeAddress1", "storeAddress2"];

        // 모든 필수 입력 필드가 채워져 있는지 확인합니다.
        for (var i = 0; i < requiredFields.length; i++) {
            var fieldName = requiredFields[i];
            var fieldValue = $("input[name=" + fieldName + "]").val().trim();

            // 필드가 비어있는 경우
            if (fieldValue === "") {
                // 실패 피드백을 표시합니다.
                $("input[name=" + fieldName + "]").removeClass("success").addClass("fail");
                $(".fail-feedback").show().text("모든 필수 입력 필드를 작성하세요");
                return false; // 유효성 검사 실패
            }
        }

        // 모든 필수 입력 필드가 채워져 있으면 성공을 반환합니다.
        return true;
    }

    // form 전송을 위한 이벤트 핸들러
    $(".check-form").submit(function(){
        // 입력 필드의 유효성을 검사합니다.
        if (!validateInputFields()) {
            // 유효성 검사에 실패한 경우 폼 전송을 중단합니다.
            return false;
        }
        
        // 성공적으로 유효성 검사를 통과한 경우 폼을 전송합니다.
        return true;
    });

    
 // 이미지 파일 선택 시 미리보기 기능 추가
    $("input[name='storeImage']").change(function() {
        var file = this.files[0]; // 선택된 파일
        var reader = new FileReader(); // 파일을 읽기 위한 FileReader 객체 생성
        
        // 파일을 읽었을 때의 동작 정의
        reader.onload = function(e) {
            // 선택된 파일의 미리보기를 화면에 출력
            $(".preview-image").attr("src", e.target.result);
        };
        
        // 파일 읽기 실행
        reader.readAsDataURL(file);
        
     // 이미지 미리보기를 위한 img 태그
        var previewImage = document.createElement("img");
        previewImage.className = "preview-image";
        previewImage.src = "#";
        previewImage.alt = "미리보기 이미지";
        previewImage.style.maxWidth = "100%";
        previewImage.style.height = "auto";


    });
 
 // form이 submit될 때 실행되는 함수 체크!! 휴무일!
    $(".check-form").submit(function(){
        // 입력 필드의 유효성을 검사합니다.
        if (!validateInputFields()) {
            // 유효성 검사에 실패한 경우 폼 전송을 중단합니다.
            return false;
        }
        
        // 성공적으로 유효성 검사를 통과한 경우, 휴무일 정보를 가져와서 배열에 담습니다.
        var storeClosedDays = [];
        $("input[name='store_off_day']:checked").each(function() {
            storeClosedDays.push($(this).val());
        });
        
        // AJAX를 사용하여 서버로 휴무일 정보를 전송합니다.
        $.ajax({
            type: "POST",
            url: "update_closed_days.php", // 휴무일 정보를 업데이트하는 서버 측의 스크립트 경로
            data: { store_closed: storeClosedDays }, // 'store_closed' 필드에 휴무일 정보를 담아 전송
            success: function(response) {
                // 서버에서 응답을 받았을 때 수행할 작업 (예: 성공 메시지 표시 등)
                console.log("휴무일 정보가 성공적으로 업데이트되었습니다.");
            },
            error: function(xhr, status, error) {
                // 서버 통신 오류 발생 시 수행할 작업
                console.error("서버 통신 중 오류가 발생했습니다: " + error);
            }
        });

        // 성공적으로 처리되었으므로 폼을 전송합니다.
        return true;
    });


    
</script>


</head>

<body>

    <form action="insert1" method="post" enctype="multipart/form-data" autocomplete="off" class="check-form">
        <div class="container w-500">
            <h2>가게 등록 페이지(임시)</h2>
            <div class="cell">


                <div class="cell">
                    <label>
                        가게 이름
                        <i class="fa-solid fa-asterisk red"></i>
                    </label>
                    <input type="text" id="storeName" name="storeName" placeholder="가게 이름을 작성해주세요" class="tool w-100"
                        onblur="checkStoreName()">
                    <div class="success-feedback"><i class="fa-solid fa-check"></i></div>
                    <div class="fail-feedback"><i class="fa-solid fa-triangle-exclamation"></i> 가게 이름을 반드시 입력하세요</div>
                    <div class="name"></div>
                </div>

                <div class="cell page">
                    <!-- 주소 : 모두 입력하든가 입력하지 않든가 -->
                    <div class="cell">
                        <label>주소</label>
                    </div>
                    <div class="cell">
                        <input type="text" name="storePost"  readonly
                                placeholder="우편번호" class="tool" size="6" maxlength="6">
                        <button type="button" class="btn positive btn-address-search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>        
                        <button type="button" class="btn negative btn-address-clear">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>
                    <div class="cell">
                        <input type="text" name="storeAddress1" 
                                placeholder="기본주소" class="tool w-100" readonly>
                    </div>
                    <div class="cell">
                        <input type="text" name="storeAddress2" 
                                placeholder="상세주소" class="tool w-100">
                        <div class="fail-feedback">주소를 모두 작성하세요</div>
                    </div>
                    
                    <div class="flex-cell">
                        <div class="w-100 left">
                            <button type="button" class="btn btn-prev">
                                <i class="fa-solid fa-chevron-left"></i>
                                이전
                            </button>
                        </div>
                        <div class="w-100 right">
                            <button type="button" class="btn btn-next">
                                다음
                                <i class="fa-solid fa-chevron-right"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="cell">
                    <label>
                        음식 카테고리
                        <i class="fa-solid fa-asterisk red"></i>
                    </label>
                    <select class="tool w-100" id="storeCategory" name="storeCategory" onblur="checkStoreCategory()">
                        <option value="">선택하세요</option>
                        <option value="치킨">치킨</option>
                        <option value="피자/양식">피자/양식</option>
                        <option value="중국집">중국집</option>
                        <option value="한식">한식</option>
                        <option value="일식/돈까스">일식/돈까스</option>
                        <option value="족발/보쌈">족발/보쌈</option>
                        <option value="야식">야식</option>
                        <option value="치킨">치킨</option>
                        <option value="분식">분식</option>
                        <option value="카페/디저트">카페/디저트</option>
                    </select>
                    <div class="success-feedback"><i class="fa-solid fa-check"></i></div>
                    <div class="fail-feedback"><i class="fa-solid fa-triangle-exclamation"></i> 음식 카테고리를 선택하세요</div>
                </div>

                <div class="cell">
                    <label>
                        배달/포장 가능 여부(중복 선택 가능)
                        <i class="fa-solid fa-asterisk red"></i>
                    </label>
                    <div class="cell">
                        <input type="checkbox" id="배달만" name="checkBaedal" class="checkBaedal">
                        배달만
                        <input type="checkbox" id="포장만" name="checkBaedal" class="checkBaedal">
                        포장만
                    </div>

                    <div class="cell">
                        <label>
                            가게 연락처
                            <i class="fa-solid fa-asterisk red"></i>
                        </label>
                        <input type="text" name="storeContact" placeholder=" - 제외 숫자만 입력하세요" class="tool w-100"
                            onblur="checkStoreContact()">
                        <div class="success-feedback"><i class="fa-solid fa-check"></i></div>
                        <div class="fail-feedback"><i class="fa-solid fa-triangle-exclamation"></i> 잘못된 전화번호 형식입니다</div>
                    </div>
                </div>

                <div class="cell page">
                    <div class="cell">
                        <label>가게 이미지</label>
                        <input type="file" name="attach" class="tool w-100">
                    </div>
                    
                    <div class="flex-cell">
                        
                        
                        </div>
                    </div>
                </div>



                    <div class="cell store_intro">
                        <label>
                            가게 소개글
                        </label>
                        <textarea class="tool w-100"></textarea>
                    </div>
                    <div class="cell">
                        <label>
                            배달팁<!-- 포켓볼 사진 input에 추가  -->
                            <i class="fa-solid fa-asterisk red"></i>
                        </label>
                        <input type="text" name="storeDtip" placeholder="ex.3,000원" class="tool w-100" oninput="">
                        <div class="name"></div>
                    </div>
                    <div class="cell">
                        <label>
                            최소 주문 금액<!-- 포켓볼 사진 input에 추가  -->
                            <i class="fa-solid fa-asterisk red"></i>
                        </label>
                        <input type="text" name="store_minprice" placeholder="ex.12,000원" class="tool w-100" oninput="">
                        <div class="name"></div>
                    </div>

                    <select class="tool w-100" name="store_open_hour">
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
                    </select>
                    <span>부터</span>
                    <select class="tool w-100" name="store_close_hour">
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
                    </select>
                    <span>까지 운영합니다.</span>
                    
                    <div class="cell" name="store_closed">
                        <label>
                            휴무일 선택
                        </label>
                        <div class="cell center">
                            <input type="checkbox" id="monday" name="store_off_day" value="월요일">
                            <label for="monday">월</label>
                            <input type="checkbox" id="tuesday" name="store_off_day" value="화요일">
                            <label for="tuesday">화</label>
                            <input type="checkbox" id="wednesday" name="store_off_day" value="수요일">
                            <label for="wednesday">수</label>
                            <input type="checkbox" id="thursday" name="store_off_day" value="목요일">
                            <label for="thursday">목</label>
                            <input type="checkbox" id="friday" name="store_off_day" value="금요일">
                            <label for="friday">금</label>
                            <input type="checkbox" id="saturday" name="store_off_day" value="토요일">
                            <label for="saturday">토</label>
                            <input type="checkbox" id="sunday" name="store_off_day" value="일요일">
                            <label for="sunday">일</label>
                        </div>
                    </div>
                    <div class="cell">
                        <label>
                            배달 가능 지역
                            <i class="fa-solid fa-asterisk red"></i>
                        </label>
                        <input type="text" name="store_name" placeholder="ex.노원구(구 단위만 입력)" class="tool w-100"
                            oninput="">
                        <div class="name"></div>
                    </div>
                    <div class="cell">
                        <label>
                            사업자 등록번호
                            <i class="fa-solid fa-asterisk red"></i>
                        </label>
                        <input type="text" name="business_number" placeholder="123-45-67890('-' (하이픈)없이 입력)"
                            class="tool w-100" oninput="validateBusinessNumber(this)">
                        <div class="fail-feedback" id="business_number_error"></div>
                    </div>
                    <div class="w-100 right">
                        <button class="btn positive w-100" type="submit">등록하기</button>
                    </div>
    </form>

</body>

</html>