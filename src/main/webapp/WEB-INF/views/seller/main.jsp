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
function trimCheck(id,msg) {
	   if($.trim($(id).val()).length <=0){
		    alert(msg);
			$(id).val("");
			$(id).focus();
			return true;
	   }
		return false;
}

function expCheck(id,msg,exp) { 
		if(!exp.test($(id).val()))
		{
			alert(msg);
			$(id).focus();
			return true;
		}
		return false;
}
$("document").ready(function(){
	$('#detailSelect').on("change", function() {
		$("input[name=curPage]").val(1);
		$("input[name=detailTabCode]").val($("#detailSelect option:selected").val());
		$("form[name=searchForm]").attr("action", "/seller/main").submit()
		//document.searchForm.action = "/seller/main";
		//document.searchForm.submit();
	});
});
/* 위 제이쿼리 아래 자바스크립트 문법  */
function fn_search()
{
	document.searchForm.curPage.value = "1";
	document.searchForm.action = "/seller/main";
	document.searchForm.submit();
}

function fn_paging(curPage)
{
	document.searchForm.curPage.value = curPage;
	document.searchForm.action = "/seller/main";
	document.searchForm.submit();
}


function fn_toggleView(index) {
	
    var hidden = document.getElementById('hidden' + index);
    var alive = document.getElementById('row' + index);

    if (hidden) {
        if (hidden.style.display === 'table-row') {
            hidden.style.display = 'none';
            alive.style.display = 'none';
        }
        else {
            hidden.style.display = 'table-row';
            alive.style.display = 'table-row';
        }
    }
}

function fn_update(productIdk,index){
	var btnId = "#btnUpdate"+index;
	var bigImg = "";
	var smallImg = "";

	
	$(btnId).prop("disabled", true);		//글쓰기 버튼 비활성화
	
	if(trimCheck("#tabCode"+index,"쇼핑탭을 골라주세요.")){
		$(btnId).prop("disabled", false);
		return;
	}
	if(trimCheck("#detailTabCode"+index,"상세탭을 골라주세요")){
		$(btnId).prop("disabled", false);
		return;
	}
	if(trimCheck("#productName"+index,"상품 이름을 입력해주세요")){
		$(btnId).prop("disabled", false);
		return;
	}
	if(trimCheck("#productPrice"+index,"상품 가격을 입력해주세요")){
		$(btnId).prop("disabled", false);
		return;
	}
	if(trimCheck("#productBrandName"+index,"상품 브랜드을 입력해주세요")){
		$(btnId).prop("disabled", false);
		return;
	}
	if($.trim($("#bigFile"+index).val()).length <=0 ^ $.trim($("#smallFile"+index).val()).length <=0){
	    alert("사진은 둘다 입력하거나, 둘다 입력하지마세요.");
	    $("#bigFile"+index).focus();
	    return;
	}
	
	if($.trim($("#bigFile"+index).val()).length <=0){
		bigImg = "N";
	}
	else
	{
		bigImg = "Y";	
	}
	if($.trim($("#smallFile"+index).val()).length <=0){
		smallImg = "N";
	}
	else
	{
		smallImg = "Y";	
	}
	
	if(trimCheck("#productDescription"+index,"상품 설명을 입력해주세요")){
		$(btnId).prop("disabled", false);
		return;
	}
	
	var formData = new FormData();
	formData.append("productIdk",productIdk);
	formData.append("bigFile",$("#bigFile"+ index)[0].files[0]);
	formData.append("smallFile",$("#smallFile"+ index)[0].files[0]);
	formData.append("tabCode",$("#tabCode"+ index).val());
	formData.append("detailTabCode",$("#detailTabCode"+ index).val());
	formData.append("productName",$("#productName"+ index).val());
	formData.append("productPrice",$("#productPrice"+ index).val());
	formData.append("productBrandName",$("#productBrandName"+ index).val());
	formData.append("productDescription",$("#productDescription"+ index).val());
	formData.append("bigImg",bigImg);
	formData.append("smallImg",smallImg);
	
	$.ajax({
		type:"POST",
		enctype:"multipart/form-data",
		url:"/seller/update",
		data:formData,
		processData:false,				//formData를 string으로 변환하지 않음
		contentType:false,				//content-type헤더가 multipart/form-data로 전송
		cache:false,
		timeout:600000,
		beforeSend:function(xhr)
		{
			xhr.setRequestHeader("AJAX", "true");
		},
		success:function(response)
		{
			if(response.code == 0)
			{
				alert("상품이 등록되었습니다.");
				location.href = "/seller/main";

			}
			else if(response.code == 400)
			{
				alert("파라미터 값이 올바르지 않습니다.");
				$(btnId).prop("disabled", false);		//글쓰기 버튼 활성화
			}
			else if(response.code == -1)
			{
				alert("큰파일,작은파일 확장자가 다릅니다.");
				$(btnId).prop("disabled", false);		//글쓰기 버튼 활성화
			}
			else if(response.code == 100)
			{
				alert("등록된 판매자 아이디가 아닙니다.");
				$(btnId).prop("disabled", false);		//글쓰기 버튼 활성화
			}
			else
			{
				alert("등록 중 오류 발생");
				$(btnId).prop("disabled", false);		//글쓰기 버튼 활성화
			}
		},
		error:function(error)
		{
			icia.common.error(error);
			alert("등록 중 오류가 발생하였습니다.");
			$(btnId).prop("disabled", false);		//글쓰기 버튼 활성화
		}
		
	});
}

