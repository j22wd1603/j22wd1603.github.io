
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<%@ include file="/WEB-INF/views/include/userNavigation.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/293152e236.js" crossorigin="anonymous"></script>
<style>

* {
    font-family: 'Gothic A1', sans-serif;
}



</style>

<style>
.layout>* {
    -webkit-box-flex: 0;
    -webkit-flex: 0 0 auto;
    -moz-box-flex: 0;
    -moz-flex: 0 0 auto;
    -ms-flex: 0 0 auto;
    flex: 0 0 auto;
}

.userInfo.container {
	width:70%
    position: relative;
     margin-right: auto;
    margin-left: auto;
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.2);
    padding: 100px;
    color: #292929;
}
@media (min-width: 1024px){
.container {
    margin-right: auto;
    margin-left: auto;
    width: calc(100% - 120px);
    max-width: 100%;
    box-sizing: border-box;
    min-height: 1px;
    }
}
@media (min-width: 768px) {
.container {
    margin-right: auto;
    margin-left: auto;
    width: calc(100% - 80px);
    max-width: 100%;
    box-sizing: border-box;
    min-height: 1px;
    }
}
@media (min-width: 375px){
.container {
    margin-right: auto;
    margin-left: auto;
    width: calc(100% - 30px);
    max-width: 100%;
    box-sizing: border-box;
    min-height: 1px;
}}
.container {
    margin-right: auto;
    margin-left: auto;
    width: calc(100% - 30px);
    max-width: 100%;
    box-sizing: border-box;
    min-height: 1px;
}
blockquote, body, code, dd, div, dl, dt, fieldset, h2, h3, h4, h5, h6, input, legend, li, ol, p, pre, td, textarea, th, ul {
    margin: 0;
    padding: 0;
}
.layout>* {
    -webkit-box-flex: 0;
    -webkit-flex: 0 0 auto;
    -moz-box-flex: 0;
    -moz-flex: 0 0 auto;
    -ms-flex: 0 0 auto;
    flex: 0 0 auto;
}
div {
    display: block;
}
.layout {
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-direction: normal;
    -webkit-box-orient: vertical;
    -webkit-flex-direction: column;
    -moz-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
}
.userInfoheader {
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    -moz-align-items: center;
    align-items: center;
    margin-bottom: 60px;
    position: relative;
    left: 70px;
}

@media (min-width: 768px){
body, html {
    font-size: 15px;
    }
}

body, html {
    line-height: 1;
   }
.userInfoheader_title {
    font-size: 30px;
    font-weight: 900;
    -webkit-box-flex: 1;
    -webkit-flex: 1 0 0px;
    -moz-box-flex: 1;
    -moz-flex: 1 0 0px;
    -ms-flex: 1 0 0px;
    flex: 1 0 0px;
}

.userInfo_form{
	
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;

}

.userInfo_form_title {
    padding-top: 30px;
    width: 100px;
}

@media (max-width: 767px){
.userInfo_form_group {
    max-width: 100%;
    }
}

.form-control{
  border-radius: 3px; /* 모서리를 둥글게 하는 부분입니다. */
   width: 100%;
    padding: 10px;
    border: 1px solid #cccccc;
    border-radius: 3px;
    background-color: #ffffff;
  }
.userInfo_form_group {
    max-width: 400px;
    -webkit-box-flex: 1;
    -webkit-flex: 1 0 0px;
    -moz-box-flex: 1;
    -moz-flex: 1 0 0px;
    -ms-flex: 1 0 0px;
    flex: 1 0 0px;
    border-radius: 20px; /* 모서리를 둥글게 하는 부분입니다. */
    box-shadow: 5px 5px 15px #333333; /* 그림자 효과를 추가합니다. */
}
.expert-form-group {
    padding: 20px 0;
}

.edit_userInfo{

	position: relative;

}
.email-input {
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
}
.button-color-blue{
    width: 100%;
    margin-top: 20px;
    display: block;
    margin-right: auto;
    margin-left: auto;
    width: 300px; 
    display: block;
    padding: 11px 10px;
    font-size: 15px;
    line-height: 26px;
    background-color: #a5a5a5;
    border-color: #a5a5a5;
    color: #fff;
    border-radius: 5px; /* 모서리를 둥글게 하는 부분입니다. */
    
    

}


