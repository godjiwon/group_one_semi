<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.header-hr {
	    display: none;
	}
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
       height: 130px
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
	    	margin-top: 0;
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
		font-size: 28px;
	    font-weight: bold;
	    padding-top: 30px;
	    padding-bottom: 30px;			
	}
	.menu-info-style {
		font-size: 15px;
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

</script>
<form class="menuCategoryBar" name="menuForm" action="list" method="get">
	<div>
		<ul>
			<li class="main_search">
				<i class="fa-solid fa-magnifying-glass fa-images"></i>
			</li>
			<div class="search_group">
				<input type="search" class="inputKeyword" name="keyword" placeholder="메뉴를 검색해보세요."">
			</div>			
			<li value="추천메뉴" onclick='searchMenuCategory("추천메뉴")'>추천메뉴</li>
			<li value="식사메뉴" onclick='searchMenuCategory("식사메뉴")'>식사메뉴</li>
			<li value="사이드" onclick='searchMenuCategory("사이드")'>사이드</li>
			<li value="세트" onclick='searchMenuCategory("세트")'>세트</li>
			<li value="추가" onclick='searchMenuCategory("추가")'>추가</li>
			<li value="디저트" onclick='searchMenuCategory("디저트")'>디저트</li>
			<li value="음료/ 주류" onclick='searchMenuCategory("음료/ 주류")'>음료/ 주류</li>
			<input type="hidden" name="column">
			<input type="hidden" name="page" class="currentPage" value="1">
			<input type="hidden" name="page" class="totalPage" value="${pageVO.totalPage}">
		</ul>
	</div>
</form>
<div class="cell">
   <div class="cell center store_name_design">
   <i class="fa-solid fa-quote-left"></i>${storeDto.storeName}<i class="fa-solid fa-quote-right"></i> 메뉴 리스트</div>
   
   <div class="menulist">
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
							<span><fmt:formatNumber value="${menuDto.menuPrice}" pattern="#,##0"></fmt:formatNumber>개</span>
	                    </div>
                 </div>   
             </div>
             <div class="text-center pt-30">
				<a class="btn btn-gradient orange pt-20" href="/cart/list?menuNo=${menuDto.menuNo}">
                   메뉴담기
                </a>
              </div>              
         </div>
      </c:forEach>
   </div>
<%-- 네비게이터 --%>
<div class="page-navigator">
	<%-- 이전이 있을 경우만 링크를 제공 --%>
	<c:choose>
		<c:when test="${pageVO.isFirstBlock()}">
			<a class="off">&lt;이전</a>
		</c:when>
		<c:otherwise>
			<a href="customerMenuList?page=${pageVO.getPrevBlock()}&${pageVO.getQueryString()}">&lt;이전</a>
		</c:otherwise>
	</c:choose>
	
	<%-- for(int i=beginBlock; i <= endBlock; i++) { .. } --%>
	<c:forEach var="i" begin="${pageVO.getBeginBlock()}" end="${pageVO.getEndBlock()}" step="1">
		<%-- 다른 페이지일 경우만 링크를 제공 --%>
		<c:choose>
			<c:when test="${pageVO.isCurrentPage(i)}">
				<a class="on">${i}</a>
			</c:when>
			<c:otherwise>
				<a href="customerMenuList?page=${i}&${pageVO.getQueryString()}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<%-- 다음이 있을 경우만 링크를 제공 --%>
	<c:choose>
		<c:when test="${pageVO.isLastBlock()}">
			<a class="off">다음&gt;</a>
		</c:when>
		<c:otherwise>
			<a href="customerMenuList?page=${pageVO.getNextBlock()-1}&${pageVO.getQueryString()}">다음&gt;</a> 
		</c:otherwise>
	</c:choose>
</div>
</div>



<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>