function fn_delete(productIdk, bbsStatus)
{
	var msg ="";
	var status ="";
	if(bbsStatus == 'Y'){
		msg = "판매중지 하시겠습까";
		status = 'N';
	}
	else{
		msg = "재판매 하시겠습까";
		status = 'Y';
	}
	
    if(!confirm(msg)){
        return;
    }
    
    $.ajax({
        type :"POST",
        url:"/seller/delete",
        data:{
        	productIdk:productIdk,
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
        	   location.href = "/seller/main";
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

function fn_deleteView(productIdk)
{
	var msg ="삭제 하시겠습니까?";
	
    if(!confirm(msg)){
        return;
    }
    
    $.ajax({
        type :"POST",
        url:"/seller/deleteView",
        data:{
        	productIdk:productIdk
        },
        datatype:"JSON",
        success:function(response)
        {
           if(response.code == 0)
           {
        	   alert("상품이 삭제되었습니다.");
        	   location.href = "/seller/main";
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



function fn_write(){
	location.href = "/seller/write";
}

function previewImage(input,id) {
    var preview = document.getElementById(id);
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            preview.src = e.target.result;
        }

        reader.readAsDataURL(input.files[0]);
    } else {
        preview.src = '/resources/images/seller/noimage.jpg';
    }
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/sellerNavigation.jsp" %>
	<div style="width: 90%; margin: auto; margin-top: 1rem;">
		<div style="display: flex; margin-bottom: 0.8rem;">
			<h2 style="margin-right: auto; color: #525252;">상품 리스트</h2>
			<form class="search d-flex" name="searchForm" id="searchForm" method="post" style="place-content: flex-end;">
				<select id="status" name="status" class="search"style="font-size: 1rem; width: 6rem; height: 3rem;">
					<option value="">상태</option>
					<option value="Y" <c:if test="${status == 'Y'}">selected</c:if>>판매중</option>
					<option value="N" <c:if test="${status == 'N'}">selected</c:if>>판매정지</option>
				</select>
				<select id="searchType" name="searchType" class="search"style="font-size: 1rem; width: 8rem; height: 3rem; margin-left: .5rem;">
					<option value="">검색타입</option>
					<option value="1" <c:if test="${searchType == '1'}">selected</c:if>>상품명</option>
					<option value="2" <c:if test="${searchType == '2'}">selected</c:if>>브랜드명</option>
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
						<th scope="col" style="width: 10%;">이미지</th>
						<th scope="col" style="width: 5%;">쇼핑탭</th>
						<th scope="col" style="width: 5%;">
							<select id="detailSelect">
								<option value="" <c:if test="${detailTabCode == ''}">selected</c:if>>상세탭</option>
								<c:forEach var="detail" items="${detailTab}">
									<option value="${detail.shopDetailTabCode}" <c:if test="${detailTabCode == detail.shopDetailTabCode}">selected</c:if>>${detail.shopDetailTabName}</option>
								</c:forEach>
							</select>
						</th>
						<th scope="col">상품명</th>
						<th scope="col" style="width: 15%;">브랜드명</th>
						<th scope="col" style="width: 10%;">판매자아이디</th>
						<th scope="col" style="width: 5%;">상품상태</th>
						<th scope="col" style="width: 10%;">등록일</th>
						<th scope="col" style="width: 6%;">기능</th>
					</tr>
				</thead>
				<tbody>

					<c:if test="${!empty list}">
						<c:forEach items="${list}" var="product" varStatus="status">
							<tr >
								<th><img src="/resources/images/product/small/${product.productCode}.${product.productFileExt}" alt="${product.productName}"></th>
								<th scope="col">${product.shopTabName}</th>
								<th scope="col">${product.shopDetailTabName}</th>
								<th scope="col">${product.productName}</th>
								<th scope="col">${product.productBrandName}</th>
								<th scope="col">${product.sellerId}</th>
								<c:choose>
									<c:when test="${product.productStatus == 'Y'}">
										<th scope="col">판매 중</th>
									</c:when>
									<c:otherwise>
										<th scope="col">판매 정지</th>
									</c:otherwise>
								</c:choose>
								<th scope="col">${product.regDate}</th>
								<th>
									<input type="button" onclick="fn_toggleView(${status.index})" value="수정창" class="btn btn-outline-dark" style="margin-bottom: 10px; width: 3rem"><br/>
								</th>
							</tr>
							
							<tr id="row${status.index}" style="display: none;">
								<th scope="col" style="width: 10%;">이미지</th>
								<th scope="col" style="width: 5%;">탭</th>
								<th scope="col" colspan="2">상품 정보</th>
								<th scope="col" style="width: 15%;">브랜드명</th>
								<th scope="col" style="width: 10%;">판매자아이디</th>
								<th scope="col" style="width: 5%;">상품상태</th>
								<th scope="col" style="width: 10%;">등록일</th>
								<th scope="col" style="width: 6%;">기능</th>
							</tr>
							<tr id="hidden${status.index}" style="display: none;">
								<th style="overflow: hidden;">
									<div style="float: left;width: 50%; border-right: 1px solid #c4c2c2;">
										<label for="bigFile${status.index}" style="font-size: 17px;">큰 사진</label>
										<input type="file" id="bigFile${status.index}" name="bigFile${status.index}" onchange="previewImage(this,'previewBig${status.index}');" />
										<img id="previewBig${status.index}" src="/resources/images/product/big/${product.productCode}.${product.productFileExt}" alt="${product.productName}" style="font-size: 15px; display: block; margin: 10px auto 0; max-width: 100%;" />
									</div>				
									<div style="float: left;width: 50%;">
										<label for="smallFile${status.index}" style="font-size: 17px;">작은 사진</label>
										<input type="file" id="smallFile${status.index}" name="smallFile${status.index}" onchange="previewImage(this,'previewSmail${status.index}');" />
										<img id="previewSmail${status.index}" src="/resources/images/product/small/${product.productCode}.${product.productFileExt}" alt="${product.productName}" style="font-size: 15px; display: block; margin: 10px auto 0; max-width: 100%;" />
									</div>
								</th>
								<th scope="col">
									<div style="margin-bottom: 20px">
										쇼핑탭 <select id="tabCode${status.index}">
											<option value="" <c:if test="${seller.shopTabCode == ''}">selected</c:if>>쇼핑탭</option>
											<c:forEach var="tab" items="${tab}">
												<option value="${tab.shopTabCode}" <c:if test="${product.shopTabCode == tab.shopTabCode}">selected</c:if>>${tab.shopTabName}</option>
											</c:forEach>
										</select>
									</div>
									<div> 상세텝
										<select id="detailTabCode${status.index}">
											<option value="">상세탭</option>
											<c:forEach var="detialTab" items="${detailTab}">
												<option value="${detialTab.shopDetailTabCode}" <c:if test="${product.shopDetailTabCode == detialTab.shopDetailTabCode}">selected</c:if>>${detialTab.shopDetailTabName}</option>
											</c:forEach>
										</select>
									</div>
								</th>
								<th scope="col" colspan="2">
									<div style="margin-bottom: 10px">
										<label for="productName${status.index}" style="width: 6em; text-align: left;">상품 이름</label> : <input type="text" id="productName${status.index}" value="${product.productName}" >
		        					</div>
		        					<div style="margin-bottom: 10px">
		        						<label for="productPrice${status.index}" style="width: 6em; text-align: left;">상품가격</label> : <input type="number" id="productPrice${status.index}" value="${product.productPrice}">
		        					</div>
		        					<div style="margin-bottom: 10px">
		        						<label for="productBrandName${status.index}" style="width: 6em; text-align: left;">상품 브랜드</label> : <input type="text" id="productBrandName${status.index}" value="${product.productBrandName}">
									</div>
								</th>
								<th scope="col"><textarea rows="10" id="productDescription${status.index}" style="ime-mode:active;">${product.productDescription}</textarea></th>
								<th scope="col">${product.sellerId}</th>
								<c:choose>
									<c:when test="${product.productStatus == 'Y'}">
										<th scope="col"><a href="#" onclick="fn_delete(${product.productIdk},'${product.productStatus}')">판매 중</a></th>
									</c:when>
									<c:otherwise>
										<th scope="col"><a href="#" onclick="fn_delete(${product.productIdk},'${product.productStatus}')">판매 정지</a></th>
									</c:otherwise>
								</c:choose>
								<th scope="col">${product.regDate}</th>
								<th>
									<div style="margin-bottom: 20px;">
										<input id="btnUpdate${status.index}" type="button" onclick="fn_update(${product.productIdk},${status.index})" value="상품 수정" class="btn btn-outline-dark">
									</div>
									<div style="margin-bottom: 20px;">
										<input type="button" onclick="fn_deleteView(${product.productIdk})" value="상품 삭제" class="btn btn-outline-dark">
									</div>
								</th>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${empty list}">
						<tr>
							<td colspan="9">등록된 상품정보가 없습니다.</td>
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
					<div style="float: right; width: 10%;">
						<button type="button" onclick="fn_write()" class="btn btn-outline-secondary">글쓰기</button>
					</div>
				</div>
		</div>
	</div>
</body>
</html>