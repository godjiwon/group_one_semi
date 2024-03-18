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
   
</style>

<script type="text/javascript">

function insertMenuImage(file, menuNo) {
    var formData = new FormData();
    formData.append('file', file);
    formData.append('menuNo', menuNo);
    $.ajax({
        type: "POST",
        url: "/menu/menuFileUpload",
        data: formData,
        contentType: false,
        processData: false,
        success: function () {
        	window.location.href = "/menu/list";
        }
    });
}

function insertMenu(file) {
   const menuForm = $("#insert_form").serializeArray();
   $.ajax({
	    url: "/menu/insert",
	    type: "POST",
	    data: menuForm,
	    success: function(response) {
	        if(file !== null && file !== undefined) {
	        	insertMenuImage(file, response)
	        } else {
	        	window.location.href = "/menu/list";
	        }
	    }
   });  
}

$(document).ready(function() {
    var menuCategory = "${menuDto.menuCategory}"; // 여기서 "${menuCategory}"는 모델에서 가져온 값
    $('[name=menuCategory]').val(menuCategory).prop("selected", true);
});

$(function(){
    const dropArea = $("#drop-area");
    const fileInput = $("#file-input");
    var imageFile;

    $("[name='insertMenuButton']").on("click", function(){
        insertMenu(imageFile);
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
        if (file && file.type.startsWith("image")) {
            displayImage(file);
        }
    });

    dropArea.on("click", () => {
        document.getElementById("file-input").click();
    });

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

//a태그 전송 폼
function submitForm() {
   $("form[id='insert_form']").attr("method", "POST").attr("action", "/menu/edit").submit();
}

</script>

<div class="cell center py-10">
   <h1>메뉴 수정</h1>
</div>
<div>
   <form method="post" id="insert_form" action="edit" autocomplete="off">
      <input type="hidden" name="storeNo" value="12">
      <input type="hidden" name="menuNo" value="${menuDto.menuNo}">
      <section>
          <div class="menuArea container">
              <div id="drop-area">
                  <div id="drop-area-content">
                      <i class="fa-solid fa-thin fa-images" style="font-size: 150px;"></i>
                      <p>클릭하여 메뉴 사진을 첨부해주세요</p>
                      <input type="file" name="menuFileImage" id="file-input" accept="image/*" style="display: none;">
                  </div>
                  <img id="image-preview" src="" alt="업로드이미지">
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
				<div class="right pt-30">
					<a href="#" onclick="submitForm()" class="btn-gradient green">
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