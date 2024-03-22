<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게 목록</title>
<style>
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
</style>
<script>	
 	$( document ).ready(function() {
		$('.banner_slide').slick({
			slidesToShow: 5,
			slidesToScroll: 1,
			arrows: true,
			//autoplay: true,
		    //autoplaySpeed: 2000, 
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

	<%--메뉴&가게 검색창 --%>


	<div class="container center w-800">
		<form action="/store/menuAndStoreList" method="get" autocomplete="off">
    <div class="cell center my-50" style="position: relative; display: inline-block;">
        <input type="text" class="tool w-80" size="25" placeholder="메뉴 검색" name="menuName">
        <button type="submit" class="btn tool menu_search" style="background-color:rgb(254,210,61);">
            <i class="fa-solid fa-magnifying-glass"></i>
        </button>
    </div>
</form>
		<br> <br> <a href="store/categoryList?storeCategory=치킨"
			class="storeCategory"> 치킨 <img
			src="https://media.discordapp.net/attachments/1187318496942628876/1218122788485992449/image0.jpg?ex=66068440&is=65f40f40&hm=ec7ef7954591f58f89ca309828ab4161c6f33b923b02051b2916dcf5b2041294&=&format=webp">
		</a> <a href="store/categoryList?storeCategory=피자/양식"
			class="storeCategory"> 피자/양식 <img
			src="https://media.discordapp.net/attachments/1187318496942628876/1218122853250236529/image0.jpg?ex=6606844f&is=65f40f4f&hm=e50e3b7c614936111a4fa91c296efd97cbd300397dfa63c9d20d14b7bc651a05&=&format=webp">
		</a> <a href="store/categoryList?storeCategory=중국집" class=storeCategory>
			중식 <img
			src="https://media.discordapp.net/attachments/1187318496942628876/1218122456359899196/image0.jpg?ex=660683f1&is=65f40ef1&hm=d287dcb573221b40eaa37566038d51acb1739349ad3fa97e077f1aac50537ec3&=&format=webp">
		</a> <a href="store/categoryList?storeCategory=한식" class="storeCategory">
			한식 <img
			src="https://media.discordapp.net/attachments/1187318496942628876/1218123161405624430/image0.jpg?ex=66068499&is=65f40f99&hm=7896af7406ef73d7bc46257ff1545611fc6f262b480e5ad2bc848367f9ad5f11&=&format=webp">
		</a>
	</div>
	<div class="cell center">
		<a href="store/categoryList?storeCategory=일식/돈까스"
			class="storeCategory"> 일식/돈까스 <img
			src="https://media.discordapp.net/attachments/1187318496942628876/1218123251591544832/image0.jpg?ex=660684ae&is=65f40fae&hm=cdaa532ed83c07d08a53f8f2569a04dd5f3d208d362497cbb3b4bd622b2c66b1&=&format=webp">
		</a> <a href="store/categoryList?storeCategory=야식" class="storeCategory">
			야식 <img
			src="https://media.discordapp.net/attachments/1187318496942628876/1218123415324590170/image0.jpg?ex=660684d5&is=65f40fd5&hm=76d3d6399f074a3e19bcb7db68ab7025143e0c8eeb0a0a73cdccb2872864fb83&=&format=webp">
		</a> <a href="store/categoryList?storeCategory=분식" class="storeCategory">
			분식 <img
			src="https://media.discordapp.net/attachments/1187318496942628876/1218123475240357888/image0.jpg?ex=660684e4&is=65f40fe4&hm=afe6026b2cbf238c0b0d7a545a4e8455cac496d54f698b07c87a1cbe90b7edbc&=&format=webp">
		</a> <a href="store/categoryList?storeCategory=카페/디저트"
			class="storeCategory"> 카페/디저트 <img
			src="https://cdn.discordapp.com/attachments/1187318496942628876/1218123541439053844/image0.jpg?ex=660684f3&is=65f40ff3&hm=f18cf93c233c619a3e125b5d257f9935bc765cc643a3e2551a8786ed4e9457bf&">
		</a>
	</div>
	<br>
	<br>
	<br>

	<div class="cell ">
		<h1>이런 가게는 어때요?</h1>
		<div class="banner-wrap">
			<div class="banner_slide">
				<c:set var="idx" value="0" />
				<c:forEach var="bannerList" items="${bannerList}">
					<c:set var="idx" value="${ idx+1 }" />
					<div class="banner-List">
						<%-- <img class="banner_image" alt="배너이미지" src="/menu/homeBannerImage?storeNo=${bannerList.storeNo}"> --%>
						<img class="banner_image" alt="배너이미지" src="/image/test_image${idx}.jpg">
						<div class="bannerList-top">
							<p class="banner_name">${bannerList.storeName}</p>
							<p><i class="fa-solid fa-heart red" style="margin-right: 5px;"></i>${bannerList.storeLike}</p>
						</div>
						<p class="banner_category">배달팁 <fmt:formatNumber value="${bannerList.storeDtip}" pattern="#,##0"></fmt:formatNumber>원</p>
						<p class="banner_contact">최소주문금액 <fmt:formatNumber value="${bannerList.storeMinprice}" pattern="#,##0"></fmt:formatNumber>원</p>
						<p class="banner_type">
							${bannerList.storeType}
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>


<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

