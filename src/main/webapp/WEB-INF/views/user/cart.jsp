 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Cart List</title>

<!-- Required CSS files -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">
<link rel="stylesheet" href="/assets/css/owl.carousel.css">
<link rel="stylesheet" href="/assets/css/barfiller.css">
<link rel="stylesheet" href="/assets/css/animate.css">
<link rel="stylesheet" href="/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/slicknav.css">
<link rel="stylesheet" href="/assets/css/main.css">
<link rel="stylesheet" href="/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
.thumbnail {
   width: 70px;
   height: 70px;
}

* {
    font-family: 'Gothic A1', sans-serif;
}

.container {

	margin-top: 100px; 

}

h3{

	margin-bottom: 100px; 

}



</style>
<script type="text/javascript">


// 전체 선택
$(document).ready(function(){
   $('#checkall').click(function() {
      var checked = $('#checkall').is(':checked');
      if (checked)
         $('input:checkbox').prop('checked', true);
      if (!checked)
         $('input:checkbox').prop('checked', false);
      summary();
   });
});

// 해당 상품 삭제
function cartDelete(i) {
   var tr = '#tr' + i;
   $(tr).remove();
   cartList = JSON.parse(sessionStorage.getItem('cartList'));
   cartList.splice(i, 1);
   sessionStorage.setItem('cartList', JSON.stringify(cartList));
   summary();
}

// 카트 총 합 계산
function summary() {
   var sum = 0;
   var count = this.form.prdct_id.length;
   for (var i = 0; i < count; i++) {
      if (this.form.prdct_id[i].checked == true) {
         sum += parseInt(this.form.sum[i].value);
         console.log(sum)
         console.log(typeof(sum))
      }
   }
   
   $('.total').html(sum + '원');
}

// 전체 카트 삭제
function allCartDelete() {
   $('#getCart').remove();
   var cartList = new Array();
   sessionStorage.setItem('cartList', JSON.stringify(cartList));
   summary();
}


function nullCheck() {
   var count = this.form.prdct_id.length;
   var checked = 0;
   for (var i = 1; i < count; i++) {
      if (this.form.prdct_id[i].checked == true) {
         checked += 1;
      }
   }
   if (checked < 1) {
      alert("결제할 상품을 선택해주세요.")
      return false;
   } else {
      // 결제 페이지 이동
      //function buy() {
         var order = new Array();
         //var count = this.form.prdct_id.length;
         for (var i = 1; i < count; i++) {
            if (this.form.prdct_id[i].checked == true) {
               var prdct = new Object();
               prdct.prdct_id = this.form.prdct_id[i].value;
               prdct.order_amount = parseInt(this.form.order_amount[i].value);
               prdct.order_size = this.form.order_size[i].value;
               prdct.order_color = this.form.order_color[i].value;
               prdct.prdct_name = this.form.prdct_name[i].value;
               prdct.prdct_thumbnail = this.form.prdct_thumbnail[i].value;
               prdct.sum = parseInt(this.form.sum[i].value);
               console.log(prdct.sum);
               console.log(prdct);
               
               console.log(prdct);
               order.push(prdct);
            }
         }
         
         sessionStorage.setItem("order", JSON.stringify(order));
         window.location.assign("/order/orderInput");
         
      //}
   }
};


</script>
</head>
<body>
<div class="container">
   
      <!-- 장바구니    -->
      <form id="cart" name="form" method="post" action="${pageContext.request.contextPath}/order/orderInput?${_csrf.parameterName}=${_csrf.token}" onsubmit="nullCheck(); return false;">
      <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
      
      <div class="container" style="text-align: center;">
            <br />
            <h3>Shopping Bag</h3>
            <br />

            <table class="table cart_table" style="width:100%">
               <colgroup style="text-align: center;">
                  <col width="10%">
                  <col width="15%">
                  <col width="30%">
                  <col width="15%">
                  <col width="10%">
                  <col width="10%">
                  <col width="10%">
               </colgroup>
               <thead>
               <tr style="text-align: center;">
  <th scope="col" class="checkbox-column"><input type="checkbox" id="checkall"></th>
  <th scope="col" class="image-column">이미지</th>
  <th scope="col" class="product-column">상품명(옵션)</th>
  <th scope="col" class="price-column">판매가</th>
  <th scope="col" class="quantity-column">수량</th>
  <th scope="col" class="total-price-column">주문금액</th>
  <th scope="col" class="delete-column"><i onclick="allCartDelete()" style="cursor: pointer; ">삭제</i></th>
</tr>
               </thead>
<c:if test="${!empty list}">
<c:forEach var="cartMy" items="${list}" varStatus="status">	
			  <div class="content-box">
			    <div class="checkbox-column"><input type="checkbox" name="" id=""></div>
			    <div class="num">${commuMy.commuIdk}</div>
			     <div class="title"><a href="/community/view?commuIdk=${commuMy.commuIdk}">${commuMy.commuTitle}</a></div>
			    <div class="date">${commuMy.regDate}</div>
			    <div class="count"><fmt:formatNumber type="number" maxFractionDigits="3" value="${commuMy.commuViews}" /></div>
			    <div class="delete"><button class="btnDelete" onClick="fn_boardDelete(${commuMy.commuIdk})">X</button></div>
			  </div>
	</c:forEach>
</c:if>		  

               <tbody id="getCart">
                  <input type="hidden" name="prdct_id" />
                  <input type="hidden" name="order_amount" />
                  <input type="hidden" name="order_color" />
                  <input type="hidden" name="order_size" />
                  <input type='hidden' name="sum" />
                  <input type="hidden" name="prdct_name" />
                  <input type="hidden" name="prdct_thumbnail" />
               </tbody>
               <tfoot>
                        <tr class="gift-division">
                        <td>
                        </td>
                        <td colspan="4">
                           
                        </td>
                        <td colspan="3">
                        <span class="cart-total">총 상품가격<span class="total">  0원</span></span> 
                        <span id="total-price"></span>
                        </td>
                     </tr>
                  
               </tfoot>
            </table>

         <button type="submit" class="btn btn-primary">주문하기</button>
         <br /> <br />
   </div>
   </form>

   <!-- footer -->
   
</div>

      <!--Required JS files-->
      <script src="/assets/js/jquery-2.2.4.min.js"></script>
      <script src="/assets/js/vendor/popper.min.js"></script>
      <script src="/assets/js/vendor/bootstrap.min.js"></script>
      <script src="/assets/js/vendor/owl.carousel.min.js"></script>
      <script src="/assets/js/vendor/isotope.pkgd.min.js"></script>
      <script src="/assets/js/vendor/jquery.barfiller.js"></script>
      <script src="/assets/js/vendor/loopcounter.js"></script>
      <script src="/assets/js/vendor/slicknav.min.js"></script>
      <script src="/assets/js/active.js"></script>
</body>
</html>