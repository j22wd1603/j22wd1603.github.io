<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>

  
 <style>
 .custom-radio-input2 {
    display: none;
  }

  /* 라디오 버튼 라벨 스타일 */
  .custom-radio-label2 {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    background-color: #f0f0f0;
    border: 1px solid #ccc;
    border-radius: 4px;
    cursor: pointer;
    user-select: none;
  }

  /* 선택된 라디오 버튼 라벨 스타일 */
  .custom-radio-input2:checked + .custom-radio-label2 {
    background-color: #B78D65;
    color: #fff;
    border-color: #B78D65;
  }
  
  .title{
  
    box-shadow: 3px 3px 50px #e6e6e6;
    border-radius: 20px;
    position: relative;
    display: inline-block;
    border-radius: 20px;
    text-align: center;
    border: 1px solid #ccc;
    font: inherit;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    align-items: space-between;
    -webkit-align-items: space-between;
    justify-content: space-between;
    -webkit-justify-content: space-between;
    border: 1px dashed #dbdbdb;
    color: #757575;
    font-size: 13px;
    font-weight: bold;
    -webkit-transition: .1s color;
    transition: .1s color;
    margin: auto;
  
}

.form-control{
  
    box-shadow: 3px 3px 50px #e6e6e6;
    border-radius: 20px;
    position: relative;
    display: inline-block;
    border-radius: 20px;
    text-align: center;
    border: 1px solid #ccc;
    font: inherit;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    align-items: space-between;
    -webkit-align-items: space-between;
    justify-content: space-between;
    -webkit-justify-content: space-between;
    border: 1px dashed #dbdbdb;
    color: #757575;
    font-size: 13px;
    font-weight: bold;
    -webkit-transition: .1s color;
    transition: .1s color;
    margin: auto;

}

.form-group2{
	 justify-content: space-between;
	 font-size: 13px;
	 margin: auto;
}

.btn btn-primary{
    padding: 10px;
    background-color: #8b1411;
    color: #fff;
    border-radiu: 10px;
    border-radius: 5px;

}

.btn{
	display: inline-block;
    font-weight: 400;
    line-height: 1.5;
    color: #777;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    user-select: none;
    background-color: transparent;
    border: 1px solid transparent;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    border-radius: 0px;
    transition: color 0.15s
  }

input{
	margin-top:20px;
}
 </style>
<script type="text/javascript">
$(document).ready(function() {
	
    

	$("#questionTitle").focus();
	
	$("#btnWrite").on("click", function() {
		$("#btnWrite").prop("disabled", true);		//글쓰기 버튼 비활성화
		
		if(!$("input[name='questionCategory']:checked").val())
		{
			alert("문의유형을 선택해주세요.");			
			$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
			
			return;
		}
		
		if($.trim($("#questionTitle").val()).length <= 0)
		{
			alert("제목을 입력하세요.");
			$("#questionTitle").val("");
			$("#questionTitle").focus();
			
			$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
			
			return;
		}
		
		if($.trim($("#questionContent").val()).length <= 0)
			
		{
			alert("내용을 입력하세요.");
			$("#questionContent").val("");
			$("#questionContent").focus();
			
			$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
			
			return;
		}
		
		var form = $("#writeForm")[0];
		var formData = new FormData(form);
		
		$.ajax({
			type:"POST",
			enctype:"multipart/form-data",
			url:"/cs/writeProc",
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
					alert("게시물이 등록되었습니다.");
					location.href = "/user/mypageMyQ";
					
					/*
					document.bbsForm.action = "/board/list";
					document.bbsForm.submit();
					*/
				}
				else if(response.code == 400)
				{
					alert("파라미터 값이 올바르지 않습니다.");
					$("#questionTitle").focus();
					$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
				}
				else
				{
					alert("게시물 등록 중 오류 발생");
					$("#questionTitle").focus();
					$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
				}
			},
			error:function(error)
			{
				icia.common.error(error);
				alert("게시물 등록 중 오류가 발생하였습니다.");
				$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
			}
			
		});
		
	});
	
	$("#btnList").on("click", function() {
		document.bbsForm.action = "/cs/csmain";
		document.bbsForm.submit();
	});
});

function previewImage(input) {
    var preview = document.getElementById('preview');
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            preview.src = e.target.result;
        }

        reader.readAsDataURL(input.files[0]);
    } else {
        preview.src = '#';
    }
}


</script>
</head>
<body>
	<form name="writeForm" id="writeForm" method="post" enctype="multipart/form-data">

	<div class="custom-radio-group" style="text-align: center;">

<input type="radio" id="category_1" name="questionCategory" class="custom-radio-input2" value="1" <c:if test='${questionCategory eq "1"}'>checked</c:if>>
<label for="category_1" class="custom-radio-label2">배송</label>

<input type="radio" id="category_2" name="questionCategory" class="custom-radio-input2" value="2" <c:if test='${questionCategory eq "2"}'>checked</c:if>>
<label for="category_2" class="custom-radio-label2">취소/교환</label>

<input type="radio" id="category_3" name="questionCategory" class="custom-radio-input2" value="3" <c:if test="${questionCategory eq '3'}">checked</c:if>>
<label for="category_3" class="custom-radio-label2">주문/결제</label>

<input type="radio" id="category_4" name="questionCategory" class="custom-radio-input2" value="4" <c:if test="${questionCategory eq '4'}">checked</c:if>>
<label for="category_4" class="custom-radio-label2">회원정보</label>
</div>
</br>
			<div style="display: flex; flex-direction: column; align-items: center;">
    <input type="text" name="questionTitle" id="questionTitle" maxlength="100" style="ime-mode: active; width: 100%; max-width: 800px; height: 40px;" class="title" placeholder="제목을 입력해주세요." required />
    <div class="form-group" style="width: 100%; max-width: 800px;">
        <textarea class="form-control" rows="15" name="questionContent" id="questionContent" style="ime-mode: active; width: 100%; height: 300px;" placeholder="내용을 입력해주세요" required></textarea>
    </div>
</div>

            <div class="form-group2" style="text-align: center;">
    <label for="profilePicture" style="font-size: 17px;"></label>
    <input type="file" id="profilePicture" name="profilePicture" style="display: inline-block; vertical-align: top;" onchange="previewImage(this);" />
   
</div>
		<div class="form-group row" style="text-align: center;">
			<div class="col-sm-12">
				<button type="button" id="btnWrite" class="btn btn-primary" title="저장">작성하기</button>
				<button type="button" id="btnList" class="btn btn-secondary" title="리스트">취소</button>
			</div>
		</div> 
	</form>
	  <form name="bbsForm" id="bbsForm" method="post">
		<input type="hidden" name="questionCategory" value="${questionCategory}" />
		<input type="hidden" name="searchValue" value="${searchValue}" /> 
		<input type="hidden" name="curPage" value="${curPage}" /> 
	</form>
</div>
</body>
</html>