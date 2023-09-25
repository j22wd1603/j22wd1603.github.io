<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Cart Page</title>

 <script>

	//선택 삭제
	var checkValue = "";
	
	$(document).ready(function () {
		
		//선택한것에 대한 삭제
	  var chkObj = document.getElementsByName("selectedProduct");
	  var rowCnt = chkObj.length;
	
	  $("input[name='selectedProduct']").click(function(){
	      if($("input[name='selectedProduct']:checked").length == rowCnt){
	          $("input[name='allCheck']")[0].checked = true;
	      }
	      else{
	          $("input[name='allCheck']")[0].checked = false;
	      }
	  });
	  
    // "전체 선택" 체크박스 클릭 시
    $("#selectAllCheckbox").click(function () {
        var isChecked = $(this).prop("checked");

        // 모든 상품 체크박스 상태 변경
        $(".productCheckbox").prop("checked", isChecked);

        // 현재 페이지 이외의 페이지의 "전체 선택" 체크박스 상태도 변경
        $(".otherPageSelectAllCheckbox").prop("checked", isChecked);
    });

    // 주문 페이지로 이동 버튼 클릭 시
    $("#orderButton").click(function () {
        var selectedProducts = [];

        // 선택된 상품들을 수집
        $(".productCheckbox:checked, .otherPageSelectAllCheckbox:checked").each(function () {
            var productIdk = $(this).val();
            var quantity = $(this).closest("tr").find(".quantity").text();
            quantity = parseInt(quantity);

            if (!isNaN(quantity) && quantity > 0) {
                selectedProducts.push({ productIdk: productIdk, quantity: quantity });
            }
        });

        if (selectedProducts.length === 0) {
            alert("주문할 상품을 선택하세요.");
            return;
        }

        var orderForm = $("#orderForm");
        orderForm.empty();

        $.each(selectedProducts, function (index, product) {
            orderForm.append(
                $("<input>")
                    .attr("type", "hidden")
                    .attr("name", "bbsProductIdk")
                    .val(product.productIdk)
            );
            orderForm.append(
                $("<input>")
                    .attr("type", "hidden")
                    .attr("name", "bbsQuantity")
                    .val(product.quantity)
            );
        });

        var curPageInput = $("<input>")
            .attr("type", "hidden")
            .attr("name", "curPage")
            .val("${curPage}");
        orderForm.append(curPageInput);

        orderForm.attr("action", "/shop/orderPage");
        orderForm.submit();
    });
});

	
    
function deleteValue()
{
    var userId = $("#deleteUserId").val();
    //var productIdk = $("#deleteProductIdk").val();

    var valueArr = new Array();
    var list = $("input[name='selectedProduct']");
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){//선택되어 있으면 배열에 값을 저장함 
            //valueArr.push(list[i].value);
           if(checkValue == "")
           {
              checkValue = list[i].value;
           }
           else
           {
              checkValue = checkValue + "," + list[i].value;
           }
        }
    }
    //alert("선택한 물품코드 : " + checkValue);

    if(checkValue == "")      //if(valueArr.length == 0){
    {
        alert("선택된 물품이 없습니다.");
    }
    else{

	    if (confirm("장바구니 물품을 삭제 하시겠습니까?") == true) {
	        $.ajax({
	            type: 'POST',
	            url: '/user/cartDelete',
	            data: {
	                productIdk: checkValue
	            },
	            dataType: "json",
	            beforeSend: function (xhr) {
	                xhr.setRequestHeader("AJAX", "true");
	            },
	            success: function (response) {
	                if (response.code == 0) {
	                    alert("상품이 삭제되었습니다.");
	                    location.href = "/user/cartPage";	                   
	                } else if (response.code == 500) {
	                    alert("상품 삭제 중 오류가 발생했습니다.");
	                } else {
	                    alert("알 수 없는 오류가 발생했습니다.");
	                }
	            },
	            error: function (xhr, status, error) {
	                alert("장바구니 삭제 중 오류 발생: " + error);
	            }
	        });
	    }
    }
}

//페이징
function fn_list(curPage)
{
   document.cartForm.curPage.value = curPage;
   document.cartForm.submit();
}


</script>   
</head>

<body>

   <header><h1 id="cart-title">SHOPPING BAG</h1></header>

     <section>
       <div class="cartList">
           <table border="1">
               <tr>
                   <th class="select-checkbox">
                       <input type="checkbox" id="selectAllCheckbox">
                       <label for="selectAllCheckbox">전체 선택</label>
                   </th>
                   <th></th>
                   <th>브랜드</th>
                   <th>상품명</th>
                   <th>판매가</th>
                   <th>수량</th>
                   <th>배송비</th>
                   <th>최종 가격</th>
                   <th>장바구니 등록일</th>
               </tr>
               <c:forEach var="cartItem" items="${cartList}">
                   <tr>
                       <td class="select-checkbox">
                           <input type="checkbox" class="productCheckbox" name="selectedProduct" value="${cartItem.productIdk}">
                       </td>
                       <td><img src="/resources/images/product/small/${cartItem.productCode}.${cartItem.productFileExt}"alt="${cartItem.productName}"></td>
                       <td>${cartItem.productBrandName}</td>
                       <td>${cartItem.productName}</td>
                       <td><fmt:formatNumber value="${cartItem.productPrice}" type="number" pattern="#,##0"/></td>
                       <td class="quantity">${cartItem.quantity}</td>
                       <td>무료배송</td>
                       <td><fmt:formatNumber value="${cartItem.quantity * cartItem.productPrice}" type="number" pattern="#,##0"/></td>
                       <td>${cartItem.cartRegDate}</td>
                   </tr>
               </c:forEach>      
           </table>           
       </div>
       
       <div class="button-container-cart">
	   		<button id="deleteButton" onClick="deleteValue()">삭제</button>
	       <button id="orderButton">주문 페이지로 이동</button>
   		</div>
   </section>
  
          
   <footer>   
   	 <ul class="pagination justify-content-center">
         <c:if test="${!empty paging}">      
            <c:if test="${paging.prevBlockPage gt 0}">
               <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})">이전블럭</a></li>
            </c:if>
         
            <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
               <c:choose>
                  <c:when test="${i ne curPage}">
                     <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${i})">${i}</a></li>
                  </c:when>
                  <c:otherwise>
                     <li class="page-item active"><a class="page-link" href="javascript:void(0)" style="cursor:default;">${i}</a></li>
                  </c:otherwise>
               </c:choose>
            </c:forEach>
         
            <c:if test="${paging.nextBlockPage gt 0}">
               <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})">다음블럭</a></li>
            </c:if>
         </c:if>
      </ul>
   </footer>
   

<form id="orderForm" name="orderForm" method="post"></form>

<form id="cartForm" name="cartForm" action="/user/cartPage" method="get">
     <input type="hidden" name="curPage" value="${curPage}">
</form>

<form id="deleteCartForm" name="deleteCartForm" method="post" style="display: none;">
    <input type="hidden" id="deleteUserId" name="userId" value="">
    <input type="hidden" id="deleteProductIdk" name="productIdk" value="">
</form>


 
</body>
</html>
