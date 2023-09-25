<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function trimCheck(id,msg) {
	   if($.trim($('#'+ id).val()).length <=0){
		    alert(msg);
			$('#'+ id).val("");
			$('#'+ id).focus();
			return true;
	   }
		return false;
}

function expCheck(id,msg,exp) { 
		if(!exp.test($('#'+ id).val()))
		{
			alert(msg);
			$("#userId").focus();
			return true;
		}
		return false;
}

$(document).ready(function() {
	
   $("#btnOrder").on("click", function() {
	   var regPhone1 = /^01[016789]$/;
	   var regPhone2 = /^[0-9]{3,4}$/;
	   var regPhone3 = /^[0-9]{4}$/;
	   var name = /^[가-힣a-zA-Z]+$/;
	   var address = /^[가-힣a-zA-Z0-9\s\-]+$/;

	   if(deliveryRadio.checked){		   
		   if(trimCheck("deliveryName","수령인을 입력해주세요"))return;
		   if(expCheck("deliveryName","이름은 한국어,영어만 입력가능합니다.",name))return;
		   if(trimCheck("deliveryAddress","배송지를 입력해주세요"))return;
		   if(expCheck("deliveryAddress","주소는 한국어,영어, 숫자 '-' 만 입력가능합니다.",address))return;
		   if(trimCheck("phone1","휴대폰번호를 입력해주세요"))return;
		   if(expCheck("phone1","휴대폰 첫번째는 010, 011, 016, 017, 018, 019만 가능합니다",regPhone1))return;
		   if(trimCheck("phone2","휴대폰번호를 입력해주세요"))return;
		   if(expCheck("phone2","휴대폰 두번째는 3자리 4자리 숫자만 가능합니다.",regPhone2))return;
		   if(trimCheck("phone3","휴대폰번호를 입력해주세요"))return;
		   if(expCheck("phone3","휴대폰 세번째는 4자리 숫자만 가능합니다.",regPhone3))return;
		   if(trimCheck("deliveryMessage","메세지를 입력해주세요"))return;
		   
		    $("#deliveryName").val("${user.userName}");
		    $("#deliveryAddress").val("${user.userAddress}");
		    $("#deliveryPhone").val("${user.userPhone}");
		    $("#deliveryContent").val($("#deliveryMessage").val());
	   }
	   
	   
	   if(deliveryAnotherRadio.checked){
		   if(trimCheck("anotherDeliveryName","수령인을 입력해주세요"))return;
		   if(expCheck("anotherDeliveryName","이름은 한국어,영어만 입력가능합니다.",regKoreanAndEnglish))return;
		   if(trimCheck("anotherDeliveryAddress","배송지를 입력해주세요"))return;
		   if(expCheck("anotherDeliveryName","주소은 한국어,영어, 숫자만 입력가능합니다.",regKoreanEnglishAndNumber))return;
		   if(trimCheck("anotherPhone1","휴대폰번호를 입력해주세요"))return;
		   if(expCheck("anotherPhone1","휴대폰 첫번째는 010, 011, 016, 017, 018, 019만 가능합니다",regPhone1))return;
		   if(trimCheck("anotherPhone2","휴대폰번호를 입력해주세요"))return;
		   if(expCheck("anotherPhone2","휴대폰 두번째는 3자리 4자리 숫자만 가능합니다.",regPhone2))return;
		   if(trimCheck("anotherPhone3","휴대폰번호를 입력해주세요"))return;
		   if(expCheck("anotherPhone3","휴대폰 세번째는 4자리 숫자만 가능합니다.",regPhone3))return;
		   if(trimCheck("anotherDeliveryMessage","메세지를 입력해주세요"))return;
		   
		    $("#deliveryName").val($("#anotherDeliveryName").val());
		    $("#deliveryAddress").val($("#anotherDeliveryAddress").val());
		    var bbsDeliveryPhone = $("#anotherPhone1").val()+$("#anotherPhone2").val()+$("#anotherPhone3").val();
		    $("#deliveryPhone").val(bbsDeliveryPhone);
		    $("#deliveryContent").val($("#anotherDeliveryMessage").val());
		   }

      $.ajax({
         type : "POST",
         url:"/shop/order",
         data:{
            redemCode:$("#redemCode").val(),
            deliveryAddress:$("#deliveryAddress").val(),
            deliveryPhone:$("#deliveryPhone").val(),
            deliveryName:$("#deliveryName").val(),
            deliveryContent:$("#deliveryContent").val(),
            productIdk:$("#productIdk1").val(),
            quantity:$("#quantity1").val()
         },
         datatype:"JSON",
         beforeSend:function(xhr)
         {
            xhr.setRequestHeader("AJAX", "true");
         },
         success:function(response)
         {
            if(response.code == 0)
            {
               var orderId = response.data.orderIdk;
               $("#orderId").val(orderId);
               kakaoPay();
            }
            else if(response.code == -998){
            	alert("상품번호가 숫자가 아닙니다.");
            }
            else if(response.code == -999){
            	alert("주문번호가 숫자가 아닙니다.");
            }
            else
            {
               alert("오류가 발생하였습니다.");
            }
         },
         error:function(xhr, status, error)
         {
            icia.common.error(error);
         }
      });

   });

});

