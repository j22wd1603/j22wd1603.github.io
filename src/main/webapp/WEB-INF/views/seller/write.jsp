<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript">
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
			$('#'+ id).focus();
			return true;
		}
		return false;
}
$(document).ready(function() {
    
	$("#productName").focus();
	
	$("#btnWrite").on("click", function() {
		$("#btnWrite").prop("disabled", true);		//글쓰기 버튼 비활성화
		
		if(trimCheck("tabCode","쇼핑탭을 골라주세요.")){
			$("#btnWrite").prop("disabled", false);
			return;
		}
		if(trimCheck("detailTabCode","상세탭을 골라주세요")){
			$("#btnWrite").prop("disabled", false);
			return;
		}
		if(trimCheck("productName","상품 이름을 입력해주세요")){
			$("#btnWrite").prop("disabled", false);
			return;
		}
		if(trimCheck("productPrice","상품 가격을 입력해주세요")){
			$("#btnWrite").prop("disabled", false);
			return;
		}
		if(trimCheck("productBrandName","상품 브랜드을 입력해주세요")){
			$("#btnWrite").prop("disabled", false);
			return;
		}
		if(trimCheck("bigFile","첫번째 사진을 넣어주세요")){
			$("#btnWrite").prop("disabled", false);
			return;
		}
		if(trimCheck("smallFile","두번째 사진을 넣어주세요")){
			$("#btnWrite").prop("disabled", false);
			return;
		}
		if(trimCheck("productDescription","상품 설명을 입력해주세요")){
			$("#btnWrite").prop("disabled", false);
			return;
		}
		
		var form = $("#writeForm")[0];
		var formData = new FormData(form);
		
		$.ajax({
			type:"POST",
			enctype:"multipart/form-data",
			url:"/seller/writeProc",
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
					$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
				}
				else if(response.code == -1)
				{
					alert("큰파일,작은파일 확장자가 다릅니다.");
					$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
				}
				else if(response.code == 100)
				{
					alert("등록된 판매자 아이디가 아닙니다.");
					$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
				}
				else
				{
					alert("등록 중 오류 발생");
					$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
				}
			},
			error:function(error)
			{
				icia.common.error(error);
				alert("등록 중 오류가 발생하였습니다.");
				$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
			}
			
		});
		
	});
	
	$("#btnMain").on("click", function() {
		location.href = "/seller/main";
	});
});

function previewImage(input,view) {
    var preview = document.getElementById(view);
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
<style>
.container {
	vertical-align: middle;
	font-size: 17px;
	width: 90%;
	height: 3rem;
}
img{
	height: 400px;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/sellerNavigation.jsp" %>
<div class="container">

<h2>상품 등록</h2>
	<form name="writeForm" id="writeForm" method="post" enctype="multipart/form-data">
			<input type="text" id="sellerName" name="sellerName" maxlength="20" value="${seller.sellerName}(${seller.sellerId})" style="ime-mode:active;" class="form-control mt-4 mb-2" placeholder="판매자 이름" readonly />
		<div style="border: 1px solid #c4c2c2;">
			<div style="border-bottom: 1px solid #c4c2c2;">
				<label for="tabCode">쇼핑탭 : </label> <select id="tabCode" name="tabCode" style="width: 12%;" required="required">
					<option value="" <c:if test="${seller.shopTabCode == ''}">selected</c:if>>쇼핑탭</option>
					<c:forEach var="tab" items="${tab}">
						<option value="${tab.shopTabCode}" <c:if test="${seller.shopTabCode == tab.shopTabCode}">selected</c:if>>${tab.shopTabName}</option>
					</c:forEach>
				</select>
				<label for="detailTabCode">상세탭 : </label> <select id="detailTabCode" name="detailTabCode" style="width: 12%;" required="required">
					<option value="">상세탭</option>
					<c:forEach var="detialTab" items="${detailTab}">
						<option value="${detialTab.shopDetailTabCode}">${detialTab.shopDetailTabName}</option>
					</c:forEach>
				</select><br>
		        <label for="productName">상품 이름 : </label><input type="text" id="productName" name="productName" style="width: 30%;" placeholder="상품 이름" required="required" >
		        <label for="productPrice">상품가격 : </label><input type="number" id="productPrice" name="productPrice" style="width: 15%;" placeholder="상품 가격" required="required">
		        <label for="productBrandName">상품 브랜드 : </label><input type="text" id="productBrandName" name="productBrandName" style="width: 30%;" placeholder="상품 브랜드 이름" required="required"><br>
				<div class="form-group2" style="float: left;width: 50%;">
					<label for="profilePicture" style="font-size: 17px;">큰 사진 업로드</label>
					<input type="file" id="bigFile" name="bigFile" style="display: block;" onchange="previewImage(this,'preview');" required="required" />
					<img id="preview" src="/resources/images/seller/noimage.jpg" alt="사진 미리보기" style="font-size: 15px; display: block; margin: 10px auto 0; max-width: 100%;" />
				</div>
			</div>
			<div class="form-group2" style="float: right;width: 50%">
				<label for="profilePicture" style="font-size: 17px;">작은 사진 업로드</label>
				<input type="file" id="smallFile" name="smallFile" style="display: block;" onchange="previewImage(this,'preview2');" required="required" />
				<img id="preview2" src="/resources/images/seller/noimage.jpg" alt="사진 미리보기" style="font-size: 15px; display: block; margin: 10px auto 0; max-width: 100%;" />
			</div>
			<div class="form-group">
				<textarea class="form-control" rows="10" name="productDescription" id="productDescription" style="ime-mode:active;" placeholder="상품 설명을 입력해주세요" required="required"></textarea>
			</div>
		</div>
		
			<div class="form-group row" style="text-align: right; margin-right: 3rem;margin-top: 1rem">
				<div class="col-sm-12">
					<button type="button" id="btnWrite" class="btn btn-primary" title="저장">저장</button>
					<button type="button" id="btnMain" class="btn btn-secondary" title="리스트">리스트</button>
				</div>
			</div>
	</form>
</div>
</body>
</html>