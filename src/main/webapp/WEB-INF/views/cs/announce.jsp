<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
<style>
body {
  background: #ffffff
}


*{
font-family: 'Gothic A1', sans-serif;
}

table {
  border: 1px #a39485 solid;
  position: relative;
  box-shadow: 3px 3px 50px #e6e6e6;
  width: 100%;
  border-collapse: collapse;
  border-radius: 20px;
  overflow: hidden;
  text-align: center;
  font-size: 13px;
  font-weight: bold;
  transition: .1s color;
  margin: auto;
  border: 1px dashed #dbdbdb;
  color: #757575;
}

.container{

  padding:1.5em;
  
 }

th {
  text-align: left;
}
  
thead {
  font-weight: bold;
  color: #fff;
  background: #8b1411;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
  
  .input-styling {
  border: 1px solid #ccc; /* 테두리 스타일 및 색상 설정 */
  border-radius: 4px; /* 테두리의 모서리를 둥글게 만듭니다. */
  padding: 5px 10px; /* 내부 여백 설정 */
  font-size: 16px; /* 글꼴 크기 설정 */
  width: auto; /* 너비 자동 조정 */
  ime-mode: active; /* 입력기 설정 */
}

/* 포커스 시 스타일 */
.input-styling:focus {
  outline: none; /* 포커스 효과 제거 */
  border-color: #007bff; /* 포커스 시 테두리 색상 변경 (예: 파란색) */
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* 포커스 시 그림자 효과 추가 */
}
.custom-select.custom-styled {
  /* 여기에 원하는 스타일을 추가하세요 */
  width: auto;
  font-family: 'Noto Sansf KR', sans-serif;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #444;
  background-color: #fff;
  padding: 0.6em 1.4em 0.5em 0.8em;
  margin: 0;
  border: 1px solid #aaa;
  border-radius: 0.5em;
  box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
  margin-right: 5px; /* select 박스 오른쪽 여백 설정 */
  margin-bottom: 5px; /* 
  float: right;
}

a{    
	text-align: left;
}

</style>


<script type="text/javascript">
$(document).ready(function() {
    
   $("#btnWrite").on("click", function() {
      document.bbsForm.noticeIdk.value = "";
      document.bbsForm.action = "/board/writeForm";
      document.bbsForm.submit();
   });
   
   $("#btnSearch").on("click", function() {
      document.bbsForm.noticeIdk.value = "";
      document.bbsForm.searchType.value = $("#_searchType").val();
      document.bbsForm.searchValue.value = $("#_searchValue").val();
      document.bbsForm.curPage.value = "1";
      document.bbsForm.action = "/cs/announce";
      document.bbsForm.submit();
   });
});

function fn_view(bbsSeq)
{
   document.bbsForm.noticeIdk.value = bbsSeq;
   document.bbsForm.action = "/cs/announceDetail";
   document.bbsForm.submit();
}

function fn_list(curPage)
{
   document.bbsForm.noticeIdk.value = "";
   document.bbsForm.curPage.value = curPage;
   document.bbsForm.action = "/cs/announce";
   document.bbsForm.submit();
}


</script>
</head>
<body>
<main>
<div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h2 class="display-1 text-white animated slideInDown"><a class="text-white" href="/community/blog">공지사항</a></h2>
        </div>
    </div>
</main>
<div class="container" >
    <div class="ml-auto input-group justify-content-end" style="margin-bottom: 30px;   line-height : center;" >
         <select name="_searchType" id="_searchType" class="custom-select custom-styled" style="width:auto; border: 1px solid #ccc; margin-right: 2px; text-align: center; padding: 10px ;
    margin-bottom: 15px; border: 1px solid #999; border-radius: 10px; font-size: 16px;">
            <option value="">조회 항목</option>
            <option value="1" <c:if test='${searchType eq "1"}'>selected</c:if>>제목</option>
            <option value="2" <c:if test='${searchType eq "2"}'>selected</c:if>>내용</option>
         </select> 
         <input type="text" name="_searchValue" id="_searchValue" value="${searchValue}" class="input-styling" maxlength="20" style="width:auto; ime-mode:active; border: 1px solid #ccc; text-align: center; width:auto; border: 1px solid #ccc; text-align: center; padding: 10px;
    margin-bottom: 15px; border: 1px solid #999; border-radius: 10px; font-size: 16px;" placeholder="조회값을 입력하세요." />
         <button type="button" id="btnSearch" class="btn btn-secondary mb-3 mx-1" style="padding: 10px 15px 10px 15px;
    margin-left: auto; margin-right: auto;
    border-radius: 10px;
    top : 1px;
    height: 50px;
    background-color: #8b1411;
    color: #fff;
    font-size: 13px;
    font-weight: bold;
    -webkit-transition: .1s color;
    transition: .1s color;
     border:none;">조회</button>
   </div>
   <table>
      <thead>
      <tr>
         <th scope="col" class="text-center" style="width:10%">번호</th>
         <th scope="col" class="text-center" style="width:55%">제목</th>
         <th scope="col" class="text-center" style="width:15%">날짜</th>
      </tr>
      </thead>
      <tbody>

<c:if test="${!empty list}">   
   <c:forEach var="cs" items="${list}">   
      <tr>
      
      <td class="text-center">${cs.noticeIdk}</td>
            <td class="text-center">
            <a href="javascript:void(0)" onclick="fn_view(${cs.noticeIdk})">
				<c:out value="${cs.noticeTitle}" />
            </a>
            </td>
         
         <!-- td class="text-center">${cs.noticeTitle}</td> -->
         <td class="text-center">${cs.regDate}</td>
         
      </tr>
   </c:forEach>
</c:if>
      
      </tbody>
      <tfoot>
      <tr>
            <td colspan="5"></td>
        </tr>
      </tfoot>
   </table>
   <br/>
   <nav>
      <ul class="pagination justify-content-center">
<c:if test="${!empty paging}">      
   <c:if test="${paging.prevBlockPage gt 0}">
         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})">이전블럭</a></li>
   </c:if>
   
   <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
      <c:choose>
         <c:when test="${i ne curPage}">
         <li class="page-item" style="background: none;"><a class="page-link" style="border-radius: 10px; " href="javascript:void(0)" onclick="fn_list(${i})">${i}</a></li>
         </c:when>
         <c:otherwise>
         <li class="page-item active" ><a class="page-link" style="  background: none; border-radius: 10px;" href="javascript:void(0)" style="cursor:default;">${i}</a></li>
         </c:otherwise>
      </c:choose>
   </c:forEach>
   
   <c:if test="${paging.nextBlockPage gt 0}">
         <li class="page-item"   style="background: none;"><a class="page-link" style="border-radius: 10px;  background-color: none;" href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})">다음블럭</a></li>
         
   </c:if>
</c:if>
      </ul>
   </nav>
   <form name="bbsForm" id="bbsForm" method="post">
      <input type="hidden" name="noticeIdk" value="" />
      <input type="hidden" name="searchType" value="${searchType}" />
      <input type="hidden" name="searchValue" value="${searchValue}" />
      <input type="hidden" name="curPage" value="${curPage}" />
   </form>
</div>
</body>
</html>