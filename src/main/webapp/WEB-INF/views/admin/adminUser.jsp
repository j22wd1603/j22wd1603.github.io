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
#noticeDetail {
    margin: 10 auto; /* 수평 가운데 정렬 */
    position: fixed; /* 요소를 고정 */
    right: 0; /* 화면 오른쪽에 고정 */
    width: 500px; /* 요소의 너비를 조정하세요 */
    background-color: white; /* 배경색을 원하는 색상으로 설정하세요 */
    padding: 10px; /* 내용과의 간격 설정 */
}
.custom-button {
  background-color: #9E0E0B; /* 배경색 */
  color: white; /* 텍스트 색상 */
  border: none; /* 테두리 제거 */
  border-radius: 5px; /* 둥근 테두리 */
  padding: 7px 10px; /* 안쪽 여백 */
  font-size: 8px; /* 글꼴 크기 */
  cursor: pointer; /* 포인터 커서 */
  transition: background-color 0.3s ease; /* 배경색 전환 효과 */
}

.custom-button:hover {
  background-color: #9E0E0B; /* 마우스 오버 시 배경색 변경 */
}
 .custom-hr {
    width: 80%; /* 선의 너비를 조절할 수 있습니다. */
    margin: 0 auto; /* 가운데 정렬을 위해 사용합니다. */
  }
.table-container {
    width: 100%;
    overflow-x: auto;
}

.table {
    border: 1px solid #c4c2c2;
    width: 100%;
    white-space: nowrap; /* 텍스트 줄 바꿈 방지 */
}

/* 화면 크기가 768px 이하일 때 스타일 변경 */
@media screen and (max-width: 768px) {
    .table-container {
        overflow-x: hidden; /* 스크롤바 감춤 */
    }
}
.table-cell {
    max-width: 300px; /* 원하는 최대 길이로 조절하세요 */
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>

<script type="text/javascript">
$("document").ready(function(){
	var checkValue = "";

	 $("#showTable1Button").click(function() {
	        $("#table1").show();
	        $("#table2").hide();
	        $("#btnReply").hide(); 
	        $("#noticeDetail").hide();
	        $("#deleteButton").hide();

	    });

	    $("#showTable2Button").click(function() {
	        $("#table1").hide();
	        $("#table2").show();
	        $("#btnReply").show(); 
	        $("#noticeDetail").show();
	        $("#deleteButton").show();

	        

	    });
	   $("#btnReply").on("click", function() {
			document.bbsForm.action = "/admin/noticeWrite";
			document.bbsForm.submit();
	   });
	
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
    }else if (userStatus == "D") {
        confirmationMessage = "회원을 복귀 시킵니다.";
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
                    alert("회원이 정지 또는 정지 해제 또는 복귀 되었습니다.");
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
        var newUrl = "/admin/adminCs?userId=" + userId;

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

function fn_view(noticeIdk) {
    $.ajax({
        type: "GET",
        url: "/admin/getNoticeDetail", // 서버에서 공지사항 데이터를 가져올 API 엔드포인트 설정
        data: { noticeIdk: noticeIdk }, // noticeIdk를 서버에 전달
        dataType: "json",
        success: function (response) {
            if (response.success) {
                // 서버로부터 데이터를 성공적으로 가져왔을 때
                var noticeTitle = response.noticeTitle;
                var noticeContent = response.noticeContent;

                // 가져온 데이터를 화면 오른쪽에 표시
                $("#noticeTitle").text(noticeTitle);
                $("#noticeContent").text(noticeContent);
            } else {
                alert("데이터를 가져오는데 실패했습니다.");
            }
        },
        error: function () {
            alert("서버와의 통신 중 오류가 발생했습니다.");
        }
    });
}
function deleteValue()
{
    var userId = $("#deleteUserId").val();
    var checkValue = "";
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
        alert("선택된 글이 없습니다.");
    }
    else{

	    if (confirm("삭제 하시겠습니까?") == true) {
	        $.ajax({
	            type: 'POST',
	            url: '/admin/noticeDelete',
	            data: {
	            	noticeIdk: checkValue
	            },
	            dataType: "json",
	            beforeSend: function (xhr) {
	                xhr.setRequestHeader("AJAX", "true");
	            },
	            success: function (response) {
	                if (response.code == 0) {
	                    alert("공지사항이 삭제되었습니다.");                 
	                } else if (response.code == 500) {
	                    alert("삭제 중 오류가 발생했습니다.");
	                } else {
	                    alert("알 수 없는 오류가 발생했습니다.");
	                }
	            },
	            error: function (xhr, status, error) {
	                alert("삭제 중 오류 발생: " + error);
	            }
	        });
	    }
    }
}
</script>
</head>
<body>
	<div style="width:90%; margin:auto; margin-top:5rem;">
   <div style="display:flex; justify-content: space-between; align-items: center; margin-bottom: 0.8rem;">
        <h2 style="margin: 0; color: #525252;">유저 관리</h2>
        <div class="button-group">
            <button id="showTable1Button">회원관리</button>
            <button id="showTable2Button">공지사항</button>
        </div>
    </div>
		<div>
		<div style="width: 90%;">
			<table  id="table1" class="table table-hover" style="border:1px solid #c4c2c2;">
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
        <td><button class="btn custom-button" onClick="fn_boardDelete('${list.userId}', '${list.userStatus}')">${list.userStatus}</button></td>
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
			    <button type="button" id="btnReply" class="btn btn-secondary" style="display: none;">글쓰기</button>
				<button id="deleteButton" onClick="deleteValue()"class="btn btn-secondary"  style="display: none;">삭제</button>
			
		</div>
		
		
		
		
		<div style="width: 50%; float: left;" class="table-container">
		<table id="table2" style="display: none;" class="table table-hover" style="border:1px solid #c4c2c2;">
      <thead>
      <tr>
      <th class="select-checkbox" style="width:30%">
      <label for="selectAllCheckbox" style="font-size: 5px;">전체<br>선택</label><br>
         <input type="checkbox" id="selectAllCheckbox">
     </th>
         <th scope="col" class="text-center" style="width:10%; font-size: 13px;">번호</th>
         <th scope="col" class="text-center" style="width:25%">제목</th>
         <th scope="col" class="text-center" style="width:15%">날짜</th>
      </tr>
      </thead>
      <tbody>

<c:if test="${!empty list2}">   
   <c:forEach var="cs" items="${list2}">   
      <tr>
      <td class="select-checkbox">
       <input type="checkbox" class="productCheckbox" name="selectedProduct" value="${cs.noticeIdk}">
      </td>
      <td>${cs.noticeIdk}</td>
            <td class="table-cell">
            <a href="javascript:void(0)" onclick="fn_view(${cs.noticeIdk})">
				<c:out value="${cs.noticeTitle}" />
            </a>
            </td>
         
         <!-- td class="text-center">${cs.noticeTitle}</td> -->
         <td>${cs.regDate}</td>
         
      </tr>
   </c:forEach>
</c:if>
      
      </tbody>
      <tfoot>

      </tfoot>
   </table>
	</div>
	 
	
	</div>
	<form name="bbsForm" id="bbsForm" method="post">
   <input type="hidden" name="questionIdk" value="${questionIdk}" />
</form>

<div id="noticeDetail" style="display: none;">
    <h3 id="noticeTitle" style="text-align: center;"></h3>
    <hr class="custom-hr">
    <p id="noticeContent" style="text-align: center; width: 80%; margin-right: 0; padding-left: 40px;"></p>
</div>
    

</body>
</html>