.image-single-input_entry_button {
    -moz-user-select: -moz-none;
    -khtml-user-select: none;
    -webkit-user-select: none;
    -ms-user-select: none;
    user-select: none;
    display: inline-block;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    border: 1px solid transparent;
    background: none;
    font-family: inherit;
    font-weight: 700;
    text-decoration: none;
    text-align: center;
    transition: color .1s,background-color .1s,border-color.1s;
    border-radius: 4px;
    cursor: pointer;
 }
 
@media (max-width: 767px){
.button-color-blue {
    width: 100%;
    margin: 20px 0px 0px 20px;
    display: block;
    margin-right: auto;
    margin-left: auto;
    width: 350px; 
    display: block;
    }
}
.form-check-group, .form-control, .form-radio-group, .input-group {
    -webkit-box-flex: 1;
    -webkit-flex: 1 0 auto;
    -moz-box-flex: 1;
    -moz-flex: 1 0 auto;
    -ms-flex: 1 0 auto;
    flex: 1 0 auto;
}

.email-input_omain, .email-input_local {
    position: relative;
    -webkit-box-flex: 1;
    -webkit-flex: 1 1 0px;
    -moz-box-flex: 1;
    -moz-flex: 1 1 0px;
    -ms-flex: 1 1 0px;
    flex: 1 1 0px;
}

label {
    cursor: default;
}


.expert-form-group.userInfo_form-item__group .form-control {
    text-align: left;
   
}

.email-input_domain .form-control-blind, .email-input_local .form-control-blind {
    overflow: hidden;
    position: absolute;
    width: 1px;
    height: 1px;
    white-space: nowrap;
}

.email-input_separator {
    -webkit-box-flex: 0;
    -webkit-flex: 0 0 20px;
    -moz-box-flex: 0;
    -moz-flex: 0 0 20px;
    -ms-flex: 0 0 20px;
    flex: 0 0 20px;
    text-align: center;
    line-height: 40px;
    color: #dbdbdb;
}

.edit_userInfo_form {

    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
}

.edit_userInfo_form_title {

    padding-top: 30px;
    width: 170px;
    text-align : left;
}

@media (max-width: 767px){
.edit_userInfo_form_group {
    max-width: 100%;
    }
}
.edit_userInfo_form_group {
    max-width: 350px;
    -webkit-box-flex: 1;
    -webkit-flex: 1 0 0px;
    -moz-box-flex: 1;
    -moz-flex: 1 0 0px;
    -ms-flex: 1 0 0px;
    flex: 1 0 0px;
}
.edit_userInfo_input {
    width: 100%;
    max-width: 100%;
}


@media (max-width: 767px){
.edit_userInfo_input_error {
    margin-bottom: 64px;
    }
}
.edit_userInfo_input_error {
    margin: 15px 0;
    color: #f77;
}	

.layout>* {
    -webkit-box-flex: 0;
    -webkit-flex: 0 0 auto;
    -moz-box-flex: 0;
    -moz-flex: 0 0 auto;
    -ms-flex: 0 0 auto;
    flex: 0 0 auto;
}
blockquote, body, code, dd, div, dl, dt, fieldset, h1, h2, h3, h4, h5, h6, input, legend, li, ol, p, pre, td, textarea, th, ul {
    margin: 0;
    padding: 0;
}
* {
    -webkit-tap-highlight-color: rgba(255,255,255,0);
    -webkit-tap-highlight-color: rgba(0,0,0,0);
}
user agent stylesheet
div {
    display: block;
}

body, html {
    line-height: 1;
    font-size: 13px;
}

.email-input_domain, .email-input_local {
    position: relative;
    -webkit-box-flex: 1;
    -webkit-flex: 1 1 0px;
    -moz-box-flex: 1;
    -moz-flex: 1 1 0px;
    -ms-flex: 1 1 0px;
    flex: 1 1 0px;
} 


.image-single-input {
    display: block;
    padding-top: 10px;
}

ol, ul {
    list-style: none;
}

.image-single-input_entry, .image-single-input_pending, .image-single-input_upload {
    display: block;
    margin: 0 0 10px;
}

#preview:hover {
  border: 2px solid ; /* 마우스 호버 상태에서 테두리 스타일 변경 */
  cursor: pointer; /* 커서 모양 변경 */
}

.input_separator{
    -webkit-box-flex: 0;
    -webkit-flex: 0 0 20px;
    -moz-box-flex: 0;
    -moz-flex: 0 0 20px;
    -ms-flex: 0 0 20px;
    flex: 0 0 20px;
    text-align: center;
    line-height: 40px;
    color: #dbdbdb;
}

.email-input {
	max-width: 400px;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
}

