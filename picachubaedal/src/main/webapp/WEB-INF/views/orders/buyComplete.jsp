<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
        .w-40 {
            width: 40%;
        }

        .rotateball:hover {
            transform: rotate(360deg);
            transition : transform 1s;
        }

        .delivery {
            position: relative;
            left: 400px;
            animation-duration: 4s;
            animation-name: delivery;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
        }

        @keyframes delivery {
            from {
                left: 800px;
            }

            to {
                left: -800px;
            }
        }

        .text {
            font-family: 빙그레 메로나체, sans-serif;
            font-size: 36px;
            font-weight: 700;
            letter-spacing: 0.05em;
            text-align: center;
            /* text-shadow: -1px -1px 0 #2d3436,
                                1px -1px 0 #2d3436,
                                -1px 1px 0 #2d3436,
                                1px 1px 0 #2d3436; */
            color: rgb(253, 185, 30);
            opacity: 0;
            animation: fadeInText 2s 6s ease-out forwards;
        }

        @keyframes fadeInText {
            100% {
                opacity: 1;
            }
        }

        .text-out {
            font-family: 빙그레 메로나체, sans-serif;
            font-size: 20px;
            animation: fadeOutText 2s 4s ease-out forwards;
        }

        @keyframes fadeOutText {
            100% {
                opacity: 0;
            }
        }
    </style>

<div class="container w-600">

        <div class="cell center flex-cell">
            <div class="cell right width-fill">
                <h2 class="text-out">피카라이더 찾는중...</h2>
            </div>
            <div class="cell left w-40">
                <img src="${pageContext.request.contextPath}/image/pocketball.png" class="rotateball text-out" width="20%;">
            </div>

        </div>
        <div class="cell">
            <img src="${pageContext.request.contextPath}/image/pica.png" class="delivery" width="50%;">
            <h3 class="text text-with-border">피카라이더가 음식을 픽업하였습니다.</h3>
        </div>
    </div>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>