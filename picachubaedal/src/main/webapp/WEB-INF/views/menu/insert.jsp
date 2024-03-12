<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="cell center">
	<h1>메뉴 등록</h1>
</div>
<div>
<form class="menu_form" method="post" id="insert_form" action="/menu/insert" 
autocomplete="off" onsubmit="return ">
<div>
	
</div>
</form>
</div>



<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>