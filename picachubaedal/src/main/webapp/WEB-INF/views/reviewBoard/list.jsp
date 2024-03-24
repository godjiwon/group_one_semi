<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 테스트용</title>
<link rel="stylesheet" type="text/css" href="/css/commons.css">
</head>
<style>
.review {
	display: flex;
	align-items: start;
	margin-bottom: 20px;
}

.profile-picture img {
	width: 70px;
	height: 70px;
	border-radius: 50%;
	margin-left: 10px;
	margin-top: 0px;
}

.review-content {
	margin-left: 10px;
}

.timestamp {
	font-size: 12px;
	color: gray;
}

.content {
	margin-top: 5px;
}
</style>
<body>
	<h1>리뷰리스트 테스트용</h1>

	<div class="container w-1000">
		<c:forEach var="reviewBoardDto" items="${list}">
			<div class="cell">
				<div class="review w-100">
					<div class="profile-picture">
						<img src="${reviewBoardDto.userImgLink}">
					</div>

					<div class="review-content">
						<div class="author">${reviewBoardDto.nickname}</div>
						<div class="timestamp">${reviewBoardDto.reviewBoardDate}</div>
						<div>이미지칸 임시</div>
						<div class="content">${reviewBoardDto.reviewBoardContent}</div>
					</div>
				</div>

			</div>
		</c:forEach>
	</div>

</body>
</html>