function kakaoPay() {
   $.ajax({
      type : "POST",
      url:"/kakao/payReady",
      data:{
         orderId:$("#orderId").val(),
         productIdk:$("#productIdk1").val(),
         quantity:$("#quantity1").val()
      },
      datatype:"JSON",
      success:function(response)
      {
         if(response.code == 0)
         {
            var tId = response.data.tId;
            var pcUrl = response.data.pcUrl;
            
            $("#tId").val(tId);
            $("#pcUrl").val(pcUrl);
            
            var win = window.open('', 'kakaoPopUp', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=540,height=700,left=100,top=100');
            
            $("#kakaoForm").submit();
            
            $("#btnPay").prop("disabled", false);
         }
         else
         {
            alert("오류가 발생하였습니다.");
            $("#btnPay").prop("disabled", false);
         }
      },
      error:function(error)
      {
         icia.common.error(error);
         $("#btnPay").prop("disabled", false);
      }
   });
}

function movePage()
{
   location.href = "/shop/orderComplete";
}

function sample_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample_postcode').value = data.zonecode;
            document.getElementById("sample_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample_detailAddress").focus();
        }
    }).open();
}

function setInputAddress() {
    var postcode = document.getElementById("sample_postcode").value;
    var address = document.getElementById("sample_address").value;
    var detailAddress = document.getElementById("sample_detailAddress").value;
    var extraAddress = document.getElementById("sample_extraAddress").value;

    // 주소 정보 조합
    var fullAddress = address;
    if (extraAddress !== '') {
        fullAddress += extraAddress;
    }
    if (detailAddress !== '') {
        fullAddress += ' ' + detailAddress;
    }

    // 사용자 주소 필드에 설정
    document.getElementById("anotherDeliveryAddress").value = fullAddress;
}
</script>

</head>


<body>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>

