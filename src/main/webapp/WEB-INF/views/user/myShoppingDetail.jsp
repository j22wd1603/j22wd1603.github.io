 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<%@ include file="/WEB-INF/views/include/userNavigation.jsp" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
</head>



<style>

.container .mypage .header, .container.mypage .content {
    width: auto;
    min-width: 1560px;
    max-width: 1880px;
    padding: 0px 40px;
    margin: 0px auto;
    box-sizing: border-box;
  }
    
.section {
    padding: 10px;
}
    
    
.mypage-cont mypage-main{
    padding: 0;
    margin-top: -32px;
    }
    
.mypage-main {
    margin-top: -32px;
}
    
    .hidden {
    display: none;
}


article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
    display: block;
}

.n-section-title .tit {
    display: inline-block;
    font-size: 24px;
}
.n-section-title {
    border-bottom: 3px solid #000000;
    padding-bottom: 14px;
    margin-top: 48px;
    margin-top: 48px;
    font-family: "Apple SD Gothic Neo", "Noto Sans KR", sans-serif;
    line-height: 1.5;
    font-size: 14px;
    position: relative;
}


h1, h2, h3, h4, h5, h6 {
    font-size: inherit;
    font-family: 'Gothic A1', sans-serif;
}


/*cart area*/
a {
    color: inherit;
    text-decoration: none;
    font-family: 'Gothic A1', sans-serif;
}

.n-section-title + .n-table.table-col {
    border-top: none;
    font-family: 'Gothic A1', sans-serif;
}

.n-table {
    width: 100%;
    line-height: 1.5;
    font-size: 14px;
    border-collapse: collapse;
    table-layout: fixed;
}
table, td, th {
    border-spacing: 0;
}

.n-table.table-col th {
    height: 52px;
    border-bottom: 1px solid #000000;
    font-size: 16px;
    vertical-align: middle;
    font-weight: normal;
}

colgroup {
    display: table-column-group;
}
.n-prd-row .img-block {
    display: table-cell;
    width: 80px;
    padding-top: 96px;
    vertical-align: middle;
}
.n-section-block first list-block
{
	:100px;
}
element.style {
}
.n-table.table-col .n-prd-row {
    margin: 10px 0;
}
.n-prd-row {
    display: table;
    table-layout: fixed;
    width: 100%;
    font-family: "Apple SD Gothic Neo", "Noto Sans KR", sans-serif;
    line-height: 1.5;
    font-size: 14px;
    text-align: left;
    position: relative;
}

.img-block {
    display: block;
    padding-top: 20%;
    position: relative;
    overflow: hidden;
}

.name {
    font-weight: bold;
    color: #000;
}

.n-table.table-col td {
    height: 70px;
    padding: 10px;
    box-sizing: border-box;
    border-bottom: 1px solid #f5f5f5;
    text-align: center;
    vertical-align: middle;
    word-break: break-all;
}

.txt-default {
    color: #777777;
}
.n-table strong, .n-table span {
    vertical-align: middle;
}

.btn-parents {
    position: relative;
}

.n-table.table-col .btn-set .n-btn {
    display: block;
    width: 90px;
    min-width: 90px;
    margin: 4px auto;
}

.n-btn.btn-accent {
    border: 1px solid #000000;
    background-color: #000000;
}
.n-btn.btn-sm {
    min-width: 70px;
    height: 32px;
    line-height: 30px;
    padding-top: 0;
    font-family: "Apple SD Gothic Neo", "Noto Sans KR", sans-serif !important;
}

.n-table.table-col td {
    height: 70px;
    padding: 10px;
    box-sizing: border-box;
    border-bottom: 1px solid #f5f5f5;
    text-align: center;
    vertical-align: middle;
    word-break: break-all;
}

.n-table a, .n-table button {
    display: inline-block;
    vertical-align: middle;
}

.n-prd-row .info .name {
    max-height: 44px;
    font-weight: bold;
    overflow: hidden;
}
.mypage-cont .n-prd-row .info {
    width: 100%;
}

.n-prd-row .info {
    display: table-cell;
    padding-left: 10px;
    vertical-align: middle;
}

.n-prd-row .infoul {
    font-size: 14px;
    line-height: 22px;
}
.name {
    font-weight: bold;
    color: #000;
}

.n-table.table-col th {
    height: 52px;
    border-bottom: 1px solid #000000;
    font-size: 16px;
    vertical-align: middle;
    font-weight: normal;
    text-align: center;
}

.n-table button {
    font-family: inherit;
    display: inline-block;
}
.n-btn {
    display: inline-block;
    min-width: 100px;
    height: 40px;
    line-height: 36px;
    color: #ffffff;
    box-sizing: border-box;
    padding: 2px 8px 0 8px;
    font-size: 14px;
    text-align: center;
    cursor: pointer;
    vertical-align: middle;
    -webkit-transition: border 0.2s, background 0.2s ease-in-out;
    -moz-transition: border 0.2s, background 0.2s ease-in-out;
    -o-transition: border 0.2s, background 0.2s ease-in-out;
    transition: border 0.2s, background 0.2s ease-in-out;
}

.container.mypage {
    width: auto;
    min-width: 1560px;
    padding: 0px;
    font-family: "Apple SD Gothic Neo", "Noto Sans KR", sans-serif;
    font-size: 14px;
    line-height: 1.5;
}

.n-section-block .n-section-title:not(.first) {
    margin-top: 80px;
}

.mypage-cont {
    padding: 0;
    float: right;
}

ul.info li {
    display: block;
    margin-bottom: 10px; /* 아래에 간격을 주어 세로로 정렬될 수 있도록 합니다. */
}

.n-section-title + .n-table.table-col {
    border-top: none;
}

