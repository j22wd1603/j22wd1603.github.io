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

function fn_mySearch()
{
	document.myForm.commuIdk.value = "";
	document.myForm.searchValue.value = $("#_searchValue").val();
	document.myForm.curPage.value = "1";
	document.myForm.action = "/admin/adminCs";
	document.myForm.submit();
}

function fn_list(curPage)
{
	document.myForm.commuIdk.value = "";
	document.myForm.curPage.value = curPage;
	document.myForm.action = "/admin/adminCs";
	document.myForm.submit();
}

function fn_pageInit()
{
	$("#searchType option:eq(0)").prop("selected", true);
	$("#searchValue").val("");
	
	fn_search();		
	
	

}
function fn_boardDelete(userId, userStatus)
{
    var confirmationMessage = "";
    if (userStatus == "Y") {
        confirmationMessage = "회원을 정지 하시겠습니까?";
    } else if (userStatus == "N") {
        confirmationMessage = "회원 정지를 해제 하시겠습니까?";
    }

    if (confirmationMessage !== "" && confirm(confirmationMessage))
    {
        $.ajax({
            type: "POST",
            url: "/admin/userStatus",
            data: {
                userId: userId,
                userStatus: userStatus
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
                    alert("회원이 정지 또는 정지 해제 되었습니다.");
                    location.href = "/admin/adminCs";
                }
                else if (response.code == 400)
                {
                    alert("파라미터 값이 올바르지 않습니다.");
                }
                else if (response.code == 403)
                {
                    alert("본인글이 아니므로 삭제할 수 없습니다.");
                }
                else if (response.code == 404)
                {
                    alert("해당 게시물을 찾을 수 없습니다.");
                    location.href = "/user/mypage";
                }
                else if (response.code == -999)
                {
                    alert("답변 게시물이 존재하여 삭제할 수 없습니다.");
                }
                else
                {
                    alert("회원 상태 변경 중 오류가 발생하였습니다.");
                }
            },
            error: function (xhr, status, error)
            {
                icia.common.error(error);
            }
        });
    }
}
$(document).ready(function () {
    // question-link 클래스를 가진 링크가 클릭되었을 때
    $(".question-link").click(function (e) {
        e.preventDefault(); // 기본 링크 동작 방지

        var userId = $(this).data("userid"); // 클릭한 링크의 data-userid 속성 값 가져오기

        // userId를 사용하여 새로운 URL 생성
        var newUrl = "/admin/adminUser?userId=" + userId;

        // 새로운 URL로 페이지 이동
        window.location.href = newUrl;
    });
});
function filterUsers() {
    var selectedStatus = $("#statusFilter").val();
    
    $(".user-row").show(); // 모든 회원 행을 보여줍니다.
    
    if (selectedStatus === "active") {
        // 정상 상태인 회원만 표시
        $(".user-row[data-status='N']").hide();
    } else if (selectedStatus === "inactive") {
        // 정지 상태인 회원만 표시
        $(".user-row[data-status='Y']").hide();
    }
}
</script>
</head>
<body>

    <%@ include file="/WEB-INF/views/include/adminNavigation.jsp" %>

	<div style="width:90%; margin:auto; margin-top:5rem;">
		<div style="display:flex; margin-bottom:0.8rem;">
			<h2 style="margin-right:auto; color: #525252;">회원정보 관리</h2>
	
		</div>
		<div>
			<table class="table table-hover" style="border:1px solid #c4c2c2;">
				<thead style="border-bottom: 1px solid #c4c2c2;">
				<tr class="table-thead-main">
					<th scope="col" style="width:15%;">아이디</th>
					<th scope="col">이름</th>
					<th scope="col">이메일</th>
					<th scope="col">
					<select id="statusFilter" onchange="filterUsers()">
					    <option value="all">전체</option>
					    <option value="active">정상</option>
					    <option value="inactive">정지</option>
					</select>
					</th>
					<th scope="col">등록일</th>
				</tr>
				</thead>
				<tbody>
 <c:if test="${not empty list}">
      <c:forEach var="list" items="${list}" varStatus="loop">
    <tr class="user-row" data-status="${list.userStatus}">
        <th scope="row" class="table-thead-sub" style="border: 1px solid #c4c2c2;">
            <a href="#" class="question-link" data-userid="${list.userId}">${list.userId}</a>
        </th>
        <td>${list.userName}</td>
        <td>${list.userEmail}</td>
        <td><button onClick="fn_boardDelete('${list.userId}', '${list.userStatus}')">${list.userStatus}</button></td>
        <td>${list.regDate}</td>
    </tr>
</c:forEach>
        </c:if>
				<tr>
				<c:if test="${empty list}">
				    <td colspan="5">등록된 회원정보가 없습니다.</td>
				    </c:if>
				    
				</tr>	
		
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>