<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <style>
        #drop-area {
          border: 2px dashed #ccc;
          width: 500px;
          height: 300px;
          text-align: center;
          padding: 10px;
          margin: 10px auto;
          transition: background-color 0.3s ease-in-out;
          background-color: #fed23d;
          display: flex;
          flex-direction: column;
          justify-content: center;          
        }
        #drop-area:hover {
            background-color: #eee;
        }
        #image-preview {
            margin: 10px auto;
            max-width: 100%;
            max-height: 200px;
            display: none;
        }
    </style>
<script type="text/javascript">
$(function(){
   var dropArea = document.getElementById("drop-area");
   var fileInput = document.getElementById("file-input");

   // 드래그 앤 드롭 이벤트 처리
   dropArea.addEventListener("dragover", (e) => {
       e.preventDefault();
       dropArea.style.backgroundColor = "#eee";
   });

   dropArea.addEventListener("dragleave", () => {
       dropArea.style.backgroundColor = "#fff";
   });

   dropArea.addEventListener("drop", (e) => {
       e.preventDefault();
       dropArea.style.backgroundColor = "#fff";
       const file = e.dataTransfer.files[0];
       if (file && file.type.startsWith("image")) {
           displayImage(file);
       }
   });

   // 파일 입력 필드 변경 이벤트 처리
   fileInput.addEventListener("change", () => {
       const file = fileInput.files[0];
       if (file && file.type.startsWith("image")) {
           displayImage(file);
       }
   });

   // 클릭 이벤트 처리
   dropArea.addEventListener("click", () => {
       fileInput.click();
   });
});

// 이미지 표시 함수
function displayImage(file) {
    const reader = new FileReader();
    var imagePreview = document.getElementById("image-preview");
    reader.onload = () => {
        imagePreview.src = reader.result;
        imagePreview.style.display = "block";
    };
    reader.readAsDataURL(file);
}
</script>

<div class="cell center">
   <h1>메뉴 등록</h1>
</div>
<div>
<form class="menu_form" method="post" id="insert_form" action="/menu/insert" autocomplete="off" onsubmit="return ">
   <section id="ex9">
       <div class="container">
           <div id="drop-area">
              <i class="fa-solid fa-thin fa-images" style="font-size: 150px;"></i>
               <p>클릭하여 메뉴 사진을 첨부해주세요</p>
               <input type="file" id="file-input" accept="image/*" style="display: none;">
           </div>
           <img id="image-preview" src="" alt="업로드된 이미지">
       </div>
    </section>
</form>
</div>



<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>