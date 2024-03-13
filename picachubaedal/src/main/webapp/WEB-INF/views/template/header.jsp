<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>배츄</title>
   
   <!-- 구글 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- 내가 구현한 스타일 -->
   <link rel="stylesheet" type="text/css" href="/css/commons.css">
   <!-- <link rel="stylesheet" type="text/css" href="/css/test.css"> -->
   <link rel="stylesheet" type="text/css" href="/css/layout.css">
    
    <!-- font awesome 아이콘 CDN -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <!-- jQuery CDN -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
   
   <!-- summernote cdn-->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
   
   <style> 
       .header_wrap {
		    display: flex;
		    align-items: flex-end;  
		}
      
      .header_sideMenu {
         font-size: 20px;
         > a {
            color: #939393 !important;
              text-decoration: none;         
         }
      }
      
      .header-font-style {
		flex: 1;
		font-weight: bold;
		font-size: 45px;
      }
      
      .hr.hr-border {
		border: 0;
    	height: 3px;
    	background: #fed23d;
      }
   </style>
   
   <script>
   
   </script>
   
   <!-- 내가 만든 JS -->
   <script src="/js/commons.js"></script>
   
</head>

<%-- 
   상단 영역
   - 홈페이지에서 가장 많이 보이는 부분
   - 로고, 검색창, 각종 메뉴들을 배치   
   - div는 투명한 영역
--%>

<body>
   <main>  
   <div class="header">
       <div class="header_wrap">
           <a href="/">
               <img class="image-test" src="/image/pica.png" width="110" height="110">
           </a>
           <div class="cell center header-font-style">배츄</div>
         <div class="header_sideMenu right">
              <c:choose>
						<c:when test="${sessionScope.loginId != null}">
							<a href="/member/mypage"> <i class="fa-solid fa-user"></i>
								${sessionScope.loginId}
							</a>
							<ul>
								<a href="/member/mypage">마이페이지</a>
								<a href="/member/logout">로그아웃</a>
							</ul>
						</c:when>
						<c:otherwise>
							<a href="/member/signin">로그인</a>
							<a href="/member/signup">회원가입</a>
							
						</c:otherwise>
					</c:choose>
        </div>           
       </div>
   </div>
   
   <hr class="hr hr-border">


        <div class="section">
<!--             <div class="aside"></div> -->
            <div class="article">
   <%-- 
      중단 영역
      - 실질적인 홈페이지의 내용이 표시되는 영역
      - 크기는 무제한으로 늘어날 수 있음
    --%>