.card {
    box-shadow: 3px 3px 50px #e6e6e6;
    position: relative;
    display: inline-block;
    border-radius: 20px;
    text-align: center;
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
    padding : 60px;
    border-radius: 20px;
    width:90%;
}
</style>
<script type="text/javascript">
$(document).ready(function() {

   $("#userId").focus();
  var phoneNumber = "${user.userPhone}";

// 전화번호를 3, 4, 4 형식으로 분리
var phone1 = phoneNumber.substring(0, 3);
var phone2 = phoneNumber.substring(3, 7);
var phone3 = phoneNumber.substring(7, 11);

// 각각의 <input> 요소에 값을 할당
document.getElementById("phone1").value = phone1;
document.getElementById("phone2").value = phone2;
document.getElementById("phone3").value = phone3;

   $("#btnReg").on("click", function() {
      
      //공백체크
      var emptCheck = /\s/g;
      //영문 대소문자, 숫자로만 이루어진 4~12자리 정규식
      var idPwCheck = /^[a-zA-Z0-9]{4,12}$/;
      
      
      if($.trim($("#userPwd1").val()).length <= 0)
      {
         alert("비밀번호를 입력하세요.");
         $("#userPwd1").val("");
         $("#userPwd1").focus();
         return;
      }
      
      if(!idPwCheck.test($("#userPwd1").val()))
      {
         alert("비밀번호는 영문 소문자와 숫자로 4~12자리 입니다.");
         $("#userPwd1").val("");
         return;
      }
      
      if($("#userPwd1").val() != $("#userPwd2").val())
      {
         alert("비밀번호가 일치하지 않습니다.");
         $("#userPwd2").focus();
         return;
      }
      if($.trim($("#userNickname").val()).length <= 0)
      {
         alert("사용자 닉네임을 입력하세요.");
         $("#userNickname").val("");
         $("#userNickname").focus();
         return;
      }

      if(emptCheck.test($("#userNickname").val()))
      {
         alert("사용자 닉네임은 공백을 포함할수 없습니다.");
         $("#userNickname").focus();
         return;
      }
      
      
      if($.trim($("#userName").val()).length <= 0)
      {
         alert("사용자 이름을 입력하세요.");
         $("#userName").val("");
         $("#userName").focus();
         return;
      }
      
      if(!fn_validateEmail($("#userEmail").val()))
      {
         alert("사용자 이메일 형식이 올바르지 않습니다.");
         $("#userEmail").focus();
         return;
      }
      
      if($.trim($("#phone1").val()).length <= 0)
      {
         alert("전화번호를 입력하세요.");
         $("#phone1").val("");
         $("#phone1").focus();
         return;
      }
      
      if($.trim($("#phone2").val()).length <= 0)
      {
         alert("전화번호를 입력하세요.");
         $("#phone2").val("");
         $("#phone2").focus();
         return;
      }
      
      if($.trim($("#phone3").val()).length <= 0)
      {
         alert("전화번호를 입력하세요.");
         $("#phone3").val("");
         $("#phone3").focus();
         return;
      }
      
      //전화번호 조합
      $("#userPhone").val($("#phone1").val() + $("#phone2").val() + $("#phone3").val());
      

      
      $("#userPwd").val($("#userPwd1").val());
      
      //아이디 중복체크 aJax
      
         var form = $("#regForm")[0];
   var formData = new FormData(form);
   
   $.ajax({
      type:"POST",
      enctype:"multipart/form-data",
      url:"/user/updateProc",
      data:formData,
      processData:false,            //formData를 string으로 변환하지 않음
      contentType:false,            //content-type헤더가 multipart/form-data로 전송
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
               alert("회원 정보가 수정 되었습니다.");
               location.href = "/";
            }
            else if(response.code == 400)
            {
               alert("파라미터 값이 올바르지 않습니다.");
               $("#userId").focus();
            }
            else if(response.code == 500)
            {
               alert("회원 가입 중 오류가 발생하였습니다.");
               $("#userId").focus();
            }
            else
            {
               alert("회원 가입 중 오류가 발생하였습니다.");
               $("#userId").focus();
            }
      },
      error:function(error)
      {
         icia.common.error(error);
         alert("게시물 등록 중 오류가 발생하였습니다.");
         $("#btnWrite").prop("disabled", false);      //글쓰기 버튼 활성화
      }
      
   });
     


   });
}); 



