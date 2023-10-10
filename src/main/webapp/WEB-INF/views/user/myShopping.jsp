 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<%@ include file="/WEB-INF/views/include/userNavigation.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">

<style>
.container .mypage .header, .container.mypage .content {
    width: auto;
    min-width: 1560px;
    max-width: 1880px;
    padding: 0px 40px;
    margin: 0px auto;
    box-sizing: border-box;
    font-family: 'Gothic A1', sans-serif;
  }
    
.section {
    padding: 10px;
    font-family: 'Gothic A1', sans-serif;
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

h1, h2, h3, h4, h5, h6 {
    font-size: inherit;
    font-family: 'Gothic A1', sans-serif;
}



html, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, form, dl, dt, dd, ol, ul, li, input, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: top;
    background: transparent;
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
	height:100px;
	text-align: center;
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
    min-height: 96px;
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
ol, ul {
    list-style: none;
}
.n-prd-row .info li {
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
element.style {
}
.n-section-block .n-section-title:not(.first) {
    margin-top: 80px;
}
html, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, form, dl, dt, dd, ol, ul, li, input, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: top;
    background: transparent;
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
    margin-bottom: 20px;
}

.mypage-cont {
    padding: 0;

}

ul.info li {
    display: block;
    margin-bottom: 10px; /* 아래에 간격을 주어 세로로 정렬될 수 있도록 합니다. */
}


.number {
    display: flex; /* 유연한 레이아웃을 위해 Flexbox를 사용합니다. */
    justify-content: center; /* 수평 가운데 정렬 */
    list-style: none;
    padding: 0;
}

.number li {
    display: inline-block;
    margin-right: 5px; /* 각 페이지 번호 사이의 간격 조정 */
}

.number li a {
    display: inline-block;
    width: 40px;
    line-height: 40px;
    border-radius: 10px;
    margin: 3px;
    margin-top: 20px;
    box-shadow: 0 5px 10px #f1f1f1;
    text-align: center; /* 페이지 번호 텍스트 가운데 정렬 */
    text-decoration: none;
    background-color: #f5f5f5;
    color: #333;
}

.number li a.active {
    background-color: #333;
    color: #fff;
}


</style>
<script type="text/javascript">
function fn_view(orderIdk,status)
{
	if(status == 'N'){
		alert("주문상품이 미결제 입니다. 주문을 먼저해주세요.");
		return;
	}
	
	document.myForm.orderIdk.value = orderIdk;
	document.myForm.action = "/user/myShoppingDetail";
	document.myForm.submit();
}

function fn_list(curPage)
{

	document.myForm.curPage.value = curPage;
	document.myForm.action = "/user/myShopping";
	document.myForm.submit();
}
function fn_pay(orderIdk,index) {
	   var productIds = $("input[name='productIdk"+index+"[]']").map(function() {
        return $(this).val();
    }).get();
    var quantities = $("input[name='quantity"+index+"[]']").map(function() {
        return $(this).val();
    }).get();
    
$.ajax({
   type : "POST",
   url:"/kakao/payReady",
   data:{
      orderId:orderIdk,
      productIdk1:productIds[0],
      productIdk:productIds,
      quantity:quantities
   },
   datatype:"JSON",
   success:function(response)
   {
      if(response.code == 0)
      {
         var tId = response.data.tId;
         var pcUrl = response.data.pcUrl;
         
         $("#orderId").val(orderIdk);
         $("#tId").val(tId);
         $("#pcUrl").val(pcUrl);
         
         var win = window.open('', 'kakaoPopUp', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=540,height=700,left=100,top=100');
         
         $("#kakaoForm").submit();
      }
      else
      {
         alert("오류가 발생하였습니다.");
      }
   },
   error:function(error)
   {
      icia.common.error(error);
   }
});
}
function movePage()
{
   location.href = "/shop/orderComplete";
}
</script>
</head>
<body>
<div class="container">
   <section class="mypage-cont mypage-main">
   		<h1 class="hidden">마이페이지</h1>
   		<!-- 주문내역조회  -->
   		<section class="n-section-block first list-block">
   		<header class="n-section-title">
   			<h2 class="tit">주문내역 조회</h2>
   			<p style="color: #8b1411; font-size:12px; ">*상세 조회는 주문번호를 클릭해주세요</p>
   		</header>
   		<!-- 주문내역 상자 -->
   		<table class="n-table table-col">
   			<colgroup>
   				<col style="width:5%">
   				<col style="width:5%">
   				<col style="width:5%">
   				<col style="width:5%">
   				<col style="width:5%">
   				<col style="width:5%">
   				<col style="width:5%">
   			</colgroup>
   		<thead>
   			<tr>
   				<th scope="col" style="font-weight: bold">주문일자</th>
   				<th scope="col" style="font-weight: bold; color: #8b1411;">주문번호</th>
   				<th scope="col" style="font-weight: bold">결제상태</th>
   				<th scope="col" style="font-weight: bold">배송상태</th>
   				<th scope="col" style="font-weight: bold">총주문가격</th>
   				<th scope="col" style="font-weight: bold">쿠폰할인가격</th>
   				<th scope="col" style="font-weight: bold">실제결제가격</th>
   			</tr>
   		</thead>
   		<tbody>
<c:if test="${!empty list}">	
	<c:forEach var="myShopping" items="${list}" varStatus="status">
	
   			<tr>
   				<td>
   					${myShopping.orderDate}
   				</td>
   				<td><a href="javascript:void(0)" onclick="fn_view(${myShopping.orderIdk},'${myShopping.payStatus}')"><b style="color: #8b1411;">${myShopping.orderIdk}</b></a></td>

   				
   		<c:choose>
			<c:when test="${myShopping.payStatus eq 'Y'}">
			<td class="text-center">결제완료</td>
			</c:when>
			<c:otherwise>
			<c:forEach var="product" items="${myShopping.orderDetailList}" varStatus="loop">
    			<input type="hidden" name="productIdk${status.index}[]" value="${product.productIdk}" />
    			<input type="hidden" name="quantity${status.index}[]" value="${product.quantity}" />
			</c:forEach>
		
			<td class="text-center"><a href="javascript:void(0)" onclick="fn_pay(${myShopping.orderIdk},${status.index})">미결제</a></td>	
			</c:otherwise>
		</c:choose>

   		<c:choose>
			<c:when test="${myShopping.deliveryStatus eq 'Y'}">
			<td class="text-center">배송완료</td>
			</c:when>
			<c:when test="${myShopping.deliveryStatus eq 'R'}">
			<td class="text-center">배송중</td>
			</c:when>
			<c:otherwise>
			<td class="text-center">배송준비중</td>
			</c:otherwise>
		</c:choose>
   			
   				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${myShopping.totalPrice}" />원</td>
   				
   				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${myShopping.couponDiscountPrice}" />원
   				</td>
   				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${myShopping.actualPrice}" />원
   				</td>
   			</tr>	
 	</c:forEach>
 </c:if>

			
   		 </tbody>
   		</table>
		
   		 <c:if test="${!empty paging}">	
			<ul class="number">	
				<c:if test="${paging.prevBlockPage gt 0}">
						<li><a href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})">&lt;</a></li>
				</c:if>
				
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
					<c:choose>
						<c:when test="${i ne curPage}">
						<li><a href="javascript:void(0)" onclick="fn_list(${i})">${i}</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="javascript:void(0)" class="active">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${paging.nextBlockPage gt 0}">
					    <li><a href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})">&gt;</a></li>
				</c:if>
			</ul>
		</c:if>
   
   	
   		</section>
   	</section>
   
   <form name="myForm" id="myForm" method="post">
	<input type="hidden" name="orderIdk" value="" />
	<input type="hidden" name="searchValue" value="" />
	<input type="hidden" name="curPage" value="${curPage}" />
	</form>
</div>
   <form name="kakaoForm" id="kakaoForm" method="post" target="kakaoPopUp" action="/kakao/payPopUp">
      <input type="hidden" name="orderId" id="orderId" value="" />
      <input type="hidden" name="tId" id="tId" value="" />
      <input type="hidden" name="pcUrl" id="pcUrl" value="" />
   </form>
   
</body>
</html>