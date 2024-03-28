<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게 목록</title>
<style>

	.storeCategory {
        display: inline-block;
        margin: 20px;
        text-align: center;
        border-radius: 10px;
        overflow: hidden; /* 이미지 크기 고정을 위한 설정 */
    }

    .storeCategory img {
        width: 100px; /* 이미지 크기 조절 */
        height: 100px;
        border-radius: 10px;
        transition: transform 0.3s ease; /* 호버링 효과 적용을 위한 설정 */
    }

    .storeCategory:hover img {
        transform: scale(0.9); /* 호버링시 약간 커지는 효과 */
        
    }

	.food-category {
		text-align: center;
		font-size: 20px;
         > a {
            color: #939393 !important;
              text-decoration: none;         
         }
	}
	.food-category a {
        display: inline-block; /* 인라인 요소로 배치 */
        margin: 30px; /* 좌우 여백 설정 */
        padding: 0 30px 0 30px;
        text-align: center; /* 텍스트를 가운데 정렬 */
    }
    .food-category img {
        display: block; /* 이미지를 블록 요소로 설정하여 아래 텍스트와 수직 정렬 */
        margin: 0 auto 30px; /* 가로 가운데 정렬 및 아래 여백 추가 */
        vertical-align: middle; /* 이미지와 텍스트 수직 정렬 */
    }
	
	.banner-wrap {
	    display: flex;
	    justify-content: center;	
	}
	.banner_slide {
	    width: 1040px;
	}
	.banner_image {
		width: 100%;
		height: 200px;
		border-radius: 25px;
		margin-bottom: 10px;
	}
	.bannerList-top {
		display: flex;
		margin-bottom: 3px;
		> p {
			margin: 0;
		}
	}
	.banner-List {
	    display: flex !important;
	    flex-direction: column;
	    padding: 20px;
	    /* border: black solid;
	    border-radius: 50px; */
	    
		.banner_name {
	    	margin-right: 5px;
	    	font-size: 18px;
	    	font-weight: bold;
		}	    
	    > p {
	    	margin: 3px 0px 3px 0px;
	    	font-size: 16px;
	    }
	}
	.slick-prev {
	    position: absolute;
	    width: 50px;
	    height: 50px;
	    top: 40%;
	    left: -7%;
	    background-image: url(/image/left-arrow.png);
	    background-size: cover;
	    background-repeat: no-repeat;
	    text-indent: -10000px;
	    border: none;
	    background-color: transparent;
	    cursor: pointer; 
	}
	.slick-next {
	    position: absolute;
	    width: 50px;
	    height: 50px;
	    top: 40%;
	    right: -5%;
	    background-image: url(/image/right-arrow.png);
	    background-size: cover;
	    background-repeat: no-repeat;
	    text-indent: -10000px;
	    border: none;
	    background-color: transparent;
	    cursor: pointer;    
	}
	.banner_type {
		display: inline-block;
	    width: fit-content;
	    font-size: 13px !important;
	    font-weight: 600;
	    background-color: #f0f0f0;
	    padding: 5px;
	    border-radius: 6px;
	}
	.search-box {
	    width: 500px;
	    margin-top: 50px;
    	margin-bottom: 30px;
    	
    	> input {
    		border-radius: 10px; /* 모서리를 둥글게 설정 */
			overflow: hidden; /* 내부 요소가 모서리를 넘어가지 않도록 설정 */
    		height: 40px;
    		width: 80%;
    	}
    	
    	> button {
	    	border-radius: 10px; /* 모서리를 둥글게 설정 */
			overflow: hidden; /* 내부 요소가 모서리를 넘어가지 않도록 설정 */
    		height: 40px;
    		width: 10%;
    	}
	}
	
	.information {
        position: relative; /* 상대 위치 설정 */
        top: 50px; /* 위로 조금 이동 */
        display: flex; /* flex를 사용하여 아이콘과 텍스트를 가로로 정렬 */
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: center;
    }

    .information i {
        margin-right: 5px; /* 아이콘과 텍스트 사이 간격 조정 */
        color: rgb(253, 185, 30); /* 글자색 설정 */
    }
	
</style>
<script>
	$(document).ready(function() {
		$('.banner_slide').slick({

			slidesToShow: 5,
			slidesToScroll: 1,
			arrows: true,
			autoplay: true,
		    autoplaySpeed: 2000, 
			responsive: [
				    {
				      breakpoint: 1024,
				      settings: {
				        slidesToShow: 3,
				        slidesToScroll: 3,
				        infinite: true,
				        dots: true
				      }
				    },
				    {
				      breakpoint: 600,
				      settings: {
				        slidesToShow: 2,
				        slidesToScroll: 2
				      }
				    },
				    {
				      breakpoint: 480,
				      settings: {
				        slidesToShow: 1,
				        slidesToScroll: 1
				      }
				    }
				  ]			

		});
	});
</script>

</head>
<body>
	<div class="container center w-800">
		<%--로그인한 회원의 위치정보 --%>
<div class="cell information">
	<i class="fa-solid fa-location-dot"></i> ${memberDto.memberAddress1} ${memberDto.memberAddress2}
