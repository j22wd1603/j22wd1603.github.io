<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#shareAtag").attr("href", document.referrer);

	
	$("#btnWrite").on("click", function() {
		$("#btnWrite").prop("disabled", true);		//글쓰기 버튼 비활성화
		
		if($.trim($("#communityTitle").val()).length <= 0)
		{
			alert("제목을 입력하세요.");
			$("#communityTitle").val("");
			$("#communityTitle").focus();
			
			$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
			
			return;
		}
		
		if($.trim($("#communityContent").val()).length <= 0)
		{
			alert("내용을 입력하세요.");
			$("#communityContent").val("");
			$("#communityContent").focus();
			
			$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
			
			return;
		}
		
		if ($("#commuTab").val() == "") {
			alert("카테고리를 선택하세요.");
			
			$("#commuTab").focus();
			
			$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
			
			return;
		}			
		
		$.ajax({
			type:"POST",
			enctype:"multipart/form-data",
			url:"/community/writeShareProc",
			data: {
				commuTab:$("#commuTab").val(),
				communityTitle:$("#communityTitle").val(),
				communityContent:$("#communityContent").val(),
				productIdk:${product.productIdk}
			},
	        dataType: "json",
			beforeSend:function(xhr)
			{
				xhr.setRequestHeader("AJAX", "true");
			},
			success:function(response)
			{
				if(response.code == 0)
				{
					alert("공유가 완료되었습니다.");
					location.href = "/community/free"
				}
				else if(response.code == 400)
				{
					alert("파라미터 값이 올바르지 않습니다.");
					$("#communityTitle").focus();
					$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
				}
				else
				{
					alert("상품 공유 중 오류 발생");
					$("#communityTitle").focus();
					$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
				}
			},
			error:function(error)
			{
				icia.common.error(error);
				alert("상품 공유 중 오류가 발생하였습니다.");
				$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
			}
			
		});
		
	});

	
	$("#btnList").on("click", function() {
		document.productForm.action = document.referrer;
		document.productForm.submit();
	});
});
</script>    
    
</head>
<body>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<div class="container">
	<h2>상품 공유</h2>
	
		<form name="writeForm" id="writeForm" method="post" enctype="multipart/form-data">
		
			<select name="commuTab" id=commuTab class="custom-select" style="width:auto;">
	            <option value="">게시판 고르기</option>
	            <option value="2" selected="selected">자유 게시판</option>
	         </select>
			<input type="text" name="user" id="user" maxlength="20" value="${user.userNickname}(${user.userId})" style="ime-mode:active;" class="form-control mt-4 mb-2" placeholder="이름을 입력해주세요." readonly />
			<input type="text" name="communityTitle" id="communityTitle" maxlength="100" value="[공유]${product.productName} : 추천상품" style="ime-mode:active;" class="form-control mb-2" placeholder="제목을 입력해주세요." required />
				<div class="form-group">
				    <div class="row">
				        <div class="col-md-3">
				            <img src="/resources/images/product/small/${product.productCode}.${product.productFileExt}" alt="${product.productName}" style="width: 300px;height: 300px;">    
				        </div>
				        <div class="col-md-9">
				            <textarea class="form-control" name="communityContent" id="communityContent" style="text-align:left; resize: none; height: 300px;" placeholder="내용을 입력해주세요" required>
Sweethome 쇼핑몰 백예린친구 님이 아래 상품을 공유합니다:
상품명: 스윙 VIP 테이블 램프
가격: 1,380,600 원
브랜드: 판둘
더 많은 정보와 구매 링크는 아래에서 확인하세요!
[상품 링크](http://sweethome.co.kr:8088/shop/productDetail?productIdk=380)

이제 Sweethome 쇼핑몰의 멋진 상품을 함께 공유하고 소통해요!
				            </textarea>
				        </div>
				    </div>
				</div>
			
				<div class="form-group row">
				    <div class="col-sm-12">
				        <button type="button" id="btnWrite" class="btn btn-primary">공유하기</button>
				        <button type="button" id="btnList" class="btn btn-secondary">돌아가기</button>
				    </div>
				</div>
		</form>		
	
	<form name="productForm" id="productForm" method="post">
			<input type="hidden" name="productIdk" id="productIdk" value="${productIdk}" />
	</form>

</div>


</body>
</html>