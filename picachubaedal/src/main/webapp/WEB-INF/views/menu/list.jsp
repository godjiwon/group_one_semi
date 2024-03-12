<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

</style>

<div class="cell">
	<h3 class="menu-button-style">
		<a class="btn-gradient green small" href="insert">
			<i class="fa-solid fa-plus"></i>
			메뉴등록
		</a>
	</h3>
	<c:if test="${menuDto.menuNo > 0}">
	<div class="cell flex-cell card">
	    <div class="w-25 flex-cell middle">
	        <img src="https://via.placeholder.com/200x200?text=F" width="80">
	    </div>
	    <div class="content-wrapper width-fill p-10">
	        <div class="title-wrapper">Test</div>  
	        <div> 
	            <span class="yellow">
	                <i class="fa-solid fa-star"></i> 4.9
	            </span>
	            <span class="gray">|</span> 
	            <span class="review-wrapper">
	                리뷰 293
	            </span>
	            <span class="gray">|</span> 
	            <span class="reply-wrapper">
	                사장님댓글 32
	            </span>
	        </div>    
	        <div>
	            <span class="red">요기서결제</span>
	            <span class="gray">|</span>
	            <span class="gray">15,000원 이상 배달</span>
	        </div>         
	        <div class="right">
	            <span class="gray">40~45분</span>
	        </div> 
	    </div>
	</div>
	</c:if>
</div>



<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>