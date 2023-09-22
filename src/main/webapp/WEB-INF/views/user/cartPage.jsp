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
	                    <td> <img  src="/resources/images/product/small/${cartItem.productCode}.${cartItem.productFileExt}" alt="${cartItem.productName}">	</td>
	                    <td>${cartItem.productBrandName}</td>
	                    <td>${cartItem.productName}</td>
	                    <td><fmt:formatNumber value="${cartItem.productPrice}" type="number" pattern="#,##0"/></td>
						<td>${cartItem.quantity}</td>
	                    <td>무료배송</td>
	                    <td><fmt:formatNumber value="${cartItem.quantity * cartItem.productPrice}" type="number" pattern="#,##0"/></td>
	                    <td>${cartItem.cartRegDate}</td>
	                </tr>
	            </c:forEach>
	        </table>
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

   <form id="cartForm" name="cartForm" action="/user/cartPage" method="get">
			<input type="hidden" name="curPage" value="${curPage}">
	</form>
 
	
</body>
</html>