function fn_validateEmail(value)
{
   var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
   
   return emailReg.test(value);
}

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



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    function setInputAddress() {
        var postcode = document.getElementById("sample6_postcode").value;
        var address = document.getElementById("sample6_address").value;
        var detailAddress = document.getElementById("sample6_detailAddress").value;
        var extraAddress = document.getElementById("sample6_extraAddress").value;

        // 주소 정보 조합
        var fullAddress = address;
        if (extraAddress !== '') {
            fullAddress += extraAddress;
        }
        if (detailAddress !== '') {
            fullAddress += ' ' + detailAddress;
        }

        // 사용자 주소 필드에 설정
        document.getElementById("userAddress").value = fullAddress;
    }
</script>


</head>
<body>
	<div class="layout">
	<div class="userInfo container">
	
		<div class="userInfoheader">
		 <div class="userInfoheader_title">회원정보수정</div>
		 </div>
		 <div class="card">
    <form>
    	<div class="userInfo_form">
    	<div class="edit_userInfo_form_title">이메일
    	  </div>
    	  <div class="expert-form-group edit_userInfo_form_group">
    	   <div class="expert-form-group_content">
    	    <div class="expert-form-group_input">
    	 	  <div class="edit_userInfo">
	    	 	  <div class="edit_userInfo_input">
	    	 	    <input type="text"  value="${user.userEmail}" class="form-control"  id="userEmail" name="userEmail" maxlength="30" >
	    	 	    <div class="edit_userInfo_input_error"></div>
    	 		  </div>
 			  </div>
    		</div>
    	   </div>
    	  </div>
    	 </div>
    	 
    	 <div class="edit_userInfo_form">
    	  <div class="edit_userInfo_form_title">별명
    	  </div>
    	  <div class="expert-form-group edit_userInfo_form_group">
    	   <div class="expert-form-group_content">
    	    <div class="expert-form-group_input">
    	 	  <div class="edit_userInfo">
	    	 	  <div class="edit_userInfo_input">
	    	 	    <input type="text" id="userNickname" name="userNickname" value="${user.userNickname}" class="form-control" placeholder="닉네임" maxlength="15">
	    	 	    <div class="edit_userInfo_input_error"></div>
    	 		  </div>
 			  </div>
    		</div>
    	   </div>
    	  </div>
    	 </div>
    	<div class="edit_userInfo_form">
    	<div class="edit_userInfo_form_title">비밀번호</div>
    	<div class="expert-form-group edit_userInfo_form_group">
    	<div class="expert-form-group_content">
    	 <div class="expert-form-group_input">
    	  <div class="edit_userInfo">
    	     <input type="password" value="${user.userPwd}" id="#userPwd1" name="userPwd1" class="form-control">
    	     </div>
    	    </div>
    	   </div>
    	  </div>
    	 </div>
    	<div class="edit_userInfo_form">
    	<div class="edit_userInfo_form_title">비밀번호 확인</div>
    	<div class="expert-form-group edit_userInfo_form_group">
    	<div class="expert-form-group_content">
    	 <div class="expert-form-group_input">
    	  <div class="edit_userInfo">
    	     <input type="password" value="${user.userPwd}" id="userPwd2" class="form-control" id="userPwd2" name="userPwd2" placeholder="비밀번호 확인" maxlength="12" >
    	     </div>
    	    </div>
    	   </div>
    	  </div>
    	 </div>
    	<div class="edit_userInfo_form">
    	<div class="edit_userInfo_form_title">사용자 이름</div>
    	<div class="expert-form-group edit_userInfo_form_group">
    	<div class="expert-form-group_content">
    	 <div class="expert-form-group_input">
    	  <div class="edit_userInfo">
    	     <input type="text" value="${user.userName}" id="userName" name="userName" class="form-control" placeholder="사용자 이름" maxlength="15">
    	     </div>
    	    </div>
    	   </div>
    	  </div>
    	 </div>
    	<div class="edit_userInfo_form">
    	<div class="edit_userInfo_form_title">전화번호</div>
    	<div class="expert-form-group edit_userInfo_form_group">
    	<div class="expert-form-group_content">
    	 <div class="expert-form-group_input">
    	  <div class="edit_userInfo">
    	   <div class="input-group email-input">
    	     <span><input id="phone1" type="text" class="form-control" size="7px" maxlength="3"></span>
    	     <span class="input_separator">-</span>
    	     <span><input id="phone2" type="text" class="form-control" size="9px" maxlength="4"></span>
    	     <span class="input_separator">-</span>
    	     <span><input id="phone3" type="text" class="form-control" size="9px" maxlength="4" ></span>
    	     </div>
    	     </div>
    	    </div>
    	   </div>
    	  </div>
    	 </div>
    	 <div class="edit_userInfo_form">
	    	<div class="edit_userInfo_form_title">프로필 이미지</div>
	    	<div class="expert-form-group edit_userInfo_form_group">
	    	<div class="expert-form-group_content">
	    	 <div class="expert-form-group_input">
	    	  <div class="edit_userInfo_profile">
	    	   <div class="image-single-input-wrap">
	    	    <ul class="image-single-input">
	    	     <li class="image-single-input_entry">
	    	     <img id="preview" src="/resources/images/profile/${user.userId}.${user.imageFileExt}" style="width: 200px; height: 200px;" class="image-single-input_entry_button" onclick="document.getElementById('profilePicture').click();" />
					<input type="file" accept="image/*" id="profilePicture" name="profilePicture" style="display: none;" onchange="previewImage(this);">
	    	     
	    	    </div>
	    	  </div>
	    	 </div>
	    	</div>
	    	</div>
    	</div>
    	
    	<div class="edit_userInfo_form">
    	<div class="edit_userInfo_form_title">사용자 주소</div>
    	<div class="expert-form-group edit_userInfo_form_group">
    	<div class="expert-form-group_content">
    	 <div class="expert-form-group_input">
    	  <div class="edit_userInfo">
    	     <input value="${user.userAddress}" id="userName" class="form-control"  maxlength="30" >
    	     <input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호">
               <input type="button" onclick="sample6_execDaumPostcode()" class="form-control" value="우편번호 찾기"><br>
               <input class="form-control" id="sample6_address" placeholder="주소"><br>
               <input class="form-control" id="sample6_detailAddress" placeholder="상세주소">
               <input class="form-control" id="sample6_extraAddress" placeholder="참고항목">
                     <!-- 입력 완료 버튼 -->
                <input type="button" class="form-control" onclick="setInputAddress()"  style="display: block; margin: 0 auto;" value="입력 완료">
 
            </div>
    	    </div>
    	   </div>
    	  </div>
    	 </div>
    	 <button type="" class="button-color-blue" id="btnReg" >변경하기</button>
    </form>

