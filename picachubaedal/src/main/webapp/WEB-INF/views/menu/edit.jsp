<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
   .menu-wrap {
       display: flex;
       justify-content: center;
   }
   .menu_form {
       text-align: left;
       display: flex;
       flex-direction: column;
       align-items: flex-end;
      > div {
         margin-bottom: 10px;
         font-size: 20px;
      }
   }
   .emp-input {
      font-size: 20px;
       outline: none;
       border: 2px solid #808e9b;
       border-radius: 0.1em;
   }
   .insert-input-text {
      vertical-align: bottom;
      margin-right: 10px;
   }
   .nav-submit {
      text-align: right;
      margin-top: 60px;
   }
</style>

<h1>수정화면 Test</h1>

<div class="cell center">
   <h1>메뉴 수정</h1>
</div>
<div>
   <form method="post" id="insert_form" action="change" autocomplete="off">
      <input type="hidden" name="storeNo" value="${dto.storeNo}">
      <input type="hidden" name="menuNo" value="${dto.menuNo}">
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
       <button type="submit" class="btn-gradient green small right" name="insertMenuButton">
          <i class="fa-solid fa-plus"></i>
          수정
       </button>
   </form>
</div>


<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>