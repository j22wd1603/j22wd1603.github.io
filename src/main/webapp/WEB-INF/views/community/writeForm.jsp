<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <style>
    
body { 
  	margin: 0px; padding: 0px;
    box-sizing: border-box;
}

  input{  box-shadow: 3px 3px 50px #e6e6e6;
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
    margin: 0;
   }
textarea{
    box-shadow: 3px 3px 50px #e6e6e6;
    border-radius: 20px;
    position: relative;
    display: inline-block;
    text-align: center;
    border: 1px solid #ccc;
    font: inherit;
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
    margin: 0;
}

select{

  	box-shadow: 3px 3px 40px #e6e6e6;
    border-radius: 10px;
    height:30px;
    position: relative;
    display: inline-block;
    border: 1px solid #ccc;
    font: inherit;
    border: 1px dashed #dbdbdb;
    color: #757575;
    font-size: 13px;
    font-weight: bold;
    -webkit-transition: .1s color;
    transition: .1s color;
    margin:0;
    margin-top:10px;


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
.btn-primary{
  	position: relative;
    left: 337px;
    display: inline-block;
    margin-top: 10px;
    padding: 10px 5px;
    font-size: 15px;
    background-color: #f0f0f0;
    border: 1px solid #ccc;
    border-radius: 4px;
    cursor: pointer;
    user-select: none;
}

.btn-secondary{
	position: relative;
    left: 340px;
    display: inline-block;
    margin-top: 10px;
    padding: 10px 5px;
    font-size: 15px;
    background-color: #f0f0f0;
    border: 1px solid #ccc;
    border-radius: 4px;
    cursor: pointer;
    user-select: none;
    color: #000000;


}
    </style>
<script type="text/javascript">
$(document).ready(function() {
    
	$("#hiBbsTitle").focus();
	
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
		
		var form = $("#writeForm")[0];
		var formData = new FormData(form);
		
		$.ajax({
			type:"POST",
			enctype:"multipart/form-data",
			url:"/community/writeProc",
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
					document.bbsForm.action = document.referrer;
					document.bbsForm.submit();
				}
				else if(response.code == 400)
				{
					alert("파라미터 값이 올바르지 않습니다.");
					$("#communityTitle").focus();
					$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
				}
				else
				{
					alert("게시물 등록 중 오류 발생");
					$("#communityTitle").focus();
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
	
	
	$("#btnSave").on("click", function() {
		$("#btnSave").prop("disabled", true);		//임시저장 버튼 비활성화
		
		
		if($("#communityFile").val() != "")
		{
			alert("첨부파일은 임시 저장할 수 없습니다.");
			
			$("#btnSave").prop("disabled", false);		//임시저장 버튼 활성화
			
			return;
		}		
		else if($.trim($("#communityTitle").val()).length <= 0 && $.trim($("#communityContent").val()).length <= 0 && $("#commuTab").val() == "")
		{
			alert("저장 할 내용이 없습니다.");
			
			$("#btnSave").prop("disabled", false);		//임시저장 버튼 활성화
			
			return;
		}
		
		$.ajax({
			type:"POST",
			url:"/community/saveProc",
		    data: {
			      communityTitle: $("#communityTitle").val(),
			      communityContent: $("#communityContent").val(),
			      commuTab: $("#commuTab").val()
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
					alert("임시저장이 등록 되었습니다.");
					document.bbsForm.action = document.referrer;
					document.bbsForm.submit();					
					
					/*
					document.bbsForm.action = "/board/list";
					document.bbsForm.submit();
					*/
				}
				else if(response.code == 400)
				{
					alert("파라미터 값이 올바르지 않습니다.");
					$("#communityTitle").focus();
					$("#btnSave").prop("disabled", false);		//임시저장 버튼 활성화
				}
				else if(reponse.code == 404)
				{
					alert("회원 정보 조회 중 오류 발생");	
					$("#btnSave").prop("disabled", false);		//임시저장 버튼 활성화
				}
				else
				{
					alert("임시 저장 중 오류 발생");
					$("#communityTitle").focus();
					$("#btnSave").prop("disabled", false);		//임시저장 버튼 활성화
				}
			},
			error:function(error)
			{
				icia.common.error(error);
				alert("임시 저장 중 오류가 발생하였습니다.");
				$("#btnSave").prop("disabled", false);		//임시저장 버튼 활성화
			}
			
		});

		
	});	
	
	
	
	$("#btnList").on("click", function() {
		document.bbsForm.action = document.referrer;
		document.bbsForm.submit();
	});
});
</script>    
    
</head>
<body>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<div class="container" style="width: 100%; max-width: 900px;">
	<h2  style="margin-top:40px;"">게시물 쓰기</h2>
	
	<c:choose>
		<c:when test="${community eq null}">
			<form name="writeForm" id="writeForm" method="post" enctype="multipart/form-data" style="width: 100%; max-width: 900px; margin: auto; ">
			
				<select name="commuTab" id=commuTab class="custom-select" style="width:110px;">
		            <option value="">게시판 고르기</option>
		            <option value="1" <c:if test='${commuTab eq "1"}'>selected</c:if>>마이룸 게시판</option>
		            <option value="2" <c:if test='${commuTab eq "2"}'>selected</c:if>>자유 게시판</option>
		            <option value="3" <c:if test="${commuTab eq '3'}">selected</c:if>>질문 게시판</option>
		         </select>	
			<div style="display: flex; flex-direction: column; align-items: center; width: 100%; max-width: 900px; margin: auto; margin-top: -10px;">
				<input type="text" name="userName" id="userName" maxlength="20" value="${user.userNickname}(${user.userId})" style="ime-mode:active;" class="form-control mt-4 mb-2" placeholder="이름을 입력해주세요." readonly />
				<input type="text" name="communityTitle" id="communityTitle" maxlength="100" style="ime-mode:active;" class="form-control mb-2" placeholder="제목을 입력해주세요." required />
					<textarea class="form-control" rows="10" name="communityContent" id="communityContent" style="ime-mode:active; height:300px; max-height:500px" placeholder="내용을 입력해주세요" required></textarea>
				
				<input type="file" multiple id="communityFile" name="communityFile" class="form-control mb-2" placeholder="파일을 선택하세요." required />
				</div>
				<div class="form-group row" style=" margin-bottom:30px;" >
					<div class="col-sm-12"style="width: 100%; max-width: 900px; position: relative; left: 350px;">
						<button type="button" id="btnWrite" class="btn-primary" title="저장">저장</button>
						<button type="button" id="btnList" class="btn-secondary" title="리스트">리스트</button>
						<button type="button" id="btnSave" class="btn-secondary" title="임시 저장">임시 저장</button>
					</div>
				</div>
			</form>		
		</c:when>
		
		<c:when test="${community ne null}">
			<form name="writeForm" id="writeForm" method="post" enctype="multipart/form-data">
			
			
				<select name="commuTab" id=commuTab class="custom-select" style="width:auto;">
		            <option value="">게시판 고르기</option>
		            <option value="1" <c:if test='${community.commuTab eq "1"}'>selected</c:if>>마이룸 게시판</option>
		            <option value="2" <c:if test='${community.commuTab eq "2"}'>selected</c:if>>자유 게시판</option>
		            <option value="3" <c:if test="${community.commuTab eq '3'}">selected</c:if>>질문 게시판</option>
		         </select>	
			
				<input type="text" name="userName" id="userName" maxlength="20" value="${community.userId}" style="ime-mode:active;" class="form-control mt-4 mb-2" placeholder="이름을 입력해주세요." readonly />
				<input type="text" name="communityTitle" id="communityTitle"  value="${community.commuTitle}" maxlength="100" style="ime-mode:active;" class="form-control mb-2" placeholder="제목을 입력해주세요." required / >
				<div class="form-group">
					<textarea class="form-control" rows="10" name="communityContent" id="communityContent" style="ime-mode:active;" placeholder="내용을 입력해주세요" required>${community.commuContent}</textarea>
				</div>
				<input type="file" id="communityFile" name="communityFile" class="form-control mb-2" placeholder="파일을 선택하세요." required />
				<div class="form-group row">
					<div class="col-sm-12">
						<button type="button" id="btnWrite" class="btn-primary" title="저장">저장</button>
						<button type="button" id="btnList" class="btn-secondary" title="리스트">리스트</button>
						<button type="button" id="btnSave" class="btn-secondary" title="임시 저장">임시 저장</button>
					</div>
				</div>
			</form>		
		</c:when>
	</c:choose>
	
	
	
	
	<form name="bbsForm" id="bbsForm" method="post">
		<input type="hidden" name="commuTab" value = "${commuTab}" />
		<input type="hidden" name="curPage" value="${curPage}"/>
		<input type="hidden" name="searchType" value="${searchType}" />
		<input type="hidden" name="searchValue" value="${searchValue}" />
		<input type="hidden" name="sortType" value="${sortType}" />
	</form>

</div>






</body>
</html>