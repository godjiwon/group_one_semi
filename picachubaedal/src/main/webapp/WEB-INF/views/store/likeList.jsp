<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>찜한 가게 목록</title>
    <style>
        .store-card {
            width: 18rem;
            margin: 10px;
        }
        .store-img {
            max-width: 100%;
            height: auto;
        }
    </style>
    
    <!-- 찜 -->
<c:if test="${sessionScope.loginId != null}">
	<script type="text/javascript">
		//좋아요 하트 클릭 이벤트
		$(function() {
			//(주의) 아무리 같은 페이지라도 서로 다른언어를 혼용하지 말것
			//- 자바스크립트에서 파라미터를 읽어 번호를 추출
			var params = new URLSearchParams(location.search);
			var storeNo = params.get("storeNo");

			//목표 : 하트를 클릭하면 좋아요 갱신처리
			$(".store-like").find(".fa-heart").click(
					function() {
						$.ajax({
							url : "${pageContext.request.contextPath}/rest/store_like/toggle",//같은 서버이므로 앞 경로 생략
							method : "post",
							data : {
								storeNo : storeNo
							},
							success : function(response) {
								//console.log(response);

								//response.state에 따라서 하트의 형태를 설정
								$(".store-like").find(".fa-heart").removeClass(
										"fa-solid fa-regular").addClass(
										response.state ? "fa-solid"
												: "fa-regular");

								//response.count에 따라서 좋아요 개수를 표시
								$(".store-like").find(".count").text(
										response.count);
							}
						});
					});
		});
	</script>
</c:if>
<script type="text/javascript">
	//좋아요 최초 불러오기
	$(function() {
		//(주의) 아무리 같은 페이지라도 서로 다른언어를 혼용하지 말것
		//- 자바스크립트에서 파라미터를 읽어 번호를 추출
		var params = new URLSearchParams(location.search);
		var storeNo = params.get("storeNo");

		//최초에 표시될 화면을 위해 화면이 로딩되자마자 서버로 비동기통신 시도
		$.ajax({
			url : "${pageContext.request.contextPath}/rest/store_like/check",
			method : "post",
			data : {
				storeNo : storeNo
			},
			success : function(response) {
				//response.state에 따라서 하트의 형태를 설정
				$(".store-like").find(".fa-heart").removeClass(
						"fa-solid fa-regular").addClass(
						response.state ? "fa-solid" : "fa-regular");

				//response.count에 따라서 좋아요 개수를 표시
				$(".store-like").find(".count").text(response.count);
			}
		});
	});
</script>
</head>
<body>
<div class="container">
    <div class="center">
        <h1>찜 목록</h1>
    </div>
    <c:if test="${not empty likeList}">
        <div class="row">
            <c:forEach items="${likeList}" var="store">
                <div class="col-md-4">
                    <div class="card store-card">
                    <a href="/menu/customerMenuList?storeNo=${store.storeNo}">
                        <img src="${imagePath}" width="150" height="100" class="card-img-top store-img"></a>
                        <div class="card-body">
                            <h5 class="card-title center">${store.storeName}</h5>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item text-center">찜<i class="fa-solid fa-heart" style="color: red;"></i> ${store.storeLike} </li>
                            <li class="list-group-item text-center">음식 카테고리 : ${store.storeCategory}</li>
                            <li class="list-group-item text-center">최소주문금액 ${store.storeMinprice}원</li>
                            <li class="list-group-item text-center">배달팁 ${store.storeDtip}원</li>
                        </ul>
                        <div class="card-body">
                            <a href="#" class="card-link"></a>
                       
                        </div>
                    </div>
                </div>
                
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${empty likeList}">
        <div class="center">
            <p>찜한 가게가 없습니다.</p>
        </div>
    </c:if>
</div>
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
