<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">
<title>상품 상세 페이지</title>
<script>
<!--세자리마다 , 찍어주는거 / 수량에 따라 변동되는 가격  -->
document.addEventListener("DOMContentLoaded", function () {
    var quantityInput = document.getElementById("quantity");
    var finalPriceElement = document.getElementById("finalPrice");
    var bbsQuantity = document.getElementById("bbsQuantity");
    var finalPriceFormField = document.getElementById("finalPriceFormField");   
    

    var originalPrice = parseFloat('${shop.productPrice}');

    function formatPrice(price) {
        return price.toLocaleString('en-US', { minimumFractionDigits: 0, maximumFractionDigits: 0 });
    }

    var initialQuantity = parseInt(quantityInput.value, 10);
    var initialFinalPrice = originalPrice * initialQuantity;

    finalPriceElement.textContent = formatPrice(initialFinalPrice) + "원";

    quantityInput.addEventListener("input", function () {
        var quantity = parseInt(quantityInput.value, 10);
        var finalPrice = originalPrice * quantity;

        finalPriceElement.textContent = formatPrice(finalPrice) + "원";

        // quantity와 finalPrice 값 폼 설정
        bbsQuantity.value = quantity;
        finalPriceFormField.value = finalPrice;
 
    });
});

function go_order() {
	document.orderForm.action = "/shop/orderPage";
	document.orderForm.submit();
}
</script>
</head>

<body>
    <header>
    </header>

    
	 <div class="productdetail-container">	    
	    <div class="productdetail-image">
	       <img class="img-fluid" src="/resources/images/product/small/${shop.productCode}.${shop.productFileExt}" alt="${shop.productName}">				
	    </div>
		    
		<div class="productdetail-sideinfo">
				<div id="productdetail-sideinfo-brandname">
					<p>${shop.productBrandName}</p>
				</div> 
			              
				<div id="productdetail-sideinfo-name">
				    <h2>${shop.productName}</h2>
				</div>
			        
				<div id="productdetail-sideinfo-price">
					<p><fmt:formatNumber type="number" maxFractionDigits="3" value="${shop.productPrice}" />원</p>
				</div>
					
				<c:set var="detailInfo" value="${shop.productDescription}"/>
				<c:set var="shippingInfo" value="무료배송 "/>
				<div id="productdetail-sideinfo-content-box">
					<div class="productdetail-sideinfo-button" id="detailButton" onclick="showInfo('detail')">상세정보</div>
					<div class="productdetail-sideinfo-button" id="shippingButton" onclick="showInfo('shipping')">배송정보</div>
						    <div id="productdetail-sideinfo-content">
						        <div class="p" id="infoContent"></div>
						    </div>
				</div>
			
				<div class="productdetail-quantity-container">
					<div id="productdetail-quantity">
					    <label for="quantity">수량:</label>
					    <input type="number" id="quantity" name="quantity" value="1" min="1" max="10">
					</div>
					<div id="productdetail-final-price">
					    <p>최종 가격: <span id="finalPrice" name="finalPrice" >${shop.productPrice}</span></p>
					</div>
				</div>
				
				
				<!-- 즉시구매-->							
				<form id="orderForm" name="orderForm" method="post">
				    <input type="hidden" id="bbsProductIdk1" name="bbsProductIdk1" value="${shop.productIdk}">
					<input type="hidden" id="bbsQuantity" name="bbsQuantity" value="1">
					<div class="productdetail-sideinfo-line"></div>								
				</form>
		
				<div class="button-container">
				    <button onclick="go_order()" class="order-button">주문하기</button>
				    <button onclick="goToCartPage()" class="cart-button">장바구니</button>
				</div>
						
				<!-- 장바구니 -->
				<form id="addToCartForm" name="addToCartForm" method="post" style="display: none;">
				    <input type="hidden" id="cartUserId" name="userId" value="${user.userId}">
				    <input type="hidden" id="cartProductIdk" name="productIdk" value="${shop.productIdk}">
				    <input type="hidden" id="bbsQuantity" name="quantity" value="1">
				    <input type="hidden" id="finalPriceFormField" name="finalPrice" value="${shop.productPrice}">
				  
				</form>
						
				<!-- 모달 -->
				<div id="modal" class="modal" style="display: none;">
				    <div class="modal-content">
				        <span class="close" onclick="closeModal()">&times;</span>
				        <p>선택하신 상품이 장바구니에 담겼습니다.</p>
				        <span>
				            <button onclick="continueShopping()" class="continue-shopping-button">계속 쇼핑하기</button>
				            <button onclick="window.location.href='/user/cartPage'" class="add-to-cart-button">장바구니 보기</button>

				        </span>
				    </div>
				</div>			
		</div>
	</div>
		
	
		

				
	<!-- 화면 아랫단 -->		
	<div class="detail-category-container-second">
	    <ul class="detail-ul">
	        <li>
	            <div class="detail-dropbtn" onclick="showContent('detail-photos')">상세사진</div>
	        </li>
	        <li>
	            <div class="detail-dropbtn" onclick="showContent('detail-reviews')">리뷰</div>
	        </li>
	    </ul>
	</div>
	
	   <div id="detail-photos" class="content">
	    	 <div class="detail-reviews-title">상세 사진</div>
	         <img class="detailImage" src="/resources/images/product/big/${shop.productCode}.${shop.productFileExt}" alt="${shop.productName}">
	   </div>  
	    
	   <div id="detail-reviews" class="content">
		    <div class="detail-reviews-title">리뷰</div>
				<div id="review-rating">
				        <div id="review-rating-star">   
				            <h1>★ 4.5</h1>
				            <p>3개의 리뷰</p>
				        </div>
				        <div id="review-rating-rate">    
				            <h6>디자인</h6>
				            <p>만족해요</p>
				            <div class="bar">
						        <div class="bar-fill" style="width: 80%;"></div>
						    </div>
				        </div>
				</div>   
		<c:forEach var="review" items="${review}">
		 	<div class="review-content" >
		  		<div id="review-content-user" >
			 		<p>리뷰번호: ${review.reviewIdk}</p>
	                <p>아이디: ${review.userId}</p>        
					<p>등록일: ${review.regDate}</p>
		        </div>
			 	<div id="review-content-text" >
			 	 	<div id="review-content-image">
			 	  		<img class="detailImage" src="/resources/images/product/big/${shop.productCode}.${shop.productFileExt}" alt="${shop.productName}">
			 	 	</div>
			 	 	<div class="text-wrapper"> 
				 		<span id="text">${review.reviewContent}</span>     
			            <span id="more-text">[더보기]</span>
			            <span id="less-text">[줄이기]</span>  
		            </div>
				</div>
				
		 	 </div>
		  </c:forEach> 
	   </div>

		
	
	
	
	


