<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    padding: 20px;
}

.container {
    max-width: 800px;
    margin: auto;
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.review {
    display: flex;
    align-items: flex-start; /* start로 수정 */
    margin-bottom: 20px;
    background-color: #fafafa; /* 배경색 추가 */
    padding: 15px;
    border-radius: 8px;
}

.profile-picture img {
    width: 70px;
    height: 70px;
    border-radius: 50%;
    margin-right: 15px; /* margin-left를 margin-right로 수정 */
}

.review-content {
    flex: 1; /* 폭 조정을 위해 추가 */
}

.author {
    font-weight: bold; /* 저자명 강조 */
    margin-bottom: 5px; /* 저자명과 시간 사이 여백 추가 */
}

.timestamp {
    font-size: 12px;
    color: gray;
    margin-bottom: 10px; /* 시간과 내용 사이 여백 추가 */
}

.content {
    line-height: 1.5; /* 줄 간격 조정 */
}

/* 여기서부터 추가 스타일 */
.cell {
    margin-bottom: 20px; /* cell 간 여백 추가 */
}

h1 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

</style>



	<h1>리뷰게시판</h1>

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
						<div class="content">${reviewBoardDto.reviewBoardContent}</div>
					</div>
				</div>

			</div>
		</c:forEach>
	</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>