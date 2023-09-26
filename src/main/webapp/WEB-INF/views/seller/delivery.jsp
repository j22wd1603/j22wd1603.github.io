<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<style>
*, ::after, ::before {
	box-sizing: unset;
}
.deliveryTable {
	text-align:left;
	margin-bottom: 10px;
	overflow:inherit;
	white-space:nowrap;
	text-overflow:ellipsis;
}

.table-hover th, td {
	border: 1px solid #c4c2c2;
	text-align: center;
	vertical-align: middle;
}

.search {
	text-align: center;
	vertical-align: middle;
}

img {
	width: 100px;
	height: 100px;
}

</style>
<script type="text/javascript">
function fn_paging(curPage)
{
	document.searchForm.curPage.value = curPage;
	document.searchForm.action = "/seller/delivery";
	document.searchForm.submit();
}
function fn_search()
{
	document.searchForm.curPage.value = "1";
	document.searchForm.action = "/seller/delivery";
	document.searchForm.submit();
}

function fn_delivery(orderIdk,index,payStatus)
{
	if(payStatus == 'N'){
		alert("미결제 상품입니다.");
		return;
	}
	
	var msg ="";
	var status = $("#bbsDeliveryStatus"+index).val();
	if(status == 'Y'){
		msg = "선택된 값은 배송완료 입니다.";
	}
	else if(status == 'R'){
		msg = "선택된 값은 배송중 입니다.";
	}
	else{
		msg = "선택된 값은 배송준비중 입니다.";
	}
	
    if(!confirm(msg)){
        return;
    }
    
    $.ajax({
        type :"POST",
        url:"/seller/deliveryStatus",
        data:{
        	orderIdk:orderIdk,
        	status:status
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
        	   location.href = "/seller/delivery";
           }
           else if(response.code == 400){
        	   alert("파라미터 값 오류");
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
}

</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/sellerNavigation.jsp" %>
	<div style="width: 90%; margin: auto; margin-top: 1rem;">
		<div style="display: flex; margin-bottom: 0.8rem;">
			<h2 style="margin-right: auto; color: #525252;">주문 리스트</h2>
			<form class="search d-flex" name="searchForm" id="searchForm" method="post" style="place-content: flex-end;">
				<select id="status" name="status" class="search"style="font-size: 1rem; width: 6rem; height: 3rem;">
					<option value=""  <c:if test="${status == ''}">selected</c:if>>배송상태</option>
					<option value="Y" <c:if test="${status == 'Y'}">selected</c:if>>배송완료</option>
					<option value="R" <c:if test="${status == 'R'}">selected</c:if>>배송중</option>
					<option value="N" <c:if test="${status == 'N'}">selected</c:if>>배송준비중</option>
				</select>
				<select id="searchType" name="searchType" class="search"style="font-size: 1rem; width: 8rem; height: 3rem; margin-left: .5rem;">
					<option value=""  <c:if test="${searchType == ''}">selected</c:if>>검색타입</option>
					<option value="1" <c:if test="${searchType == '1'}">selected</c:if>>상품이름</option>
					<option value="2" <c:if test="${searchType == '2'}">selected</c:if>>상품브랜드</option>
				</select> 
				<input name="searchValue" id="searchValue" class="search me-sm-2" style="width: 15rem; height: 3rem; margin-left: .5rem; font-size: 1rem;"type="text" value="">
				<button class="btn my-2 my-sm-0" onclick="fn_search()"
					style="width: 6rem; height: 3rem; margin-left: .5rem; font-size: 1rem; border: 1px solid;">조회</button>
				<input type="hidden" name="curPage" value="${curPage}" />
			</form>
		</div>
		<div>
			<table class="table table-hover" style="border: 1px solid #c4c2c2;">
				<thead style="border-bottom: 1px solid #ffffff;">
					<tr class="table-thead-main">
						<th style="width: 5%;">주문번호</th>
						<th colspan="5">정보</th>
						<th colspan="3" style="width: 22%;">금액 및 결재정보</th>
						<th style="width: 8%;">주문일자</th>
						<th style="width: 8%;">배송상태</th>
						<th style="width: 8%;">기능</th>
					</tr>
				</thead>
				<tbody>

					<c:if test="${!empty list}">
						<c:forEach items="${list}" var="delivery" varStatus="status">
						<c:set var="row" value="${5+fn:length(delivery.deliveryList)}" />
						<tr>
							<th rowspan="${row}">${delivery.orderIdk}</th>
							<th width="5%">상세번호</th>
							<th>이미지</th>
							<th colspan="2">상품정보</th>
							<th width="5%">수량</th>
							<th>총금액</th>
							<th>할인금액</th>
							<th>결제금액</th>
							<th rowspan="${row}">${delivery.orderDate}</th>
				<th rowspan="${row}">
					<select id="bbsDeliveryStatus${status.index}" class="search">
						<option value=""  <c:if test="${delivery.deliveryStatus == ''}">selected</c:if>>배송상태</option>
						<option value="Y" <c:if test="${delivery.deliveryStatus == 'Y'}">selected</c:if>>배송완료</option>
						<option value="R" <c:if test="${delivery.deliveryStatus == 'R'}">selected</c:if>>배송중</option>
						<option value="N" <c:if test="${delivery.deliveryStatus == 'N'}">selected</c:if>>배송준비중</option>
					</select>
				</th>
							<th rowspan="${row}"><input type="button" onclick="fn_delivery(${delivery.orderIdk},${status.index},'${delivery.payStatus}')" value="배송"></th>
						</tr>
						<c:forEach items="${delivery.deliveryList}" var="deliveryDetail" varStatus="status2">
						<tr>
							<th>${status2.index+1}</th>
							<th><img src="/resources/images/product/small/${deliveryDetail.productCode}.${deliveryDetail.productFileExt}" alt="${deliveryDetail.productName}"></th>
							<th colspan="2">							
								<div class="deliveryTable">
						            상품 이름: ${deliveryDetail.productName}
						        </div>
						        <div class="deliveryTable">
						            상품 단가: ${deliveryDetail.productPrice}
						        </div>
						        <div class="deliveryTable">
						            상품 브랜드: ${deliveryDetail.productBrandName}
						        </div>
							</th>
							<th>${deliveryDetail.quantity}</th>
						<c:choose>
							<c:when test="${status2.index == 0}">	
								<th rowspan="${fn:length(delivery.deliveryList)}">${delivery.totalPrice}</th>
								<th rowspan="${fn:length(delivery.deliveryList)}">${delivery.couponDiscountPrice}</th>
								<th rowspan="${fn:length(delivery.deliveryList)}">${delivery.actualPrice}</th>
							</c:when>
						</c:choose>
						</tr>
						</c:forEach>
						<tr>
							<th colspan="5">주문자 정보</th>
							<th>결제상태</th>
							<th>결제종류</th>
							<th>결제일자</th>
						</tr>
						<tr>
							<th colspan="2" style="text-align: left;">
							<div class="deliveryTable">
								아이디(이름): ${delivery.userId}(${delivery.userName})	
							</div>
							<div class="deliveryTable">
								번호: ${delivery.userPhone}	
							</div>
							</th>
							<th colspan="3" style="text-align: left;" >
								<div class="deliveryTable">
									이메일: ${delivery.userEmail}
								</div>
								<div class="deliveryTable">
									주소: ${delivery.userAddress}
								</div>
							</th>
						<c:choose>
							<c:when test="${delivery.payStatus == 'Y'}">
								<th rowspan="3">결재완료</th>
								<th rowspan="3">${delivery.payMethodType}</th>
								<th rowspan="3">${delivery.approvedDate}</th>
							</c:when>
							<c:otherwise>
								<th rowspan="3" colspan="3">미결재</th>
							</c:otherwise>
						</c:choose>
						</tr>
						<tr>
							<th colspan="5">배송지 정보</th>
						</tr>
						<tr>
							<th colspan="2" style="text-align: left;">
							<div class="deliveryTable">
								받는사람: ${delivery.deliveryName}
							</div>
							<div class="deliveryTable">
								번호: ${delivery.deliveryPhone}	
							</div>
							</th>
							<th colspan="3" style="text-align: left;" >
								<div class="deliveryTable">
									배송지: ${delivery.deliveryAddress}
								</div>
								<div class="deliveryTable">
									배송시 요청사항: ${delivery.deliveryContent}
								</div>
							</th>
						</tr>
						</c:forEach>
					</c:if>

					<c:if test="${empty list}">
						<tr>
							<td colspan="9">주문정보가 없습니다.</td>
						</tr>
					</c:if>

				</tbody>
				</table>
				
				<div style="text-align: center;vertical-align: middle;width: 100%; margin-bottom: 5rem">
					<div style="float: left; width: 90%;">
						<ul class="pagination justify-content-center">
							<c:if test="${!empty paging}">
								<c:if test="${paging.prevBlockPage gt 0}">
									<li class="page-item"><a class="page-link"
										href="javascript:void(0)"
										onclick="fn_paging(${paging.prevBlockPage})">이전블럭</a></li>
								</c:if>
	
								<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
									<c:choose>
										<c:when test="${i ne curPage}">
											<li class="page-item"><a class="page-link"
												href="javascript:void(0)" onclick="fn_paging(${i})">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item active"><a class="page-link" href="javascript:void(0)" style="cursor: default;">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
	
								<c:if test="${paging.nextBlockPage gt 0}">
									<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_paging(${paging.nextBlockPage})">다음블럭</a></li>
								</c:if>
							</c:if>
						</ul>
					</div>
				</div>
		</div>
	</div>
</body>
</html>