<div id="wrapper">
<!-- 오더페이지로 main둔 이유는 complete페이지에서도 쓰기때문에 오더페이지로 묶음 -->
      <main class="orderPage">
            <section class="order">
                <nav>
                   <div class="orderPage-container-section-title2">주문상품 (${fn:length(productList)})</div>
               </nav>
               <form name="viewForm" action="#">
                    <table style="border: 0">
                        <tr>
                            <th>상품정보</th>
                            <th>수량</th>
                            <th>판매가</th>
                            <th>배송비</th>
                            <th>소계</th>
                        </tr>
                        <c:if test="${empty productList}">
                        <tr>
                            <td colspan="5">주문 상품이 없습니다.</td>
                        </tr>  
                        </c:if>
                        
                        <c:set var="totalPrice" value="0" />
                        
                        <c:forEach var="product" items="${productList}">
	                        <tr>
	                            <td>
		                            <article>
		                                <a href="javascript:void(0)"><img src="/resources/images/product/small/${product.productCode}.${product.productFileExt}"alt="${product.productName}"></a>
		                                <div>
		                                     <p>${product.productBrandName}</p>
		                                     <p><a href="javascript:void(0)">${product.productName}</a><p>  
		                                </div>
		                            </article>
	                            </td>
	                            <td>${product.quantity}</td>
	                            <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.productPrice}" />원</td>
	                            <td>무료배송</td>
	                            <c:set var="price" value="${product.productPrice * product.quantity}"/>
	                            <c:set var="totalPrice" value="${totalPrice + price}"/>
	                            <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원</td>
	                            <c:remove var="price"/>
	                        </tr>
                        </c:forEach>

                    </table>
                    
                 <section class="orderPage-container">
                      <div class= "orderPage-container-section"> 
                         <div class = "orderPage-container-section-list"> 
                        <div class="orderPage-container-section-title"> 
                                <h1>주문정보<span style="color: red; margin-left: 80vh;  font-weight: normal;">*</span><span class="required">필수입력사항</span></h1></div> 
                               
                               <article class="orderer">    
                                 <table>
                                     <tr>
                                         <td>주문자 성함</td>
                                         <td><input type="text" name="orderer" value="${user.userName}" readonly="readonly"></td>
                                     </tr>
                                     <tr>
                                         <td>주소</td>
                                         <td>
                                             <input type="text" id="userAddress" name="userAddress" placeholder="사용자 주소" value="${user.userAddress}" readonly="readonly">
                                         </td>
                                     </tr>
                                     <tr>
                                         <td>휴대전화</td>
                                         <td>
                                             <input type="text" name="hp" value="${fn:substring(user.userPhone,0,3)}" readonly="readonly">-<input type="text" name="hp" value="${fn:substring(user.userPhone,3,7)}" readonly="readonly">-<input type="text" name="hp" value="${fn:substring(user.userPhone,7,11)}" readonly="readonly">
                                         </td>
                                     </tr>
                                     <tr>
                                         <td>이메일</td>
                                         <td>
                                            <input type="text" name="email" value="${user.userEmail}">
                                         </td>
                                     </tr>
                                     <tr>
                                         <td></td>
                                         <td style="font-size: 5px; color: gray;">- 이메일을 통해 주문처리과정을 보내드립니다.<br/>- 이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</td>
                               </tr>
                                 </table>
                             </article>
                        </div>
     
                       <div class = "orderPage-container-section-list"> 
                       		<div class="orderPage-container-section-title"> 
                                <h1>배송정보<span style="color: red; margin-left: 80vh;  font-weight: normal;">*</span><span class="required">필수입력사항</span></h1>
                            </div> 
                               
                            <article class="delivery">    
                                 <table>
                                     <tr>
                                         <td>배송지 선택</td>
                                        <td>
                                      <label>
                                          <input type="radio" id="deliveryRadio" name="deliveryChoice" value="same"> 주문자 정보와 동일 
                                      </label>
                                      <label>
                                          <input type="radio" id="deliveryAnotherRadio"  name="deliveryChoice" value="another" checked="checked"> 새로운 배송지 
                                      </label>
                                  		</td>
                                     </tr>
                                 </table>
                                 <div id="deliveryTable" style="display: none;"> 
                                 	<table>
	                                     <tr>
	                                         <td>수령인</td>
	                                         <td><input type="text" id="deliveryName" name="deliveryName" placeholder="수령인" value="${user.userName}"></td>
	                                     </tr>
	                                    <tr>
	                                        <td>배송지</td>
	                                        <td>
	                                            <input type="text" id="deliveryAddress" name="deliveryAddress" placeholder="배송지 주소" value="${user.userAddress}">
	                                        </td>
	                                    </tr>
	                                     <tr>
	                                         <td>휴대전화</td>
	                                         <td>
	                                             <input type="text" id="phone1" name="phone1" value="${fn:substring(user.userPhone,0,3)}">-<input type="text" id="phone2" name="phone2" value="${fn:substring(user.userPhone,3,7)}">-<input type="text" id="phone3" name="phone3" value="${fn:substring(user.userPhone,7,11)}">
	                                         </td>
	                                     </tr>
	                                     <tr>
	                                         <td>배송 메시지</td>
	                                         <td>
	                                            <input type="text" id="deliveryMessage" name="deliveryMessage" placeholder="배송메세지">
	                                         </td>
	                                     </tr>
	                                 </table>
                                 </div>
                                 
                                 <div id="deliveryAnotherTable" style="display: block;"> 
	                                 <table>
		                                     <tr>
		                                         <td>수령인</td>
		                                         <td><input type="text" id="anotherDeliveryName" name="anotherDeliveryName" placeholder="수령인"></td>
		                                     </tr>
		                                     <tr>
		                                         <td>주소</td>
		                                         <td>
		                                             <input type="text" id="anotherDeliveryAddress" name="anotherDeliveryAddress" placeholder="배송지 주소">
		                                             <input type="text" id="sample_postcode" placeholder="우편번호" readonly="readonly">
		                                             <input type="button" onclick="sample_execDaumPostcode()" value="우편번호 검색">
		                                         </td>
		                                     </tr>
		                                     <tr>
		                                         <td>기본주소</td>
		                                         <td>
		                                             <input type="text" name="sample_address" id="sample_address" placeholder="주소" readonly="readonly">
		                                         </td>
		                                     </tr>
		                                     <tr>
		                                         <td>상세주소</td>
		                                         <td>
		                                             <input type="text" name="sample_detailAddress" id="sample_detailAddress" placeholder="상세주소">
		                                             <input type="text" id="sample_extraAddress" placeholder="참고항목" readonly="readonly">
		                                             <input type="button" onclick="setInputAddress()" value="입력 완료">
		                                         </td>
		                                     </tr>
		                                     <tr>
		                                         <td>휴대전화</td>
		                                         <td>
		                                             <input type="text" id="anotherPhone1" name="anotherPhone1">-<input type="text" id="anotherPhone2" name="anotherPhone2">-<input type="text" id="anotherPhone3" name="anotherPhone3">
		                                         </td>
		                                     </tr>
	                                     <tr>
	                                         <td>배송 메시지</td>
	                                         <td>
	                                            <input type="text" id="anotherDeliveryMessage" name="anotherDeliveryMessage" placeholder="배송메세지">
	                                         </td>
	                                     </tr>
	                                 </table>
                                 </div>
                             </article>
                        </div>
                    
                    <!-- 쿠폰 -->
                          <div class = "orderPage-container-section-list">      
                             <div class="orderPage-container-section-title"><h1>쿠폰</h1></div> 
                          
                             <article class="coupon">
                                <table>
                                     <tr>
                                     	 <c:set var="discountPrice" value="0" />
                                         <td>총 할인금액</td>
                                         <td><input id="copunPrice1" type="text" readonly="readonly" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${discountPrice}" />원" style="text-align: right;"></td>
                                     </tr>
                                     <tr>
                                       <td>사용가능 쿠폰</td>
                                       <td>
											<select id="couponSelect" name="">
												<option value="" selected="selected">쿠폰선택</option>
												<c:forEach var="redem" items="${couponList}" >
													<option value="${redem}">${redem}</option>
												</c:forEach>
											</select>
                                             <input type="button" onclick="fn_coupon()" value="적용">
                                         </td>
                                     </tr>
                                     <tr>
                                         <td></td>
                                         <td style="font-size: 5px; color: gray;">쿠폰은 규정에 따른 금액 이상 구입시 사용 가능합니다.<br/>
                                                      쿠폰으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.</td>
                              		 </tr>
                                </table>
                             </article>
                          </div>
                          
                    <!-- 결제 -->
                          <div class = "orderPage-container-section-list">   
                             <div class="orderPage-container-section-title"><h1>결제수단</h1></div> 
                         
                             <article class="payment">
                                <table>
                               <tr>
                                   <td>결제수단 선택</td>
                                   <td>
                                       <label>
                                           <input type="radio" name="paymentChoice" value="bank" id="bankRadio">무통장 입금
                                       </label>
                                       <label>
                                           <input type="radio" name="paymentChoice" value="kakao" id="kakaoRadio" checked="checked">카카오페이
                                       </label>
                                       <label>
                                           <input type="radio" name="paymentChoice" value="virtual" id="virtualRadio">가상계좌
                                       </label>   
                                   </td>
                               </tr>
                           </table>
                           
                           <!-- 결제수단 클릭하면 나오는 것들-->
                           <div id="bankTable" style="display: none;">
                               <table>
                                   <tr>
                                       <td>입금자명</td>
                                       <td><input type="text" name="depositor"></td>
                                   </tr>
                                   <tr>
                                       <td>입금은행</td>
                                       <td>
	                                   <select id="bankSelect">
	                                   		<option value="option1">입금은행을 선택해 주세요.</option>
	                                        <option value="option1">우리은행:1002-333-333333 주식회사 SWEETHOME</option>
	                                        <option value="option2">신한은행:1002-333-333333 주식회사 SWEETHOME</option>
	                                        <option value="option3">기업은행:1002-333-333333 주식회사 SWEETHOME</option>
	                                   </select>
	                                   </td>
                                   </tr>
                               </table>
                           </div>
      
                           <div id="kakaoTable" style="display: block;">
                               <table>
                                   <tr>
                                       <td>kakaoPay</td>
                                   </tr>
                               </table>
                           </div>
                        
                             </article>
                          </div>
                          
                  <!-- 경고 -->        
                          <div class = "orderPage-container-section-list">   
                             <div class="orderPage-container-section-title"><h1></h1></div> 
   
                             <article class="alert">
                             	<ul style="font-size: 8px; color: darkred; text-align:center;">
                             		<li>SWEET HOME의 모든 판매자는 안전거래를 위해 <br>구매금액,결제수단에 상관없이 모든거래에 대하여 SWEET HOME 유한책임회사의 구매안전서비스(에스크로)를 제공하고 있습니다.</li>
                             	</ul>
                             </article> 
                         </div>
                        </div>
               
                        <div class="orderPage-container-remote">
                           <div class="orderPage-container-section-title2">리모컨만들거약</div>
                             <div class="final">
                                <table>
                                     <tr>
                                         <td>총</td>
                                         <td>${fn:length(productList)}건</td>
                                     </tr>
                                     <tr>
                                         <td>상품금액</td>
                                         <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" /></td>
                                     </tr>
                                     <tr>
                                         <td>배송비</td>
                                         <td>0</td>
                                     </tr>
                                     <tr>
                                         <td>쿠폰 할인</td>
                                         <td><input id="copunPrice2" type="text" readonly="readonly" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${discountPrice}" />원" style="text-align: right;"></td>
                                     </tr>
                                     <tr>
                                         <td>전체주문금액</td>
                                         <td><input id="actualPrice" type="text" readonly="readonly" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice - discountPrice}" />원" style="text-align: right;"></td>
                                     </tr>
                                </table>
                                <input type="button" id="btnOrder" name="btnOrder" value="결제하기">
                            </div>
                     </div>
               </section>
             </form>
    </section>
    
        </main>
    </div>

