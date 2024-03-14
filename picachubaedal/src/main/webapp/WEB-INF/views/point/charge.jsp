<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

    <style>
        .charge-item {
            width: 50%;
        }

        .btn {
            color: #2d3436;
            background-color: rgb(254, 210, 61);
            text-align: center;
            cursor: pointer;
            border: none;
        }
    </style>

    <!-- jquery cdn -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <!-- 내가 만든 스크립트 추가(jQuery를 사용했으니 jQuery CDN 아래 작성) -->
    <script src="commons.js"></script>
    <!-- javascript를 의도적으로 head 자리에 배치해서 가장 먼저 실행되도록 구현-->
    <script type="text/javascript">
        $(function(){
            $(".buy-charge").click(function(){
                var message = $(this).data("message");
                if(message == undefined) {
                    message = "결제하시겠습니까?"
                }
                var choice = window.confirm(message);
                return choice;
            });
        });
    </script>
</head>

<body>

    <div class="container w-800">
        <div class="cell center">
            <h3>포켓볼 충전</h3>
        </div>

        <div class="cell flex-cell my-50">
            <div class="w-50 center p-20">
                <img src="/image/pb10.png" class="charge-item">
                <button class="btn buy-charge">구매</button>
            </div>
            <div class="w-50 center p-20">
                <img src="/image/pb20.png" class="charge-item">
                <button class="btn buy-charge">구매</button>
            </div>
        </div>
        <div class="cell flex-cell my-50">
            <div class="w-50 center p-20">
                <img src="/image/pb30.png" class="charge-item">
                <button class="btn buy-charge">구매</button>
            </div>
            <div class="w-50 center p-20">
                <img src="/image/pb50.png" class="charge-item">
                <button class="btn buy-charge">구매</button>
            </div>
        </div>
    </div>

</body>

</html>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>