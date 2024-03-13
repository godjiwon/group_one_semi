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
      }
      
      > select {
         border: none;
          padding: 10px 20px 10px 15px;
          font-size: 18px;      
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
	        }
	    },
	    error: function(xhr, status, error) {
	        console.error("메뉴 추가 중 오류가 발생하였습니다:", error);
	    }
   });  
}

$(function(){
    const dropArea = $("#drop-area");
    const fileInput = $("#file-input");
    var imageFile;

    $("[name='insertMenuButton']").on("click", function(){
        const file = fileInput[0].files[0];
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


</script>

<div class="cell center">
   <h1>메뉴 등록</h1>
</div>
<div>
   <form method="post" id="insert_form">
      <input type="hidden" name="storeNo" value="2">
      <section>
          <div class="menuArea container">
              <div id="drop-area">
                  <div id="drop-area-content">
                      <i class="fa-solid fa-thin fa-images" style="font-size: 150px;"></i>
                      <p>클릭하여 메뉴 사진을 첨부해주세요</p>
                      <input type="file" name="attach" id="file-input" accept="image/*" style="display: none;">
                  </div>
                  <img id="image-preview" src="" alt="업로드된 이미지">
              </div>
              <div id="input-area">
               <input type="text" name="menuName" placeholder="메뉴 이름을 입력하세요">
               <input type="text" name="menuPrice" placeholder="메뉴 가격을 입력하세요">
                 <select name="menuCategory">
                   <option>메뉴 카테고리</option>
                   <option value="한식">한식</option>
                   <option value="중식">중식</option>
                   <option value="일식">일식</option>
                   <option value="양식">양식</option>
                   <option value="치킨">치킨</option>
                   <option value="피자">피자</option>
                   <option value="햄버거">햄버거</option>
                 </select>            
              </div>
          </div>
       </section>
       <a class="btn-gradient green small right" name="insertMenuButton">
          <i class="fa-solid fa-plus"></i>
          등록하기
       </a>
   </form>
</div>

<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>