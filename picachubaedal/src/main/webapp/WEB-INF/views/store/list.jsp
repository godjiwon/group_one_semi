<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
    .storelist {
        display: flex;
        flex-direction: column;
        align-items: center;    
    }
    
    .storeCard {
        width: 700px;
        height: 100px;
    }
    
    .storeSubCard {
        display: flex;
        flex-direction: column;
        justify-content: space-between;    
    }
    
    .menu-title-wrapper {
        font-size: 20px;
    }
    
    .storeImage {
        width: 80px;
    }
    
    .list-button-style {
        font-size: 16px;
        text-decoration: none;
    }
</style>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="cell">
    <h3 class="menu-button-style">
        <a class="list-button-style gray" href="/store/insert1">
            <i class="fa-solid fa-plus"></i>
            가게 등록
        </a>
    </h3>
    <div class="storelist">
        <c:forEach var="dto" items="${list}">
            <div class="cell flex-cell card storeCard">
                <div class="w-25 flex-cell middle">
                    <img class="storeImage" src="${storeDto.storeImgLink}" width="80">
                </div>
                <div class="content-wrapper width-fill p-10 storeSubCard">
                    <div class="menu-title-wrapper">
                        <div>${storeDto.storeName}</div>  
                        <div>  
                            <span>${storeDto.storeDelivery}</span>
                            <span>${storeDto.storeAddress1} ${storeDto.storeAddress2}</span>
                        </div>              
                    </div>     
                    <div class="right">
                        <a class="list-button-style blue" href="/store/change">
                            <i class="fa-solid fa-pencil"></i>
                            수정
                        </a>
                        <span> | </span>
                        <a class="list-button-style gray" href="/store/delete?storeNo=${storeDto.storeNo}">
                            <i class="fa-solid fa-minus"></i>
                            삭제
                        </a>               
                    </div> 
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
