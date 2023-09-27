<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<style>
*, ::after, ::before {
	box-sizing: unset;
}
.table-hover th, td{
	border: 1px solid #c4c2c2;
	text-align: center;
}
</style>
<script type="text/javascript">
$("document").ready(function(){
	
	$("a[name='userUpdate']").colorbox({
		iframe:true, 
		innerWidth:1235,
		innerHeight:400,
		scrolling:false,
		onComplete:function()
		{
			$("#colorbox").css("width", "1235px");
			$("#colorbox").css("height", "400px");
			$("#colorbox").css("border-radius", "10px");
		}		
	});
});

function fn_search()
{
	document.searchForm.action = "/admin/communityList";
	
	document.searchForm.submit();
}


function fn_boardUpdate(commuIdk, commuStatus)
{
    var confirmationMessage = "";
    
    if (commuStatus == "Y") {
        confirmationMessage = "게시글을 정지 하시겠습니까?";
    } else if (commuStatus == "N") {
        confirmationMessage = "게시글 정지를 해제 하시겠습니까?";
    }

    if (confirmationMessage !== "" && confirm(confirmationMessage))
    {
        $.ajax({
            type: "POST",
            url: "/admin/boardUpdate",
            data: {
            	commuIdk: commuIdk,
            	commuStatus: commuStatus
            },
            dataType: "JSON",
            beforeSend: function (xhr)
            {
                xhr.setRequestHeader("AJAX", "true");
            },
            success: function (response)
            {
                if (response.code == 0)
                {
                    alert("게시글이 정지 또는 정지 해제 되었습니다.");
                    location.href = "/admin/adminCommunity";
                }
                else if (response.code == 400)
                {
                    alert("파라미터 값이 올바르지 않습니다.");
                }
            },
            error: function (xhr, status, error)
            {
                icia.common.error(error);
            }
        });
    }
}


function fn_commentUpdate(commentIdk, commentStatus)
{
    var confirmationMessage = "";
    if (commentStatus == "Y") {
        confirmationMessage = "댓글을 정지 하시겠습니까?";
    } else if (commentStatus == "N") {
        confirmationMessage = "댓글 정지를 해제 하시겠습니까?";
    }

    if (confirmationMessage !== "" && confirm(confirmationMessage))
    {
        $.ajax({
            type: "POST",
            url: "/admin/commentUpdate",
            data: {
            	commentIdk: commentIdk,
            	commentStatus: commentStatus
            },
            dataType: "JSON",
            beforeSend: function (xhr)
            {
                xhr.setRequestHeader("AJAX", "true");
            },
            success: function (response)
            {
                if (response.code == 0)
                {
                    alert("댓글이 정지 또는 정지 해제 되었습니다.");
                    location.href = "/admin/adminCommunity";
                }
                else if (response.code == 400)
                {
                    alert("파라미터 값이 올바르지 않습니다.");
                }
            },
            error: function (xhr, status, error)
            {
                icia.common.error(error);
            }
        });
    }
}

</script>
</head>
<body>

    <%@ include file="/WEB-INF/views/include/adminNavigation.jsp" %>

	<div style="width:90%; margin:auto; margin-top:5rem;">
		<div style="display:flex; margin-bottom:0.8rem;">
			<h2 style="margin-right:auto; color: #525252;">게시글 관리</h2>
			<form class="d-flex" name="searchForm" id="searchForm" method="post" style="place-content: flex-end;">
				<select id="status" name="status" style="font-size: 1rem; width: 6rem; height: 3rem;">
					<option value="">상태</option>
					<option value="Y">정상</option>
					<option value="N">정지</option>
				</select>
				
				<select id="userSearch" name="userSearch" style="font-size: 1rem; width: 8rem; height: 3rem; margin-left:.5rem; ">
					<option value="">아이디 조회</option>
					<option value="1">회원아이디</option>
				</select>
				<input name="userValue" id="userValue" class="form-control me-sm-2" style="width:15rem; margin-left:.5rem;" type="text" value="">
									
				<select id="searchType" name="searchType" style="font-size: 1rem; width: 8rem; height: 3rem; margin-left:.5rem; ">
					<option value="">검색타입</option>
					<option value="1">글 제목</option>
					<option value="2">댓글 내용</option>
				</select>
				<input name="searchValue" id="searchValue" class="form-control me-sm-2" style="width:15rem; margin-left:.5rem;" type="text" value="">
	
				<a class="btn my-2 my-sm-0" href="javascript:void(0)" onclick="fn_search()" style="width:7rem; margin-left:.5rem; background-color: rgb(239, 239, 239); border-color:rgb(118, 118, 118);">조회</a>
				
			</form>
		</div>
		<div>
			<table class="table table-hover" style="border:1px solid #c4c2c2;">
				<thead style="border-bottom: 1px solid #c4c2c2;">
				<tr class="table-thead-main">
					<th scope="col" style="width:15%;">아이디</th>
					<th scope="col">제목</th>
					<th scope="col">내용</th>
					<th scope="col">등록일자</th>
					<th scope="col">수정일자</th>
					<th scope="col">삭제일자</th>
					<th scope="col">상태</th>
				</tr>
				</thead>
				
				<tbody>
				
			<c:if test="${!empty boardList}">
				<c:forEach items="${boardList}" var="boardList" varStatus="status">
		            <tr>
		                <td>${boardList.userId}</td>
		                <td>${boardList.commuTitle}</td>
		                <td>${boardList.commuContent}</td>
		                <td>${boardList.regDate}</td>
		                <td>${boardList.modDate}</td>
		                <td>${boardList.deleteDate}</td>
						<td><button onClick="fn_boardUpdate('${boardList.commuIdk}', '${boardList.commuStatus}')">${boardList.commuStatus}</button></td>
		            </tr>
		        </c:forEach>
		    </c:if>				
				
				
			
				
		


				</tbody>
			</table>
		</div>
	</div>
	
	
	<div style="width:90%; margin:auto; margin-top:5rem;">
		<div style="display:flex; margin-bottom:0.8rem;">
			<h2 style="margin-right:auto; color: #525252;">댓글 관리</h2>
		</div>
		<div>
			<table class="table table-hover" style="border:1px solid #c4c2c2;">
				<thead style="border-bottom: 1px solid #c4c2c2;">
				<tr class="table-thead-main">
					<th scope="col" style="width:15%;">아이디</th>
					<th scope="col">글번호</th>
					<th scope="col">내용</th>
					<th scope="col">등록일자</th>
					<th scope="col">수정일자</th>
					<th scope="col">삭제일자</th>
					<th scope="col">상태</th>
				</tr>
				</thead>
				
				<tbody>
				
			<c:if test="${!empty commentList}">
				<c:forEach items="${commentList}" var="commentList" varStatus="status">
		            <tr>
		                <td>${commentList.userId}</td>
		                <td>${commentList.commuIdk}</td>
		                <td>${commentList.commentContent}</td>
		                <td>${commentList.regDate}</td>
		                <td>${commentList.modDate}</td>
		                <td>${commentList.deleteDate}</td>
						<td><button onClick="fn_commentUpdate('${commentList.commentIdk}', '${commentList.commentStatus}')">${commentList.commentStatus}</button></td>
		            </tr>
		        </c:forEach>
		    </c:if>			
		    
		    

		

				</tbody>
				
			</table>

		</div>
	</div>	
</body>
</html>