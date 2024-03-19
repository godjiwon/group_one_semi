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

	.menuCategoryBar {
		bottom: 2%;
		position: relative;
	    border-left: none;
	    margin-top: 0;
	    margin-right: 0;
	    display: block;
	    visibility: visible;
	    background-color: #fed23d;

	    ul {
	    	display: flex;
	    	justify-content: center;
	    }
	    li {
	    	width: 100px;
			font-size: 20px;
		    text-align: center;
		    list-style: none;
		    border-right: 0;
		    border-bottom: 0;
		    padding: 20px 0;
		    cursor: pointer;
		    &:hover {
				background-image: none;
				background-color: #fff;
			    color: #333;		    
		    }    
	    }
	}
	.search_group {
		display: none;
	    position: absolute;
	    top: 70px;
	    left: 170px;
	    width: 211px !important;
	    z-index: 1000;
	    background: #fff;
	}
	.inputKeyword {
	    height: 40px;
    	width: 230px;
	}
	
	.store_name_design {
		font-size: 25px;
	    font-weight: bold;
	    padding-top: 10px;		
	}
</style>

<script type="text/javascript">
	function searchMenuCategory(menuCategory) {
		$('[name=column]').val(menuCategory)
		$("form[name='menuForm']").attr("method", "POST").attr("action", "/menu/list").submit();
	}
	$(function() {
		$('.main_search').on("click", function(){
		    var searchGroup = $('.search_group');
		    if (searchGroup.css("display") === "block") {
		        searchGroup.css("display", "none");
		    } else {
		        searchGroup.css("display", "block");
		    }
		});
	});
	
	
	// 담기 버튼을 클릭할 때 실행되는 함수
	function addToCart(menuNo) {
		var menuNo = document.querySelector("${menuDto.menuNo}");
	    // AJAX를 사용하여 서버에 POST 요청을 보냄
	    $.ajax({
	        url: "http://localhost:8080/cart/add",
	        method: "POST",
	        data: {
	            menuNo: menuNo // 선택한 메뉴의 식별자를 서버로 전달
	        },
	        success: function(response) {
	            // 성공적으로 처리된 경우, 사용자에게 알림 등을 표시할 수 있음
	            alert("장바구니에 메뉴가 추가되었습니다!");
	        },
	        error: function(xhr, status, error) {
	            // 요청이 실패한 경우, 사용자에게 에러 메시지를 표시할 수 있음
	            alert("카트에 메뉴를 추가하는 중 오류가 발생했습니다: " + error);
	        }
	    });
	};
</script>
<form class="menuCategoryBar" name="menuForm" action="list" method="get">
	<div>
		<ul>
			<li class="main_search">
				<i class="fa-solid fa-magnifying-glass fa-images"></i>
			</li>
			<div class="search_group">
				<input type="search" class="inputKeyword" name="keyword" placeholder="음식점이나 메뉴를 검색해보세요."">
			</div>			
			<li value="한식" onclick='searchMenuCategory("한식")'>한식</li>
			<li value="중식" onclick='searchMenuCategory("중식")'>중식</li>
			<li value="일식" onclick='searchMenuCategory("일식")'>일식</li>
			<li value="양식" onclick='searchMenuCategory("양식")'>양식</li>
			<li value="치킨" onclick='searchMenuCategory("치킨")'>치킨</li>
			<li value="피자" onclick='searchMenuCategory("피자")'>피자</li>
			<li value="햄버거" onclick='searchMenuCategory("햄버거")'>햄버거</li>
			<input type="hidden" name="column">
		</ul>
	</div>
</form>
<div class="cell">
   <h3 class="menu-button-style">
      <a class="list-button-style gray" href="insert?storeNo=${storeNo}">
         <i class="fa-solid fa-plus"></i>
         메뉴등록
      </a>
   </h3>
   <p class="right">메뉴 검색창 만들기</p>
   <div class="cell center store_name_design">
   <i class="fa-solid fa-quote-left"></i>내 가게 메뉴 리스트<i class="fa-solid fa-quote-right"></i></div>
   
   <div class="menulist">
   <form action="list" method="post" autocomplete="off" onsubmit="return submitForm()">
      <c:forEach var="menuDto" items="${list}">
         <div class="cell flex-cell card menuCard">
             <div class="w-25 flex-cell middle">
                 <div class="img_wrap">
                    <img src="menuPhoto?menuNo=${menuDto.menuNo}" width="80">
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
         <div class="cell right">
         	<button class="btn" onclick="addToCart(${menuDto.menuNo});">담기</button>
        </div>
      </c:forEach>
      </form>
   </div>
</div>



<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>