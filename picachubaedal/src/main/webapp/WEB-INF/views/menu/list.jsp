<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
   .card {
            box-shadow: 0 0 1px 1px #b2bec3;
    }
    .card > .content-wrapper > .title-wrapper {
        font-size: 24px;
    }
    .flex-cell.middle {
        justify-content: center;
        align-items: center;
    }
    
    .menu-button-style {
       display: flex;
      justify-content: flex-end;
    }
    
    .menulist {
      display: flex;
       flex-direction: column;
       align-items: center;    
    }
    
    .menuCard {
       width: 700px;
       height: 100px
    }
    
    .menuSubCard {
      display: flex;
       flex-direction: column;
       justify-content: space-between;    
    }
    
    .menu-title-wrapper {
       font-size: 20px;
    }
    
    .img_wrap {
       width: 150px;
       height: 100px;
       text-align: center;
       > img {
           width: 100%;
          height: 100%;
          padding: 10px;
       }
    }
    
    .list-button-style{
    	font-size: 16px;
        text-decoration: none;
    }

</style>

<div class="cell">
   <h3 class="menu-button-style">
      <a class="list-button-style gray" href="insert?storeNo=${storeNo}">
         <i class="fa-solid fa-plus"></i>
         메뉴등록
      </a>
   </h3>
   <div class="menulist">
      <c:forEach var="menuDto" items="${list}">
         <div class="cell flex-cell card menuCard">
             <div class="w-25 flex-cell middle">
                 <div class="img_wrap">
                    <img src="/image/" width="80">
                 </div>
             </div>
             <div class="content-wrapper width-fill p-10 menuSubCard">
                 <div class="menu-title-wrapper">
                  <div>${menuDto.menuName}
                     <c:if test="${menuDto.menuState == 'N'}">
                        <span class="red review-wrapper">
                               (품절)
                           </span>                     
                        </c:if>
                  </div>  
                    <div>  
                        
                    </div>    
                    <div>
						<span><fmt:formatNumber value="${menuDto.menuPrice}" pattern="#,##0"></fmt:formatNumber>원</span>
                    </div>              
                 </div>     
                     
                 <div class="right">
                  <a class="list-button-style blue" href="/menu/edit?menuNo=${menuDto.menuNo}">
                     <i class="fa-solid fa-pencil"></i>
                     수정
                  </a>
                  <span> | </span>
                  <a class="list-button-style gray" href="/menu/delete?menuNo=${menuDto.menuNo}">
                     <i class="fa-solid fa-minus"></i>
                     삭제
                  </a>               
                 </div> 
             </div>
         </div>
      </c:forEach>
   </div>
</div>



<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>