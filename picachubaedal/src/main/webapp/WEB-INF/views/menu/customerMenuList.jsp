<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.header-hr {
	display: none;
}

.card {
	box-shadow: 0 0 1px 1px #b2bec3;
}

.card>.content-wrapper>.title-wrapper {
	font-size: 24px;
}

.flex-cell.middle {
	justify-content: center;
	align-items: center;
}

.empty-flex-cell {
	display: flex;
	justify-content: center;
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
	text-align: center; > img { width : 100%;
	height: 100%;
	padding: 10px;
}

}
.list-button-style {
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
	background-color: #fed23d; ul { display : flex;
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
	cursor: pointer; &: hover { background-image : none;
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
<script type="text/javascript">
	function searchMenuCategory(menuCategory) {
		$('[name=column]').val(menuCategory)
		$("form[name='menuForm']").attr("method", "POST").attr("action",
				"/menu/customerMenuList").submit();
	}
	$(function() {
		$('.main_search').on("click", function() {
			var searchGroup = $('.search_group');
			if (searchGroup.css("display") === "block") {
				searchGroup.css("display", "none");
			} else {
				searchGroup.css("display", "block");
			}
		});
	});

	$(function() {
		$(".addCart").click(function() {
			alert("메뉴가 장바구니에 추가되었습니다.");
		});
	});
	$(function() {
		$(".soldOut").click(function() {
			alert("품절된 상품입니다.");
			return false;
		});
	});
</script>
<form class="menuCategoryBar" name="menuForm" action="customerMenuList" method="get">
	<div>
		<ul>
			<li class="main_search"><i
				class="fa-solid fa-magnifying-glass fa-images"></i></li>
			<div class="search_group">
				<input type="search" class="inputKeyword" name="keyword" placeholder="메뉴를 검색해보세요.">
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
			<input type="hidden" name="page" class="totalPage"
				value="${pageVO.totalPage}">
		</ul>
	</div>

</form>
<div class="cell">
	<div class="cell center store_name_design">
		<i class="fa-solid fa-quote-left"></i>${storeDto.storeName}<i
			class="fa-solid fa-quote-right"></i>가게 정보
	</div>
	<div class="col-md-3">
		<div class="cell center storelist" >
					<div>
						<img src="${imagePath}" width="700" height="300">
					</div>
					<div>
					<span>운영시간 ${storeDto.storeOpenHour}</span>
					<span> -	${storeDto.storeCloseHour}</span>
					<span>휴무일: ${storeDto.storeClosed}</span>
					</div>
					<div>
					<span>배달/포장 : ${storeDto.storeType}</span>
					<span>배달팁: ${storeDto.storeDtip}원</span>
							<span
								class="store-like red">찜 <i class="fa-regular fa-heart"></i>
									<span class="count">${storeDto.storeLike}</span>
							</span>
							<div>
							<span>사장님 한마디</span>
							<form>${storeDto.storeIntro}</form>
							</div>
			</div>

		</div>
	</div>

	<div class="menulist">
		<c:if test="${list.size() != 0}">
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
									<span class="red review-wrapper"> (품절) </span>
								</c:if>
							</div>
							<div>
								<span><fmt:formatNumber value="${menuDto.menuPrice}"
										pattern="#,##0"></fmt:formatNumber>개</span>
							</div>
						</div>
					</div>

					<div class="text-center pt-30">
						<form action="/cart/insert" method="post" autocomplete="off">


							<c:choose>
								<c:when test="${menuDto.menuState == 'N'}">
									<button class="btn btn-gradient orange pt-20 soldOut">메뉴
										담기</button>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="memberNo" class="tool w-100"
										value="<%=session.getAttribute("memberNo")%>">
									<input type="hidden" name="menuNo" placeholder="메뉴번호써라"
										class="tool w-100" value="${menuDto.menuNo}">
									<input type="hidden" name="itemName" placeholder="아이템이름(메뉴이름)"
										class="tool w-100" value="${menuDto.menuName}">
									<input type="hidden" name="itemPrice" placeholder="아이템가격(메뉴가격)"
										class="tool w-100" value="${menuDto.menuPrice}">
									<input type="hidden" name="itemQuantify"
										placeholder="아이템수량(메뉴수량)" class="tool w-100" value="1">
									<input type="hidden" name="storeNo" class="tool w-100"
										value="${param.storeNo}">

									<button class="btn btn-gradient orange pt-20 addCart">
										메뉴담기</button>
								</c:otherwise>
							</c:choose>

						</form>
					</div>

				</div>
			</c:forEach>
		</c:if>
		<c:if test="${list.size() == 0}">
			<div class="cell empty-flex-cell card menuCard">
				<div>
					<h1>메뉴가 없습니다.</h1>
				</div>
			</div>
		</c:if>

	</div>
	<%-- 네비게이터 --%>
	<div class="page-navigator">
		<%-- 이전이 있을 경우만 링크를 제공 --%>
		<c:choose>
			<c:when test="${pageVO.isFirstBlock()}">
				<a class="off">&lt;이전</a>
			</c:when>
			<c:otherwise>
				<a
					href="customerMenuList?page=${pageVO.getPrevBlock()}&${pageVO.getQueryString()}">&lt;이전</a>
			</c:otherwise>
		</c:choose>

		<%-- for(int i=beginBlock; i <= endBlock; i++) { .. } --%>
		<c:forEach var="i" begin="${pageVO.getBeginBlock()}"
			end="${pageVO.getEndBlock()}" step="1">
			<%-- 다른 페이지일 경우만 링크를 제공 --%>
			<c:choose>
				<c:when test="${pageVO.isCurrentPage(i)}">
					<a class="on">${i}</a>
				</c:when>
				<c:otherwise>
					<a
						href="customerMenuList?page=${i}&${pageVO.getQueryString()}&storeNo=${storeNo}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<%-- 다음이 있을 경우만 링크를 제공 --%>
		<c:choose>
			<c:when test="${pageVO.isLastBlock()}">
				<a class="off">다음&gt;</a>
			</c:when>
			<c:otherwise>
				<a
					href="customerMenuList?page=${pageVO.getNextBlock()-1}&${pageVO.getQueryString()}">다음&gt;</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>



<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>