<c:forEach var="product" items="${productList}">

</c:forEach>

<form id="orderForm" name="orderForm" method="post">
	<c:forEach var="product" items="${productList}">
		<input type="hidden" id="bbsProductIdk1" name="bbsProductIdk1" value="${product.productIdk}">
		<input type="hidden" id="bbsQuantity" name="bbsQuantity" value="${product.quantity}">
	</c:forEach>
</form>

 <form name="payForm" id="payForm" method="post">
      <input type="hidden" name="redemCode" id="redemCode" value="" />
      <input type="hidden" name="deliveryAddress" id="deliveryAddress" value="" />
      <input type="hidden" name="deliveryPhone" id="deliveryPhone" value="" />
      <input type="hidden" name="deliveryName" id="deliveryName" value="" />
      <input type="hidden" name="deliveryContent" id="deliveryContent" value="" />
		
      <c:forEach var="product" items="${productList}">
	      <input type="hidden" name="productIdk1" id="productIdk1" value="${product.productIdk}" />
	      <input type="hidden" name="quantity1" id="quantity1" value="${product.quantity}" />
	  </c:forEach>
</form>
   
   <form name="kakaoForm" id="kakaoForm" method="post" target="kakaoPopUp" action="/kakao/payPopUp">
      <input type="hidden" name="orderId" id="orderId" value="" />
      <input type="hidden" name="tId" id="tId" value="" />
      <input type="hidden" name="pcUrl" id="pcUrl" value="" />
   </form>

   <script>
      //결제수단때 쓰이는 스크립트
    const bankRadio = document.getElementById('bankRadio');
    const bankTable = document.getElementById('bankTable');

    bankRadio.addEventListener('change', function() {
        if (bankRadio.checked) {
            bankTable.style.display = 'block'; 
            kakaoTable.style.display = 'none'; 
            virtualTable.style.display ='none';
        }
    });

    const kakaoRadio = document.getElementById('kakaoRadio');
    const kakaoTable = document.getElementById('kakaoTable');

    kakaoRadio.addEventListener('change', function() {
        if (kakaoRadio.checked) {
            kakaoTable.style.display = 'block'; 
            bankTable.style.display = 'none'; 
            virtualTable.style.display ='none';
        }
    });
    
  	//배송에 쓰이는 스크립트
    const deliveryRadio = document.getElementById('deliveryRadio');
    const deliveryTable = document.getElementById('deliveryTable');

    deliveryRadio.addEventListener('change', function() {
        if (deliveryRadio.checked) {
        	deliveryTable.style.display = 'block';
        	deliveryAnotherTable.style.display = 'none'; 
        }
    });
    
    const deliveryAnotherRadio = document.getElementById('deliveryAnotherRadio');
    const deliveryAnotherTable = document.getElementById('deliveryAnotherTable');

    deliveryAnotherRadio.addEventListener('change', function() {
        if (deliveryAnotherRadio.checked) {
        	deliveryAnotherTable.style.display = 'block';
           	deliveryTable.style.display = 'none'; 
        }
    });
    
    function fn_coupon()
    {
    	   $.ajax({
    		      type : "POST",
    		      url:"/shop/fnCoupon",
    		      data:{
    		    	  redemCode:$("#couponSelect").val()
    		      },
    		      datatype:"JSON",
    		      success:function(response)
    		      {
    		         if(response.code == 0)
    		         {
    		            var redemCode = response.data.redemCode;
    		            var discount = response.data.discount;
    		            var totalPrice = ${totalPrice};
    		            var discountPrice = (totalPrice *discount)/100;
    		            var actualPrice = totalPrice - discountPrice;
    		            $("#copunPrice1").attr("value", discountPrice);
    		            $("#copunPrice2").attr("value", discountPrice);
    		            $("#actualPrice").attr("value", actualPrice);
    		            $("#redemCode").val(redemCode);
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
    
</script>
</body>
</html>