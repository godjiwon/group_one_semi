<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-800">
    <div class="cell center">
        <h1>가게 목록</h1>
    </div>
    
    <div class="cell right">
        <h2><a class="link link-animation" href="insert1">신규 가게 등록</a></h2>
    </div>

    <div class="cell">
        <!-- 목록 출력 -->
        <table class="table table-horizontal">
            <thead>
                <tr>
                    <th>가게번호</th>
                    <th>가게이름</th>
                    <th>이미지</th>
                    <th>주소</th>
                    <th>음식 카테고리</th>
                    <th>배달 or 포장</th>
                    <th>연락처</th>
                    <th>가게 운영시간</th>
                    <th>배달 가능지역</th>
                    <th>가게 휴무일</th>
                </tr>
            </thead>
            <tbody align="center">
                <c:forEach var="dto" items="${categoryList}">
                    <tr onclick="window.location.href='detail?storeNo=${dto.storeNo}'" style="cursor: pointer;">
                        <td>${dto.storeNo}</td>
                        <td>${dto.storeName}</td>
                        <td><img src="${dto.storeImgLink}" width="40" height="40"></td>
                        <td>${dto.storeAddress1}</td>
                        <td>${dto.storeCategory}</td>
                        <td>${dto.storeType}</td>
                        <td>${dto.storeContact}</td>
                        <td>${dto.storeOpenHour} - ${dto.storeCloseHour}</td>
                        <td>${dto.storeDelivery}</td>
                        <td>${dto.storeClosed}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <%-- 네비게이터 --%>
        <div class="page-navigator" id="pageNavigator">
            <%-- 이전 버튼 --%>
            <c:choose>
                <c:when test="${storeVO.isFirstBlock()}">
                    <a class="off">&lt;이전</a>
                </c:when>
                <c:otherwise>
                    <a href="list?page=${storeVO.getPrevBlock()}&${storeVO.getQueryString()}">&lt;이전</a>
                </c:otherwise>
            </c:choose>
            
            <%-- 페이지 숫자 --%>
            <c:forEach var="pageNumber" begin="${storeVO.getBeginBlock()}" end="${storeVO.getEndBlock()}" step="1">
                <c:choose>
                    <c:when test="${storeVO.isCurrentPage(pageNumber)}">
                        <a class="on">${pageNumber}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="list?page=${pageNumber}&${storeVO.getQueryString()}">${pageNumber}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            <%-- 다음 버튼 --%>
            <c:choose>
                <c:when test="${storeVO.isLastBlock()}">
                    <a class="off">다음&gt;</a>
                </c:when>
                <c:otherwise>
                    <a href="list?page=${storeVO.getNextBlock()}&${storeVO.getQueryString()}">다음&gt;</a> 
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script>
    // 네비게이터를 현재 페이지에만 표시하도록 설정
    var pageNavigator = document.getElementById("pageNavigator");
    pageNavigator.style.display = "none"; // 일단 숨기기

    // 페이지가 10개를 넘을 때만 네비게이터를 표시
    if (${storeVO.getTotalPage()} > 10) {
        pageNavigator.style.display = "block"; // 표시하기
    }
</script>