<!--재품 내용, 배송정보 버튼-->
<script>
    var detailButton = document.getElementById('detailButton');
    var shippingButton = document.getElementById('shippingButton');
    var infoContent = document.getElementById('infoContent');

    // 페이지 로드 시 초기 상세정보 표시와 버튼 스타일 변경
    showInfo('detail');

    function showInfo(type) {
        var info = '';
        var clickedButton = null;

        if (type === 'detail') {
            info = "${detailInfo}";
            clickedButton = detailButton;
        } else if (type === 'shipping') {
            info = "${shippingInfo}";
            clickedButton = shippingButton;
        }

        infoContent.innerHTML = info;

        // 버튼 스타일 변경
        detailButton.classList.remove('productdetail-sideinfo-button-clicked');
        shippingButton.classList.remove('productdetail-sideinfo-button-clicked');

        if (clickedButton) {
            clickedButton.classList.add('productdetail-sideinfo-button-clicked');
        }
    }


 
</script>

<script>
var buttons = document.querySelectorAll(".detail-dropbtn");

buttons.forEach(function(button) {
    button.addEventListener("click", function() {
        // 클릭한 버튼 스타일 변경
        button.style.fontWeight = "bold";
        button.style.textDecoration = "underline"; 
        button.style.color = "#000";
      
       
        
        // 다른 버튼 초기 스타일로 되돌리기
        buttons.forEach(function(otherButton) {
            if (otherButton !== button) {
                otherButton.style.fontWeight = "400";
                otherButton.style.backgroundColor = "#fff";
                otherButton.style.color = ""; // 원래의 색상으로 복원
                otherButton.style.textDecoration = ""; 
            }
        });
    });
});
</script>

<script>

//아랫단 상세사진, 리뷰
function showContent(id) {
  // 모든 콘텐츠 숨김
  var contents = document.getElementsByClassName('content');
  for (var i = 0; i < contents.length; i++) {
      contents[i].style.display = 'none';
  }

  // 클릭한 요소만 보이게 함
  var element = document.getElementById(id);
  if (element) {
      element.style.display = 'block';

  }
}


//리뷰 더보기
const textWrapper = document.querySelector('.text-wrapper');
const text = document.querySelector('#text');
const moreText = document.querySelector('#more-text');
const lessText = document.querySelector('#less-text');        


moreText.addEventListener('click', () => {

moreText.style.display = 'none'; // 더보기 텍스트 삭제
lessText.style.display = 'inline-block'; // 줄이기 텍스트 표시
text.style.display = 'inline-block'; // 텍스트의 속성을 -webkit-box에서 일반 inline-block 으로 변경
});


lessText.addEventListener('click', () => {

lessText.style.display = 'none'; // 줄이기 텍스트 삭제
moreText.style.display = 'inline-block'; // 더보기 텍스트 표시
text.style.display = '-webkit-box'; // 텍스트의 속성을 다시 -webkit-box로 표시
});
</script>

<script>
//장바구니 모달
function showModal() {
    var modal = document.getElementById("modal");
    modal.style.display = "block"; 
}

function closeModal() {
    var modal = document.getElementById("modal");
    modal.style.display = "none";
}

function continueShopping() {
    closeModal();
}

function goToCartPage() {
	  $.ajax({
	        type: 'POST',
	        url: '/user/cart',
	        data: {	
	        	userId: $("#cartUserId").val(),
	            productIdk: $("#cartProductIdk").val(),
	            quantity: $("#bbsQuantity").val(),
	            finalPrice: $("#finalPriceFormField").val()
	        },
	        datatype : "JSON",
	        beforeSend : function(xhr){
	              xhr.setRequestHeader("AJAX", "true");
	          },
	        success: function(response) {      
	            if(response.code == 0)
	            {
	               showModal();
	            }	            
	            else if(response.code == 404)
                {
                   alert("로그인 후 이용 가능합니다.");
                   window.location.href='/user/loginPage'
                }
               else if(response.code == 400)
               {
                  alert("파라미터 값이 올바르지 않습니다.");
               }
               else
               {
                  alert("한 제품당 장바구니 수량은 최대 10개입니다.");
               }   
 
	        },
	        error: function(xhr, status, error) {      
	            alert("장바구니 추가 중 오류 발생: " + error);
	        }
	    });
}
</script>
</body>
</html>