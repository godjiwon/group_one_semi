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
	    padding-top: 10px;		
	}
	.menu-info-style {
		font-size: 15px;
	}
	
	.list-button-style.disabled {
        pointer-events: none; /* 클릭 이벤트 비활성화 */
        opacity: 0.5; /* 투명도 조절 */
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
	$(window).scroll(function() {
		if ($(window).scrollTop() + $(window).innerHeight() >= $('html').prop('scrollHeight')) {
	  		const menuForm = $("form[name='menuForm']");
	  		const currentPage = $(".currentPage").val();
	  		$(".currentPage").val(Number(currentPage)+1);
	  		const param = {
	  			"keyword": $('.keyword').val(),
	  			"page": $(".currentPage").val(),
	  			"column": $(".column").val(),
	  		}
	  		if(Number($(".currentPage").val()) > Number($(".totalPage").val())){
	  			return;
	  		}
	  		$.ajax({
	  		    url: "/rest/menu/restList",
	  		    type: "POST",
	  		    data: JSON.stringify(param),
	  		    dataType: 'json',
	  		    contentType: "application/json; charset=UTF-8",
	  		    success: function(result) {
	  		    	console.log(result);
	  		        const menuDtoList = result.list;
	  		        var display = '';
	  		        menuDtoList.forEach((menuDto) => {
	  		            display += '<div class="cell flex-cell card menuCard">'
	  		                     + '    <div class="w-25 flex-cell middle">'
	  		                     + '        <div class="img_wrap">'
	  		                     + '            <img src="menuPhoto?menuNo=' + menuDto.menuNo + '" width="80">'
	  		                     + '        </div>'
	  		                     + '    </div>'
	  		                     + '    <div class="content-wrapper width-fill p-10 menuSubCard">'
	  		                     + '        <div class="menu-title-wrapper">'
	  		                     + '            <div>' + menuDto.menuName + '';
	  		            if (menuDto.menuState === 'N') {
	  		            display  += '                <span class="red review-wrapper">(품절)</span>';
	  		            }
	  		            display  + '            </div>'
	  		                     + '            <div>'
	  		                     + '                <span>' + menuDto.menuPrice + '개</span>'
	  		                     + '            </div>'
	  		                     + '            <div class="menu-info-style right gray">'
	  		                     + '                <span>등록일 : ' + menuDto.menuTime + '</span>';
	  		            if (menuDto.menuUpdate !== null && menuDto.menuUpdate !== "") {
	  		            display  += '                <span> | 수정일 : ' + menuDto.menuUpdate + '</span>';
	  		            }
	  		            display  += '            </div>'
	  		                     + '        </div>'
	  		                     + '        <div class="right">'
	  		                     + '            <a class="list-button-style blue" href="/menu/edit?menuNo=' + menuDto.menuNo + '">'
	  		                     + '                <i class="fa-solid fa-pencil"></i>수정'
	  		                     + '            </a>'
	  		                     + '            <span> | </span>'
	  		                     + '            <a class="list-button-style gray" href="/menu/delete?menuNo=' + menuDto.menuNo + '">'
	  		                     + '                <i class="fa-solid fa-minus"></i>삭제'
	  		                     + '            </a>'
	  		                     + '        </div>'
	  		                     + '    </div>'
	  		                     + '</div>';
	  		        });
	  		        $(".menulist").append(display);
	  		    }
	  		});
	  	}
	});
	
	$(document).ready(function() {
        // 품절 상태 메뉴의 링크를 비활성화하는 함수
        function disableSoldOutMenus() {
            $('.menuCard').each(function() {
                var $menuCard = $(this);
                if ($menuCard.find('.review-wrapper').length > 0) {
                    // 품절 상태인 경우
                    $menuCard.find('.list-button-style').addClass('disabled').removeAttr('href').css('cursor', 'not-allowed');
                }
            });
        }

        // 페이지 로드 시 품절 상태인 메뉴 확인 후 링크 비활성화
        disableSoldOutMenus();
    });
</script>

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
         </div>
         <div class="right">
			<a class="btn-gradient orange" href="/cart/list?menuNo=${menuDto.menuNo}">
			   <i class="fa-solid fa-pencil"></i>
			   메뉴담기
			</a>                
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