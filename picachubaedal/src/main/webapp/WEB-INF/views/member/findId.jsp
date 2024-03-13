<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <!-- 여기에 CSS 링크 및 필요한 스타일 시트 등을 추가할 수 있습니다. -->
</head>
<body>
    <div class="cell">
        <form action="findId" method="post" autocomplete="off">
            <div class="container center w-400">
                <div class="cell center">
                    <h1>아이디 찾기</h1>
                </div>
                <div class="cell mt-0 flex-cell">
                    <input type="text" name="memberNick" required class="tool w-100" placeholder="닉네임을 입력하세요">
                    <button type="submit" class="btn positive"><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>
               
            </div>
             <c:if test="${not empty memberId}">
        <div class="cell center">
            <h2>${memberNick}님의 아이디는 다음과 같습니다:</h2>
            <h3>${memberId}</h3>
        </div>
    </c:if>
        </form>
    </div>
    
    <%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>