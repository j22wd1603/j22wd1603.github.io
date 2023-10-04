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
       setTotalInfo($(".cart_info_td"));   

    });


 
    $(".productCheckbox").on("change", function () {
        /* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
        setTotalInfo();
    });

    /* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
    function setTotalInfo() {
        let totalPrice = 0; // 총 가격

        $(".cart_info_td").each(function (index, element) {
            if ($(element).find(".productCheckbox").is(":checked") === true) {
                // 선택한 상품의 최종 가격을 가져와서 총 가격에 더합니다.
                totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
            }
        });

        // 총 가격을 화면에 업데이트
        $(".totalPrice_span").text(totalPrice.toLocaleString());
    }

    
    
 // 주문버튼
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

    //전체상품주문
    $(document).ready(function () {
        // "전체상품주문" 버튼 클릭 시
        $("#orderButtonAll").click(function () {
            var selectedProducts = [];

            // 모든 상품 체크박스를 선택하거나 해제
            $(".productCheckbox, .otherPageSelectAllCheckbox").prop("checked", true);

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

//선택삭제    
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
	            url: '/shop/cartDelete',
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
	                    location.href = "/shop/cartPage";	                   
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
   
//전체삭제
function deleteValueAll() {
    var userId = $("#deleteUserId").val();

    // 모든 체크박스를 선택 상태로 변경
    $("input[name='selectedProduct']").prop("checked", true);

    var valueArr = [];
    var list = $("input[name='selectedProduct']");
    for (var i = 0; i < list.length; i++) {
        if (list[i].checked) {
            if (checkValue == "") {
                checkValue = list[i].value;
            } else {
                checkValue = checkValue + "," + list[i].value;
            }
        }
    }

    if (checkValue == "") {
        alert("선택된 물품이 없습니다.");
    } else {
        if (confirm("장바구니 물품을 삭제 하시겠습니까?") == true) {
            $.ajax({
                type: 'POST',
                url: '/shop/cartDelete',
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
                        location.href = "/shop/cartPage";
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

   <header><h1 id="cart-title">CART</h1></header>

     <section>
	     <header>
	       <div class="orderPage-container-section-title2"><h1>MY CART (${fn:length(cartList)})</h1></div>
	   	</header>	 
	   		 
	     <main>       
	         <div class="cartList">
	          <table >
	               <tr>
	                   <th><input type="checkbox" id="selectAllCheckbox"><label for="selectAllCheckbox">전체선택</label></th>
	                   <th></th>
	                   <th>상품정보</th>
	                   <th>판매가</th>
	                   <th>수량</th>
	                   <th>배송비</th>
	                   <th>최종 가격</th>
	                   <th>장바구니 등록일</th>
	               </tr>
	               <c:forEach var="cartItem" items="${cartList}">
                   <tr>
                        <td class="select-checkbox cart_info_td">
                           <input type="checkbox" class="productCheckbox" name="selectedProduct" value="${cartItem.productIdk}">
                           <input type="hidden" class="individual_totalPrice_input" value="${cartItem.quantity * cartItem.productPrice}">
                       </td>

                       <td><img src="/resources/images/product/small/${cartItem.productCode}.${cartItem.productFileExt}" alt="${cartItem.productName}"></td>
                       <td>
					        <div class="product-info">
					        	<div class="brand" style="color: #808080; font-size: 12px;">${cartItem.productBrandName}</div>
					        	<div class="product-name">${cartItem.productName}</div>
					        </div>
					    </td>
                       <td><fmt:formatNumber value="${cartItem.productPrice}" type="number" pattern="#,##0"/></td>
                       <td class="quantity">${cartItem.quantity}</td>
                       <td>무료배송</td>
                       <td><strong><fmt:formatNumber value="${cartItem.quantity * cartItem.productPrice}" type="number" pattern="#,##0"/></strong></td>
                       <td>${cartItem.cartRegDate}</td>
                   </tr>
               	   </c:forEach>      
	           </table>           
	      	 </div>
	       
	       <div class="button-container-cart">
		   		<button id="deleteButton" onClick="deleteValue()">선택삭제</button>
		   		<button id="deleteButton-all" onClick="deleteValueAll()">전체삭제</button>
		   		
		   		<div class="paging">
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
				</div>   
		   </div>
		   
		   
		   
		    
		  <div>
		    <h6 style="font-size: 10px; text-align: right; margin-top:10px; margin-right: 250px;">*쿠폰은 주문서 작성 시 적용할 수 있습니다.</h6>
		</div>

	   			
		    
	   		<div class="total-container-cart">
	   			<ul>
					<li>
		                <div class="label">총 상품금액</div>
		                <div id="price">
		                  <div class="box-txt">
                      		<span class="totalPrice_span">0</span> 원
		                </div>
		              </li>		              		
		              <li>  
		                <div class="label"> </div>
		                	<div class="box txt">+</div>
		              </li>   		
		              <li>
		              	<div class="label">배송비</div>
		              	<div id="shipment">
		                	<div class="box-txt">0원</div>
		                </div>
		              </li>
		               <li>  
		                <div class="label"> </div>
		                	<div class="box txt">=</div>
		              </li>
		              <li>
		                <div class="label">결제예정금액</div>
		                <div id="allprice">
		                  <div class="box-txt2 totalPrice_span">
		                   </div>
		                </div>
		              </li>
	   			</ul>
	   			
	   			
	   		</div>
			<div class="totalbutton-container">
	           <button id="orderButton">선택상품주문</button>
	           <button id="orderButtonAll" value=#selectAllCheckbox>전체상품주문</button>
	           </div>
	        
	   </main>
   </section>
	
	<footer>
	</footer>
  

<form id="orderForm" name="orderForm" method="post"></form>

<form id="cartForm" name="cartForm" action="/shop/cartPage" method="get">
     <input type="hidden" name="curPage" value="${curPage}">
</form>

<form id="deleteCartForm" name="deleteCartForm" method="post" style="display: none;">
    <input type="hidden" id="deleteUserId" name="userId" value="">
    <input type="hidden" id="deleteProductIdk" name="productIdk" value="">
</form>


 
</body>
</html>
