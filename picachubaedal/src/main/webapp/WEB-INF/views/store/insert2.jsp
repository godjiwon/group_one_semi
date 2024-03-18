<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

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
        textarea.tool {
            resize: vertical;
            min-height: 8em;
            /*필요 시 개조*/
        }

        textarea.tool.tool-fixed {
            resize: none;
        }

        .feedback {
            color: red;
        }

        .fail {
            border: 2px solid red !important;
        }

        .success {
            border: 2px solid green !important;
        }
    </style>

    <!-- jquery cdn -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <!-- 내가 만든 스크립트 추가(jQuery를 사용했으니 jQuery CDN 아래 작성) -->
    <script src="commons.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- javascript를 의도적으로 head 자리에 배치해서 가장 먼저 실행되도록 구현-->


    <script type="text/javascript">
        $(function () {
            $(".btn-address-search").click(function () {
                new daum.Postcode({
                    oncomplete: function (data) {
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

            // 시간 옵션을 추가하는 함수
            function addTimeOptions() {
                var selectOpenHour = $('[name="store_open_hour"]');
                var selectCloseHour = $('[name="store_close_hour"]');

                // 옵션 초기화
                selectOpenHour.empty();
                selectCloseHour.empty();

                // 옵션 추가
                for (var hour = 0; hour <= 24; hour++) {
                    var time = (hour < 10 ? "0" : "") + hour + ":00";
                    selectOpenHour.append($('<option>', {
                        value: time,
                        text: time
                    }));
                    selectCloseHour.append($('<option>', {
                        value: time,
                        text: time
                    }));
                }
            }

            // 초기 실행: 시간 옵션 추가
            addTimeOptions();

            // 운영 시작 시간과 종료 시간이 변경될 때마다 검증
            $('[name="store_open_hour"], [name="store_close_hour"]').change(function () {
                var openHour = $('[name="store_open_hour"]').val();
                var closeHour = $('[name="store_close_hour"]').val();

                // 운영 시작 시간과 종료 시간을 비교하여 종료 시간이 더 이른 경우, 종료 시간을 운영 시작 시간과 동일하게 설정
                if (openHour > closeHour) {
                    $('[name="store_close_hour"]').val(openHour);
                }
            });

            // 휴무일 선택 변경 시 동작
            $('[name="storeClosed"]').change(function () {
                var offDays = [];
                $('[name="storeClosed"]:checked').each(function () {
                    offDays.push($(this).val());
                });
                console.log("휴무일 선택: " + offDays.join(", "));
                // 여기서 선택된 휴무일 값을 저장하거나 다른 처리를 할 수 있습니다.
            });
        });

        $(document).ready(function () {
            // 가게 등록 버튼 클릭 시
            $(".positive").click(function () {
                // 사용자가 입력한 값을 변수에 저장
                var storeName = $("[name='storeName']").val();
                var storePostcode = $("[name='storePost']").val();
                var storeAddress1 = $("[name='storeAddress1']").val();
                var storeAddress2 = $("[name='storeAddress2']").val();
                var storeCategory = $("[name='storeCategory']").val();
                var storeContact = $("[name='storeContact']").val();
                var storeImage = $("[name='storeImage']")[0].files[0];
                var storeIntro = $("[name='storeIntro']").val();
                var storeDtip = $("[name='storeDtip']").val();
                var storeMinprice = $("[name='storeMinprice']").val();
                var storeOpenHour = $("[name='store_open_hour']").val();
                var storeCloseHour = $("[name='store_close_hour']").val();
                var storeClosed = [];
                $('[name="store_off_day"]:checked').each(function () {
                    storeClosed.push($(this).val());
                });

                // 주소와 우편번호를 결합하여 storeAddress 변수에 저장
                var storeAddress = storeAddress1 + " " + storeAddress2 + " (" + storePostcode + ")";

                // 시작 시간과 종료 시간을 문자열로 결합
                var combinedHours = storeOpenHour + "-" + storeCloseHour;

                // FormData 객체 생성하여 데이터 추가
                var formData = new FormData();
                formData.append('storeName', storeName);
                formData.append('storePostcode', storePostcode);
                formData.append('storeAddress', storeAddress);
                formData.append('storeCategory', storeCategory);
                formData.append('storeContact', storeContact);
                formData.append('storeImage', storeImage);
                formData.append('storeIntro', storeIntro);
                formData.append('storeDtip', storeDtip);
                formData.append('storeMinprice', storeMinprice);
                formData.append('storeOpenHour', storeOpenHour);
                formData.append('storeCloseHour', storeCloseHour);
                formData.append('storeOffDays', JSON.stringify(storeClosed));

                // AJAX를 통해 서버로 데이터 전송
                $.ajax({
                    url: 'http://localhost:8080/store/insert', // 서버의 저장 스크립트 경로
                    method: 'post',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        // 성공 시 처리
                        console.log('데이터 전송 성공:', response);
                        // 여기서 필요한 다른 처리를 수행할 수 있습니다.
                    },
                    error: function (xhr, status, error) {
                        // 실패 시 처리
                        console.error('데이터 전송 실패:', status, error);
                        // 여기서 필요한 다른 처리를 수행할 수 있습니다.
                    }
                });
            });
        });

            
        function validateBusinessNumber(input) {
            var value = input.value;
            var pattern = /^\d{3}-\d{2}-\d{5}$/; // 123-45-67890 형식
            var errorElement = document.getElementById("business_number_error");

            if (!pattern.test(value)) {
                errorElement.textContent = "올바른 형식의 사업자 등록번호를 입력하세요.";
            } else {
                errorElement.textContent = "";
            }
        }

        // function checkForm() { 필수항목 체크 여부
        //     var isValid1 = checkMenuNameKor();
        //     var isValid2 = checkMenuNameEng();
        //     var isValid3 = checkMenuType();
        //     var isValid4 = chekMenuPrice();
        //     return isValid1 && isValid2 && isValid3 && isValid4;
        // }

        function checkStoreName() {
            var inputTarget = document.querySelector("[name=storeName]");
            var storeName = inputTarget.value.trim(); // 값 앞뒤의 공백 제거
            var isValid = storeName !== ""; // 값이 비어있지 않으면 유효

            inputTarget.classList.remove("success", "fail");

            inputTarget.classList.remove("success", "fail");
            inputTarget.classList.add(isValid ? "success" : "fail");

            return isValid;
        }


        function checkStoreContact() {
            var inputTarget = document.querySelector("[name=storeName]");
            var storeName = inputTarget.value.trim(); // 값 앞뒤의 공백 제거
            var isValid = storeName !== ""; // 값이 비어있지 않으면 유효

            inputTarget.classList.remove("success", "fail");

            inputTarget.classList.remove("success", "fail");
            inputTarget.classList.add(isValid ? "success" : "fail");

            return isValid;
        }

        function checkStoreContact() {
            var inputTarget = document.querySelector("[name=storeContact]");
            var phoneNumber = inputTarget.value.trim();

            var pattern = /^\d{9,11}$/;

            var isValid = pattern.test(phoneNumber);

            inputTarget.classList.remove("success", "fail");
            inputTarget.classList.add(isValid ? "success" : "fail");

            return isValid;
        }

        function checkStoreImage() {
            var input = document.querySelector('[name="storeImage"]');
            var message = document.querySelector('.fail-feedback');

            if (!input.files || input.files.length === 0) {
                message.style.display = 'block';
            } else {
                message.style.display = 'none';
                input.classList.add('success');
            }
        }

        function checkAddress() {
            var basicAddress = $("[name='storeAddress1']").val();
            var detailAddress = $("[name='storeAddress2']").val();

            if (basicAddress.trim() !== "" && detailAddress.trim() !== "") {
                $(".success-feedback").show();
                $(".fail-feedback").hide();
            } else {
                $(".success-feedback").hide();
                $(".fail-feedback").show();
            }
        }

        function checkStoreCategory() {
            var input = document.querySelector('[name="storeCategory"]');
            var storeCategory = input.value;

            var isValid = storeCategory.length > 0;

            input.classList.remove("success", "fail");
            input.classList.add(isValid ? "success" : "fail");

            return isValid;
        }





    </script>
</head>

<body>

    <!-- store_no 가게번호
	store_no 가게번호
	store_name 가게이름
	store_address 주소
	store_category 음식 카테고리
	store_type 배달 or 포장
	store_contact 연락처
	store_image 가게 사진
	store_intro 가게 소개글
	store_dtip 배달팁
	store_minprice 최소 주문금액
	store_like 찜 수(좋아요 수)
	store_hours 가게 운영시간
	store_delivery 배달 가능지역
	store_time 가게 DB 생성일시
	store_update DB 수정일시
	store_closed 가게 휴무일 -->

    <div class="container w-500">
        <div class="cell center">
            <h1>가게 등록 페이지(임시)</h1>
        </div>
        <div class="cell">
            <label>
                가게 이름
                <i class="fa-solid fa-asterisk red"></i>
            </label>
            <input type="text" name="storeName" placeholder="가게 이름을 작성해주세요" class="tool w-100"
                onblur="checkStoreName()">
            <div class="success-feedback"><i class="fa-solid fa-check"></i></div>
            <div class="fail-feedback"><i class="fa-solid fa-triangle-exclamation"></i> 가게 이름을 반드시 입력하세요</div>
            <div class="name"></div>
        </div>
        <div class="cell">
            <label>가게 주소</label>
            <i class="fa-solid fa-asterisk red"></i>
        </div>
        <div class="cell">
            <input type="text" name="storePost" readonly placeholder="우편번호" class="tool" size="6" maxlength="6">
            <button type="button" class="btn positive btn-address-search">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
            <button type="button" class="btn negative btn-address-clear">
                <i class="fa-solid fa-xmark"></i>
            </button>
        </div>
        <div class="cell">
            <input type="text" name="storeAddress1" placeholder="기본주소" class="tool w-100" readonly>
        </div>
        <div class="cell">
            <input type="text" name="storeAddress2" placeholder="상세주소" class="tool w-100">
            <div class="success-feedback">
                <i class="fa-solid fa-check"></i>
            </div>
            <div class="fail-feedback">
                <i class="fa-solid fa-triangle-exclamation"></i> 주소를 반드시 선택하세요
            </div>
        </div>
        <div class="cell">
            <label>
                음식 카테고리
                <i class="fa-solid fa-asterisk red"></i>
            </label>
            <select class="tool w-100" name="storeCategory" onblur="checkStoreCategory()">
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
        <div class="cell">
            <label>
                가게 이미지
                <i class="fa-solid fa-asterisk red"></i>
            </label>
            <input type="file" name="storeImage" accept="image/*" class="tool w-100" onblur="checkStoreImage()">
            <div class="success-feedback"><i class="fa-solid fa-check"></i></div>
            <div class="fail-feedback"><i class="fa-solid fa-triangle-exclamation"></i> 가게 사진을 등록하세요</div>
            <!-- 이미지를 미리보기하는 부분 -->
            <img id="previewImage" src="#" alt="가게 이미지 미리보기" style="max-width: 100%; height: auto; display: none;">
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

        <div class="cell" name="store_hours">
            <label>
                가게 운영시간
                <i class="fa-solid fa-asterisk red"></i>
            </label>
            <select class="tool w-100" name="store_open_hour">
                <option value="">운영 시작 시간</option>
            </select>
            <span>부터</span>
            <select class="tool w-100" name="store_close_hour">
                <option value="">운영 종료 시간</option>
            </select>
            <span>까지 운영합니다.</span>
        </div>
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
            <input type="text" name="store_name" placeholder="ex.노원구(구 단위만 입력)" class="tool w-100" oninput="">
            <div class="name"></div>
        </div>
        <div class="cell">
            <label>
                사업자 등록번호
                <i class="fa-solid fa-asterisk red"></i>
            </label>
            <input type="text" name="business_number" placeholder="123-45-67890('-' (하이픈)모두 입력)" class="tool w-100"
                oninput="validateBusinessNumber(this)">
            <div class="fail-feedback" id="business_number_error"></div>
        </div>
        <div class="cell">
            <button class="positive w-100">등록하기</button>
        </div>







    </div>
    <script>
        $(document).ready(function () {
            // 파일이 선택될 때마다 미리보기 업데이트
            $('[name="store_image"]').change(function () {
                var input = this;
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#previewImage').attr('src', e.target.result).show();
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            });
        });
    </script>
</body>
</body>

</html>