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


<div class="cell center py-10">
   <h1>메뉴 수정</h1>
</div>
<div>
   <form method="post" id="insert_form" action="edit" autocomplete="off">
      <input type="hidden" name="storeNo" value="12">
      <input type="hidden" name="menuNo" value="24">
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
               <input type="text" name="menuName" placeholder="메뉴 이름을 입력하세요" value="${dto.menuName}">
               <input type="number" name="menuPrice" placeholder="메뉴 가격을 입력하세요" value="${dto.menuPrice}">
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
       <div class="right pt-50">
	       <button  type="submit" form="insert_form" class="btn-gradient green">
	          수정
	       </button>
       </div>
   </form>
</div>


<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>