<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">
    <title>주문</title>
<script>
$(document).ready(function() {

document.getElementById("mypage").addEventListener("click", function() {
    // '/user/mypage' 페이지로 이동
    window.location.href = "/user/mypage";
});
document.getElementById("csmain").addEventListener("click", function() {
    // '/user/mypage' 페이지로 이동
    window.location.href = "/cs/csmain";
});
});
</script>
</head>


<body>
    <div id="wrapper">
        <main class="orderPage">
        	<section class="complete">
                <article class="message">
                    <h2>
                        고객님의 주문이 정상적으로 완료되었습니다.
                        <i class="far fa-smile" aria-hidden="true"></i>
                    </h2>
                    <p>
                        즐거운 쇼핑이 되셨습니까? 항상 고객님을 최우선으로 생각하는 SWEET HOME이 되겠습니다.
                    </p>
                    <div class="center-div">
                       <button type="button" id="mypage" class="custom-btn-style">마이페이지</button>
                       <button type="button" id="csmain" class="custom-btn-style">고객센터</button>
                    </div>
                </article>
                
                 <!-- 주문완료상품 -->
           		<div class="orderComplete-title">주문 완료 상품 (${fn:length(orderComplete)})</div>
             		 <table style="border: 0">
                        <tr>
                        	<th></th>
                            <th>상품정보</th>                          
                            <th>판매가</th>
                             <th>수량</th>
                            <th>배송비</th>
                            <th>소계</th>
                        </tr>
                        
                        <c:if test="${empty orderComplete}">
                        <tr>
                            <td colspan="5">주문 상품이 없습니다.</td>
                        </tr>  
                        </c:if>
                        
                        <c:set var="totalPrice" value="0" />
                        <c:forEach var="product" items="${orderComplete}">
	                        <tr>
	                            <td>
		                            <article>
		                                 <a href="/shop/productDetail?productIdk=${product.productIdk}"><img src="/resources/images/product/small/${product.productCode}.${product.productFileExt}"alt="${product.productName}"></a>
		                            </article>
		                         </td>
		                         <td>       
	                                <div>
	                                    <p style="color: #808080; font-size: 12px; margin-top: 10px;">${product.productBrandName}</p>
										<p>${product.productName}<p>  
	                                </div>
	                             </td>	     
	                            <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.productPrice}" />원</td>
	                            <td>${product.quantity}</td> 
	                            <td>무료배송</td>
	                            <c:set var="price" value="${product.productPrice * product.quantity}"/>
	                            <c:set var="totalPrice" value="${totalPrice + price}"/>
	                            <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원</td>
	                            <c:remove var="price"/>
	                        </tr>
                        </c:forEach>
                     </table>
               
              
                <!-- 주문자정보 -->
                <article class="orderer">
                     <div class="orderComplete-title">주문정보</div> 
                    <table style= "border=0;">
                   		<tr>
                            <td>주문자</td>
							<td>${user.userName}</td>
                        </tr>
                        <tr>
                            <td>연락처</td>
                       		 <td>${fn:substring(user.userPhone,0,3)}-${fn:substring(user.userPhone,3,7)}-${fn:substring(user.userPhone,7,11)}</td>
                        <tr>
                            <td>주문번호</td>
                            <td>${order.orderIdk}</td>
                         
                        </tr>
                        <tr>
                            <td>결제방법</td>
                            <td>
	                            <c:choose>
						        <c:when test="${pay.payMethodType eq 'CARD'}">
						            카드결제
						        </c:when>
						        <c:when test="${pay.payMethodType eq 'MONEY'}">
						        	현금결제
						        </c:when>
							    </c:choose>
					    	</td>
                        </tr>     
                        <tr>
                         <td rowspan="3">총 결제금액</td>
                         <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${order.actualPrice}" />원</td>
                        </tr>
                    </table>
                </article>
                
                <!-- 배송정보 -->
                <article class="delivery">
                    <div class="orderComplete-title">배송지 정보</div>
                    <table border="0">
                        <tr>
                            <td>수취인</td>
                            <td>${order.deliveryName}</td>      
                        </tr>
                        <tr>
                            <td>연락처</td>
                            <td>${fn:substring(order.deliveryPhone,0,3)}-${fn:substring(order.deliveryPhone,3,7)}-${fn:substring(order.deliveryPhone,7,11)}</td>                       
                        </tr>
                        <tr>
                            <td>배송지 주소</td>
                            <td>${order.deliveryAddress}</td>
                        </tr>
                        
                    </table>
                </article>
 
                <article class="alert">
                    <h1>꼭 알아두세요.</h1>
                    <ul>
                        <li>
                            <span>
                                SWEET HOME은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 케이마켓은 상품, 거래정보 및 거래에 대하여 책임을 지지 않습니다.
                            
                                구매주문내역, 배송상태 확인, 구매영수증 출력, 구매취소/반품/교환은 사이트 상단의 주문/배송조회에서 확인 할 수 있습니다.
                          
                                고객님의 주문이 체결된 후 상품품절 및 단종 등에 의해 배송이 불가능할 경우, 전자상거래등에서의 소비자 보호에 관한 법률 제15조 2항에 의거하여 3영업일(공휴일 제외) 이내에 자동으로 취소될 수 있으며, 이 경우 취소 안내 메일이 고객님께 발송되오니 양지 바랍니다.
                            
                                극히 일부 상품에 대해 수량 부족, 카드결제승인 오류 등의 사례가 간혹 있을 수 있으니 `나의쇼핑정보`에서 다시 한번 확인해 주세요.
                           
                                현금 잔고로 구매하셨을 경우, 나의 쇼핑정보에서 입금확인이 되었는지를 다시 한번 확인해 주세요.
                           
                                배송 주소를 추가하거나 변경, 삭제 등의 관리는 `나의쇼핑정보 > 나의정보`에서 가능합니다.
                            </span>
                        </li>
                    </ul>
                </article>
            </section>
        </main>
    </div>    
</body>
</html>