button {
    padding: 0;
    border: 0;
    -webkit-appearance: none;
    background: none;
}
button {
    appearance: none;
    font-family: inherit;
    font-size: inherit;
    border: 0;
    cursor: pointer;
    background: none;
}
.n-btn {
    display: inline-block;
    min-width: 100px;
    height: 40px;
    line-height: 36px;
    color: #ffffff;
    box-sizing: border-box;
    padding: 2px 8px 0 8px;
    font-size: 14px;
    text-align: center;
    cursor: pointer;
    vertical-align: middle;
    -webkit-transition: border 0.2s, background 0.2s ease-in-out;
    -moz-transition: border 0.2s, background 0.2s ease-in-out;
    -o-transition: border 0.2s, background 0.2s ease-in-out;
    transition: border 0.2s, background 0.2s ease-in-out;
}


dd {
    display: block;
    margin-inline-start: 40px;
}
dt {
    display: block;
}
.n-table.table-col .btn-set .n-btn {

    width: 90px;
    min-width: 90px;
    margin: 4px auto;
}
.n-btn.btn-accent {
    border: 1px solid #000000;
    background-color: #000000;
}
.n-btn.btn-sm {
    min-width: 70px;
    height: 32px;
    line-height: 30px;
    padding-top: 0;
}
.n-table a, .n-table button {
    display: inline-block;
    vertical-align: middle;
}

.n-info-txt {
    font-family: "Apple SD Gothic Neo", "Noto Sans KR", sans-serif;
    line-height: 1.5;
    font-size: 14px;
    padding-top: 20px;
}


.info-value {
    font-weight: bold;
    margin: 0 30px 0 6px;
}

ul li{
background: #ffffff;
}


</style>
<script type="text/javascript">


</script>
</head>
<body>
<div class="container">
   <section class="mypage-cont mypage-main">
   		<h1 class="hidden">마이페이지</h1>
   		<!-- 주문내역조회  -->
   		<section class="n-section-block first list-block">
   		<div class="n-section-title">
   		
   		
    <h1 class="tit">주문 상세 내역</h1>
  

    	
</div>

   		<!-- 주문내역 상자 -->
   		<table class="n-table table-col n-order-view">
   			<colgroup>
   				<col style="width:15%">
   				<col style="width:15%">
   				<col style="width:10%">
   				<col style="width:20%">
   				<col style="width:10%">
   				<col style="width:20%">
   				<col style="width:10%">
   			</colgroup>
   		<thead>
   			<tr>
   				<th scope="col">상품사진</th>
   				<th scope="col">주문번호</th>
   				<th scope="col">주문상세번호</th>	
   				<th scope="col">상품명</th>
   				<th scope="col">수량</th>
   				<th scope="col">상품금액</th>
   				<th scope="col">리뷰상태</th>
   			</tr>
   		</thead>
   		<tbody>
<c:if test="${!empty orderDetailList}">	
	<c:forEach var="detailList" items="${orderDetailList}" varStatus="status">
   			<tr>
   				<td>
  <a href="/shop/productDetail?productIdk=${detailList.productIdk}">
    <img src="/resources/images/product/small/${detailList.productCode}.${detailList.productFileExt}" width="100" height="100" />
  </a>
</td>

   				<td>${detailList.orderIdk}</td>
   				<td>${detailList.orderDetailIdk}</td>
   				<td>${detailList.productName}</td>
   				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${detailList.quantity}" /></td>
   				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${detailList.productPrice}" />원</td>

	   			<td>
	           
	           
	            <c:choose>
	                <c:when test="${detailList.reviewStatus eq 'Y'}">
	                    <div class="text-center">리뷰작성완료</div>
	                </c:when>
	                <c:otherwise>
	                    <div class="btn-set btn-parents">
	                        <button type="button" class="n-btn btn-sm btn-accent" onclick="openReviewPopup(${detailList.productIdk}, ${detailList.orderDetailIdk})">미작성</button>
	                    </div>
	                </c:otherwise>
	            </c:choose>
	        </td>
		   		
		   				
   			</tr>	
	</c:forEach>
</c:if>
   		 </tbody>
   		</table>
   		<ul class="n-info-txt">
				<li>동일한 주문번호라도 2개 이상의 브랜드에서 주문하신 경우 출고지 주소가 달라 각각 출고됩니다. (택배 박스를 2개 이상 수령 가능)</li>
				<li>출고 완료 직후 교환 / 환불 요청을 하더라도 상품을 수령하신 후 택배 업체를 통해 보내주셔야 처리 가능합니다.</li>
				<li>별도의 구매 결정이 없더라도 상품 배송 완료 후 7일이 지난 경우에는 자동 구매확정, 적립금이 자동 지급됩니다.</li>
				<li>자세한 내용은 FAQ를 확인하여 주시기 바랍니다.</li>
			</ul>

   		
   		</section>
   	
   	
   	</section>
   
   
</div>
<!-- 리뷰창 팝업 -->
<script>
function openReviewPopup(productIdk, detailIdk) {
    var popupWidth = 600;
    var popupHeight = 700; 

    var left = (window.innerWidth - popupWidth) / 2;
    var top = (window.innerHeight - popupHeight) / 2;

    var popupUrl = "/shop/reviewPage?productIdk=" + productIdk + "&detailIdk=" + detailIdk;
    var popupName = "ReviewPopup"; 

    var popup = window.open(popupUrl, popupName, "width=" + popupWidth + ",height=" + popupHeight + ",left=" + left + ",top=" + top);

    if (!popup || popup.closed || typeof popup.closed == 'undefined') {
        alert('팝업 차단이 활성화되어 있습니다. 팝업 차단을 비활성화하세요.');
    }
}
</script>





</body>
</html>