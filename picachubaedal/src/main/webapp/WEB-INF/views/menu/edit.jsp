<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.menuArea {
		display: flex;
		flex-direction: column;
		align-items: center;          
	}
	#drop-area {
		box-shadow: 1px 1px 5px 1px gray;
		border: 2px dashed #ccc;
		width: 500px;
		height: 300px;
		text-align: center;
		transition: background-color 0.3s ease-in-out;
		background-color: #fed23d;
		display: flex;
		flex-direction: column;
		justify-content: center;          
	}
	#input-area {
		box-shadow: 1px 1px 5px 1px gray;
		border: 2px dashed #ccc;
		width: 500px;
		height: 300px;
		text-align: center;
		transition: background-color 0.3s ease-in-out;
		background-color: #fafafa;
		display: flex;
		flex-direction: column;
		justify-content: center;
		
		> input {
		   border: none;
		   padding: 10px 20px 10px 20px;
		   font-size: 18px;
		   height: 50px;     
		}
		
		> select {
		   border: none;
		   padding: 10px 20px 10px 15px;
		   font-size: 18px;
		   height: 50px;     
		}
	}
	#drop-area:hover {
		background-color: #eee;
	}
	#image-preview {
		max-width: 100%;
		max-height: 100%;
		display: none;
	}
	.hidden {
		display: none;
	}
	.form-wrap {
	    padding-bottom: 70px;
	}
   
</style>

<script type="text/javascript">

function updateMenu(file) {
	if(!checkMenuName() || !checkMenuPrice() || !checkMenuCategory()) {
		alert("다시 입력해주세요");
		return;
	}
	const menuForm = new FormData($("#update_form")[0]);
	if (file !== null && file !== undefined) {
        menuForm.append('menuImage', file);
    }
    $.ajax({
	    url: "${pageContext.request.contextPath}/menu/edit",
	    type: "POST",
	    data: menuForm,
	    contentType: false,
        processData: false,
	    success: function(response) {
	    	var storeNo = response;
	          window.location.href = "${pageContext.request.contextPath}/menu/ceoMenuList?storeNo="+storeNo;
	    }
    });  
}

$(function(){
    const dropArea = $("#drop-area");
    const fileInput = $("#file-input");
    var imageFile;

    $("[name='updateMenuButton']").on("click", function(){
        updateMenu(imageFile);
    });

    dropArea.on("dragover", (e) => {
        e.preventDefault();
        dropArea.css("background-color", "#eee");
    });

    dropArea.on("dragleave", () => {
        dropArea.css("background-color", "#fed23d");
    });

    dropArea.on("drop", (e) => {
        e.preventDefault();
        dropArea.css("background-color", "#fff");
        const file = e.originalEvent.dataTransfer.files[0];
        imageFile = file;
        if (file && file.type.startsWith("image")) {
            displayImage(file);
        }
    });

    fileInput.on("change", () => {
        const file = fileInput[0].files[0];
        imageFile = file;
        if (file && file.type.startsWith("image")) {
            displayImage(file);
        }
    });

    dropArea.on("click", () => {
        document.getElementById("file-input").click();
    });
    
    $(".menuCheck").change(function(){
        $(".menuCheck").prop('checked', false);
        $(this).prop('checked', true);
        $('[name=menuState]').val($(this).val());
    }); 
    
});

$(document).ready(function() {
    var menuCategory = "${menuDto.menuCategory}"; // 여기서 "${menuCategory}"는 모델에서 가져온 값
    var menuState = "${menuDto.menuState}";
    var imagePreview = document.getElementById("image-preview");
    $('[name=menuCategory]').val(menuCategory).prop("selected", true);
    if(menuState === "" || menuState === null) {
    	$("[name=menuCheak_y]").prop('checked',true);
    } else {
    	$("[name=menuCheak_n]").prop('checked',true);
    }
    
    var imagePreview = document.getElementById("image-preview");
    if(imagePreview !== null || imagePreview !== "") {
    	var dropAreaContent = document.getElementById("drop-area-content");
        imagePreview.style.display = "block";
        dropAreaContent.classList.add("hidden");
    }
    
});

// 이미지 표시 함수
function displayImage(file) {
    const reader = new FileReader();
    var imagePreview = document.getElementById("image-preview");
    var dropAreaContent = document.getElementById("drop-area-content");
    
    reader.onload = () => {
        imagePreview.src = reader.result;
        imagePreview.style.display = "block";
        dropAreaContent.classList.add("hidden");
    };
    reader.readAsDataURL(file);
}

function checkMenuCategory() {
    var inputTarget = document.querySelector("[name=menuCategory]");

    var isValid = inputTarget.length > 0;

    inputTarget.classList.remove("success", "fail");
    inputTarget.classList.add(isValid ? "success" : "fail");
    return isValid;
}
function checkMenuName() {
    var inputTarget = document.querySelector("[name=menuName]");

    var regex = /^[가-힣a-zA-Z0-9\[\]\(\)]+$/;
    var isValid = regex.test(inputTarget.value);

    inputTarget.classList.remove("success", "fail");
    inputTarget.classList.add(isValid ? "success" : "fail");
    return isValid;
}
function checkMenuPrice() {
    var inputTarget = document.querySelector("[name=menuPrice]");

    var regex = /^[0-9]+$/;
    var isValid = regex.test(inputTarget.value);

    inputTarget.classList.remove("success", "fail");
    inputTarget.classList.add(isValid ? "success" : "fail");
    return isValid;
}

</script>

<div class="cell center py-10">
   <h1>메뉴 수정</h1>
</div>
<div class="form-wrap">
   <form method="post" id="update_form" action="${pageContext.request.contextPath}/edit" autocomplete="off">
      <input type="hidden" name="menuNo" value="${menuDto.menuNo}">
      <input type="hidden" name="storeNo" value="${menuDto.storeNo}">
      <section>
          <div class="menuArea container">
              <div id="drop-area">
                  <div id="drop-area-content">
                      <i class="fa-solid fa-thin fa-images" style="font-size: 150px;"></i>
                      <p>클릭하여 메뉴 사진을 첨부해주세요</p>
                      <input type="file" name="menuFileImage" id="file-input" accept="image/*" style="display: none;">
                  </div>
                  <img id="image-preview" src="${pageContext.request.contextPath}/menuPhoto?menuNo=${menuDto.menuNo}" alt="업로드이미지">
              </div>
              <div id="input-area">
				<input type="text" name="menuName" placeholder="메뉴 이름을 입력하세요" value="${menuDto.menuName}">
				<input type="number" name="menuPrice" placeholder="몬스터볼 개수를 입력하세요" value="${menuDto.menuPrice}">
		        <select name="menuCategory">
                   <option>메뉴 카테고리</option>
                   <option value="추천메뉴">추천메뉴</option>
                   <option value="식사메뉴">식사메뉴</option>
                   <option value="사이드">사이드</option>
                   <option value="세트">세트</option>
                   <option value="추가">추가</option>
                   <option value="디저트">디저트</option>
                   <option value="음료/ 주류">음료/ 주류</option>
               </select>
				<div>
                    <input type="checkbox" name="menuCheak_n" class="menuCheck" value="N"/>
                    <label for="horns">품절</label>
                    <input type="checkbox"  name="menuCheak_y" class="menuCheck" value="" />
                    <label for="horns">판매중</label>
                    <input type="hidden" name="menuState">
               </div> 
				<div class="right pt-30">
					<a class="btn-gradient green" name="updateMenuButton">
				    	수정
					</a>
				</div>                 
              </div>
          </div>
       </section>
   </form>
</div>


<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>