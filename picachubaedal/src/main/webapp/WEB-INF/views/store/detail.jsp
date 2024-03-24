<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.storeImage {
	width: 250px;
	height: 250px;
	display: block; /* 이미지를 블록 레벨 요소로 설정하여 가운데 정렬합니다. */
	margin: 0 auto; /* 이미지를 가운데 정렬합니다. */
}
</style>
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
							url : "/rest/store_like/toggle",//같은 서버이므로 앞 경로 생략
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
			url : "/rest/store_like/check",
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

<div class="container w-1000">
	<div class="cell">
		<input type="text" name="memberNo" placeholder="멤버넘버"
			value="<%=session.getAttribute("memberNo")%>">
		<h1>${storeDto.storeName}</h1>
	</div>
	<div class="cell floating-cell">
		<div class="w-25 row">

			<div class="col-md-3">
				<div class="cell center">
					<img class="storeImage" src="${storeDto.storeImgLink}">
				</div>
				<div class="cell center">
					<h2>


						<a class="link link-animation" href="/store/list">가게 목록</a>
					</h2>
				</div>

				<hidden input type="text" name="storeNo" placeholder="세션 가게넘버"
					value="${storeDto.storeNo}">

				<div class="cell center">
					<h2>
						<a class="link link-animation"
							href="/store/change?storeNo=${storeDto.storeNo}">가게 정보 수정</a>
					</h2>
				</div>



				<div class="cell center">
					
						<h2>
						<a class="link link-animation" href="/menu/ceoMenuList?storeNo=${storeDto.storeNo}">
						메뉴 리스트</a>
					</h2>
				</div>
				<div class="cell center">
					<h2>
						<a class="link link-animation" href="/store/storeDelete"
							style="color: red">가게 삭제</a>
					</h2>
				</div>
			</div>
		</div>
		<div class="w-75">
			<div class="cell"></div>
			<div class="w-75">
				<div class="cell">
					<h2>가게 정보</h2>
				</div>
				<div class="cell">
					<table class="table table-horizontal">
						<tr>
							<th width="30%">가게 이름</th>
							<td class="left">${storeDto.storeName}</td>
						</tr>
						<tr>
							<th>가게 번호</th>
							<td class="left">${storeDto.storeNo}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td class="left">${storeDto.storeAddress1}
								${storeDto.storeAddress2}</td>
						</tr>
						<tr>
							<th>음식 카테고리</th>
							<td class="left">${storeDto.storeCategory}</td>
						</tr>
						<tr>
							<th>배달/포장</th>
							<td class="left">${storeDto.storeType}</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td class="left">${storeDto.storeContact}</td>
						</tr>
						<tr>
							<th>가게 소개</th>
							<td class="left">${storeDto.storeIntro}</td>
						</tr>
						<tr>
							<th>배달팁</th>
							<td class="left">${storeDto.storeDtip}</td>
						</tr>
						<tr>
							<th>최소 주문금액</th>
							<td class="left">${storeDto.storeMinprice}</td>
						</tr>
						<tr>
							<th>좋아요 수</th>
							<td class="left"><span
								class="store-like red"> <i class="fa-regular fa-heart"></i>
									<span class="count"></span>
							</span>
							</td>
						</tr>
						<tr>
							<th>영업 시간</th>
							<td class="left">${storeDto.storeOpenHour}-
								${storeDto.storeCloseHour}</td>
						</tr>
						<tr>
							<th>배달 가능 지역</th>
							<td class="left">${storeDto.storeDelivery}</td>
						</tr>
						<tr>
							<th>휴무일</th>
							<td class="left">${storeDto.storeClosed}</td>
						</tr>
						<tr>
							<th>가게 등록일</th>
							<td class="left">${storeDto.storeTime}</td>
						</tr>
						<tr>
							<th>가게 수정일</th>
							<td class="left">${storeDto.storeUpdate}</td>
						</tr>
						<tr>
							<th>사업자 등록번호</th>
							<td class="left">${storeDto.storeBusinessNumber}</td>
						</tr>
					</table>


				</div>
			</div>