</div>
 
          
       
    </div>
 

    <form name="myForm" id="myForm" method="post">
      <input type="hidden" name="commuIdk" value="" />
      <input type="hidden" name="searchValue" value="${searchValue}" />
      <input type="hidden" name="curPage" value="${curPage}" />
   </form>

   
   
       </div>
    <script src="https://assets.ohou.se/web/dist/js/303-cc24ad1d9e85c42571e5.js"></script><script src="https://assets.ohou.se/web/dist/js/216-0bc0ba0ef0ac66fbf9ac.chunk.js"></script>
    <script src="https://assets.ohou.se/web/dist/js/vendor-6b87d1d93ea2d1fc895a.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/249-d537f9b2c8ddc093de63.chunk.js"></script>
    <script src="https://assets.ohou.se/web/dist/js/preamble-4fe6ebba0c5449779ac3.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/229-22c7eb30e20c7d1b5dac.chunk.js"></script>
    <script src="https://assets.ohou.se/web/dist/js/3-025202b5dd6b27304bff.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/9-68c0a77a985baf7f2766.chunk.js"></script>
    <script src="https://assets.ohou.se/web/dist/js/10-7d989bbe00a02aa61c92.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/28-2bb5fa41a80506787368.chunk.js"></script>
    <script src="https://assets.ohou.se/web/dist/js/30-a3d34d9b99f4d6c927d3.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/36-95c220cf50b7abe229a4.chunk.js"></script>
    <script src="https://assets.ohou.se/web/dist/js/33-e245169af5016dc77e34.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/38-237a2b9058258b71fd7a.chunk.js"></script>
    <script src="https://assets.ohou.se/web/dist/js/40-361d3756e3f34f51a855.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/43-95df487d827a9a93acb6.chunk.js"></script>
    <script src="https://assets.ohou.se/web/dist/js/56-e8dc65841a7ab9442166.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/66-e8c6d59bf2aa292020c8.chunk.js"></script>
    <script src="https://assets.ohou.se/web/dist/js/173-dbb81211de882c820ecc.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/App-5da5e615b9384cefcd9b.chunk.js"></script>
    <script src="https://assets.ohou.se/web/dist/js/runtime-297be27a2ebcb724c754.js"></script>
 </body>
 </html>

 