</div>
		<%--메뉴&가게 검색창 --%>
		<form action="/store/menuAndStoreList" method="get" autocomplete="off">

	
			<div class="cell center my-50"
				style="position: relative; display: inline-block;">
				<input type="text" class="tool w-80" size="25" placeholder="메뉴명을 검색하세요"
					name="menuName">
				<button type="submit" class="btn tool menu_search"
					style="background-color: rgb(254, 210, 61);">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</div>

		</form>
	</div>
	<div>
		<div class="food-category cell center">
			<a href="store/categoryList?storeCategory=치킨" class="storeCategory"> 
				<div>
					<img src="https://media.discordapp.net/attachments/1187318496942628876/1218122788485992449/image0.jpg?ex=66068440&is=65f40f40&hm=ec7ef7954591f58f89ca309828ab4161c6f33b923b02051b2916dcf5b2041294&=&format=webp">
				</div>

				<p>치킨</p>
			</a> <a href="store/categoryList?storeCategory=피자/양식"
				class="storeCategory"> <img
				src="https://media.discordapp.net/attachments/1187318496942628876/1218122853250236529/image0.jpg?ex=6606844f&is=65f40f4f&hm=e50e3b7c614936111a4fa91c296efd97cbd300397dfa63c9d20d14b7bc651a05&=&format=webp">
				<p>피자/양식</p>
			</a> <a href="store/categoryList?storeCategory=중국집" class=storeCategory>
				<img
				src="https://media.discordapp.net/attachments/1187318496942628876/1218122456359899196/image0.jpg?ex=660683f1&is=65f40ef1&hm=d287dcb573221b40eaa37566038d51acb1739349ad3fa97e077f1aac50537ec3&=&format=webp">
				<p>중식</p>
			</a> <a href="store/categoryList?storeCategory=한식" class="storeCategory">
				<img
				src="https://media.discordapp.net/attachments/1187318496942628876/1218123161405624430/image0.jpg?ex=66068499&is=65f40f99&hm=7896af7406ef73d7bc46257ff1545611fc6f262b480e5ad2bc848367f9ad5f11&=&format=webp">
				<p>한식</p>
			</a>
		</div>
		<div class="cell center food-category">
			<a href="store/categoryList?storeCategory=일식/돈까스"
				class="storeCategory"> <img
				src="https://media.discordapp.net/attachments/1187318496942628876/1218123251591544832/image0.jpg?ex=660684ae&is=65f40fae&hm=cdaa532ed83c07d08a53f8f2569a04dd5f3d208d362497cbb3b4bd622b2c66b1&=&format=webp">
				<p>일식/돈까스</p>
			</a> <a href="store/categoryList?storeCategory=야식" class="storeCategory">
				<img
				src="https://media.discordapp.net/attachments/1187318496942628876/1218123415324590170/image0.jpg?ex=660684d5&is=65f40fd5&hm=76d3d6399f074a3e19bcb7db68ab7025143e0c8eeb0a0a73cdccb2872864fb83&=&format=webp">
				<p>야식</p>
			</a> <a href="store/categoryList?storeCategory=분식" class="storeCategory">
				<img
				src="https://media.discordapp.net/attachments/1187318496942628876/1218123475240357888/image0.jpg?ex=660684e4&is=65f40fe4&hm=afe6026b2cbf238c0b0d7a545a4e8455cac496d54f698b07c87a1cbe90b7edbc&=&format=webp">
				<p>분식</p>
			</a> <a href="store/categoryList?storeCategory=카페/디저트"
				class="storeCategory"> <img
				src="https://cdn.discordapp.com/attachments/1187318496942628876/1218123541439053844/image0.jpg?ex=660684f3&is=65f40ff3&hm=f18cf93c233c619a3e125b5d257f9935bc765cc643a3e2551a8786ed4e9457bf&">
				<p>카페/디저트</p>
			</a>
		</div>
	</div>
	<div class="cell ">
		<h1>이런 가게는 어때요?</h1>
		<div class="banner-wrap">
			<div class="banner_slide">
				<c:set var="idx" value="0" />
				<c:forEach var="bannerList" items="${bannerList}">
					<c:set var="idx" value="${ idx+1 }" />
					<div class="banner-List">
						<a href="${pageContext.request.contextPath}/menu/customerMenuList?storeNo=${bannerList.storeNo}">
							<%-- <img class="banner_image" alt="배너이미지" src="/menu/homeBannerImage?storeNo=${bannerList.storeNo}"> --%>
							<img class="banner_image" alt="배너이미지"
							src="/image/test_image${idx}.jpg">
						</a>
						<div class="bannerList-top">
							<p class="banner_name">${bannerList.storeName}</p>
							<p>
								<i class="fa-solid fa-heart red" style="margin-right: 5px;"></i>${bannerList.storeLike}</p>
						</div>
						<p class="banner_category">
							배달팁
							<fmt:formatNumber value="${bannerList.storeDtip}" pattern="#,##0"></fmt:formatNumber>
							원
						</p>
						<p class="banner_contact">
							최소주문금액
							<fmt:formatNumber value="${bannerList.storeMinprice}"
								pattern="#,##0"></fmt:formatNumber>
							원
						</p>
						<p class="banner_type">${bannerList.storeType}</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>


<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

