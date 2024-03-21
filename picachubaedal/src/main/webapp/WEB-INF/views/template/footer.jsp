<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%--
 	하단영역
	 - 회사소개 및 각종 정보들을 제공하는 영역
  --%>
	<style>
		.footerFont{
			font-family : Noto sans, sans-serif;
		}
		.hr-border {
			border: 0;
		    height: 3px;
		    background: #ccc;
		}
		
		.footer-atag-style a {
            color: #939393 !important;
            text-decoration: none;
            font-family : Noto sans, sans-serif;
		}
	</style>
        <hr class="hr hr-border">
        <div class="footer footer-atag-style">
   
   <div class="company-wrap">
      
      <div class="company-info">
         <p class="footerFont">
            <strong class="footerFont">주식회사 배달피카츄</strong><br>
            서울특별시 영등포구 선유동2로 57 이레빌딩
            <span class="bar"> | </span>대표이사 : 김피카츄<span class="bar"> | </span>사업자등록번호 : 000-00-00000
            <span class="bar"> | </span>개인정보담당자 : 
            <a href="#">privacy@baedalpikachu.co.kr</a>
            <span class="bar"> | </span><br>제휴문의 : 
            <a href="#">partnership@baedalpikachu.co.kr</a>
            <span class="bar" >| </span>고객만족센터 : 
            <span ng-show="#" class="footerFont">02-1544-9970(유료) 24시간, 연중무휴</span> 
            <a href="#">support@baedalpikachu.co.kr</a>
         </p>
         <div class="footer-terms ng-hide" ng-show="is_mobile_device">
            <a href="#">이용약관</a>
            <span class="bar">|</span>
            <a href="#"><strong class="footerFont">개인정보처리방침</strong></a>
            <span class="bar">|</span>
            <a href="#">포인트정책</a>
            <span class="bar">|</span>
            <a href="#" rel="noopener noreferrer" target="_blank">사업자정보확인</a>
         </div>
      </div>
   </div>
      
      <div class="csc">
         <em class="footerFont">고객만족센터</em> 
         <strong class="footerFont">02-1544-9970</strong>
         <em class="footerFont">(유료)</em> 
         <span class="footerFont">24시간, 연중무휴</span>
      </div>
   </div>
   <div class="guide">
      <p class="footerFont">주식회사 배달피카츄는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품/ 거래정보 및 거래와 관련하여
         배츄에 등록된 판매자의 고의 또는 과실로 소비자에게 발생하는 손해에 대해 주식회사 배달피카츄는 책임을 지지 않습니다. 
         상품 및 거래에 관하여 보다 정확한 정보는 해당 판매자에게 직접 확인하여 주시기 바랍니다. 
         Copyright BAECHU. All Rights Reserved.
      </p>
   </div>

</body>
</html>