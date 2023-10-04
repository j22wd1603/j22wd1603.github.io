<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<script src="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/icia.common.js"></script>
<script type="text/javascript" src="/resources/js/icia.ajax.js"></script>




<style>

/*userstyle.css 추출*/








/* Theme Colors */
:root {
    --accent-color       : #8d8d8d;
    --dark-color         : #191919;
    --light-color        : #fff;
    --grey-color         : #dbdbdb;
    --light-grey-color   : #fafafa;
    --primary-color      : #6995B1;
    --light-primary-color   : #eef1f3;
}



/*----------------------------------------------*/
/* 2 GENERAL TYPOGRAPHY */
/*----------------------------------------------*/


::-moz-selection {
  background: var(--primary-color);
  color: var(--light-color);
  text-shadow: none;
}

::-webkit-input-placeholder {
    color: #7A7A7A; /* WebKit browsers */
}
:-ms-input-placeholder {
    color: #7A7A7A;/* Internet Explorer 10+ */
}

/* Typography */
/*----------------------------------------------*/


h1.light, .h1, h2.light, .h2, h3.light, .h3, h4.light, .h4, h5.light, .h5, h6.light, .h6 {
  color: var(--light-color);
}
h1, h2, h3 {
  margin: 25px 0;
  text-transform: capitalize;
  text-align: center;
}
h5, h6 {
  letter-spacing: 1px;
}
h1, .h1 {
  font-size: 3em;
  line-height: 1.4;
}
h2, .h2 {
  font-size: 2em;
  line-height: 1.4;
}
h3, .h3 {
  font-size: 1.4em;
  line-height: 1.4;
}
h4, .h4 {
  font-size: 1.1em;
  line-height: 1.4;
}
h5, .h5 {
  font-size: .83em;
  line-height: 1.25;
}
h6, .h6 {
  font-size: .67em;
  line-height: 1.1;
}
h1 a, h2 a, h3 a, h4 a, h5 a, h6 a {
  font-weight: inherit;
  color: inherit;
  text-decoration: none;
}
p {
   font-family: var(--body-font);
   font-size: 18px;
   line-height: 1.8;
   margin: 0 0 20px 0;
}
p.dark {
    color: var(--dark-color);
}
p.light {
    color: var(--light-color);
}
p:empty {
  display: none;
}
small {
  font-size: 85%;
}
mark {
  background-color: var(--grey-color);
  padding: 0.28rem;
}
dfn, cite, em, i {
  font-style: italic;
}
::placeholder {
    color: var(--grey-color);
}


/*------------------------------------------------
/* 2.3 Forms
–––––––––––––––––––––––––––––––––––––––––––––––––– */
input[type="email"],
input[type="number"],
input[type="search"],
input[type="text"],
input[type="tel"],
input[type="url"],
input[type="password"],
textarea,
select {
    height: 50px;
    padding: 6px 15px;
    background-color: var(--light-background-color);
    border: 1px solid var(--grey-color);
    border-radius: 4px;
    box-shadow: none;
    box-sizing: border-box; 
  }
/* Removes awkward default styles on some inputs for iOS */
input[type="email"],
input[type="number"],
input[type="search"],
input[type="text"],
input[type="tel"],
input[type="url"],
input[type="password"],
textarea {
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none; }
textarea {
  min-height: 130px;
  padding-top: 6px;
  padding-bottom: 6px; }
input[type="email"]:focus,
input[type="number"]:focus,
input[type="search"]:focus,
input[type="text"]:focus,
input[type="tel"]:focus,
input[type="url"]:focus,
input[type="password"]:focus,
textarea:focus,
select:focus {
  border: 1px solid var(--grey-color);
  outline: 0; }
label,
legend {
  display: block;
  margin-bottom: .5rem;
  font-weight: 600; 
}
fieldset {
  padding: 0;
  border-width: 0; 
}
input[type="checkbox"],
input[type="radio"] {
  display: inline; }
label > .label-body {
  display: inline;
  margin-left: .5rem;
  font-weight: normal; }


/*------------------------------------------------
/* 2.7 Spacing
–––––––––––––––––––––––––––––––––––––––––––––––––– */
button,
.button {
  margin-bottom: 1rem; }
input,
textarea,
select,
fieldset {
  margin-bottom: 1.5rem; }
pre,
blockquote,
dl,
figure,
table,
form {
  margin-bottom: 2rem; 
}


/*userstyle.css 추출 끝*/



p {
  margin-block: 1.5rem;
}


body {
   font-family: 'Lato', sans-serif;
   background-color: #f8f8f8;
}



body .inpt {
   font-size: 14px;
   display: block;
   width: 80%;
   max-width: 80%;
   margin: 0 auto; 
   margin: 0 auto; 
   height: 42px;
   margin-bottom: 12px;
   padding: 16px 13px;
   color: #999999;
   border: 1px solid #d9d9d9;
   background: transparent;
   -moz-border-radius: 2px;
   -webkit-border-radius: 2px;
   border-radius: 2px;
   
}

 .box {
            border: 1px solid #000;
            padding: 10px;
            background-color: #f0f0f0;
            width: 100%; /* 가로 사이즈를 80%로 늘립니다. */
            margin: 0 auto;
            height: 100%;
        }

* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}
.form-group{

    max-width: 30%;
    width: 100;
    margin: auto;
    padding: 0 20px;
   
}

.form-group2{


    width: 100;

}

.form-group3{

   max-width: 60%;
    width: 100;
    margin: auto;
    padding: 0 20px;
   
}

body .container_member .content .checkbox {
  margin-top: 4px;
  clip: rect(0 0 0 0);
  padding: 0;
  border: 0;
  width: auto; /* 너비를 자동으로 설정하여 텍스트에 맞게 표시 */
  padding: 2px 6px; /* 필요한 패딩 조정 */
}
body .checkbox + label {
  vertical-align: middle;
  display: inline-block;
  width: 50%;
}

body .container_member .content .checkbox:checked + label:before {
  content: "✓";
}


.container2 {
   justify-content: center;
   display: flex;
   align-items: center;
    color: #999999;
    border: 1px solid #d9d9d9;
    background: transparent;
}

.form-group input {
    width: 100%;
    display: inline;
    margin-right: 5px;
    justify-content: space-between;
    height:20;
    line-height: 35px;
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 5px;
    
}

.phone {
    margin: auto; /*중앙 정렬*/
    display: flex;
    justify-content: space-between;
    line-height: 35px;
}

#phone1 {
    width: 18%;
}

#phone2 {
    width: 30%;
}

#phone3 {
    width: 30%;
}
    
 div {
    padding-top: 3px;
    padding-bottom: 8px;
}

input{
    border: 1px solid black;
    border-radius: 3px;
    line-height: 35px;
    font-size: 12px;
    padding-left: 10px;
    padding-right: 10px;
}

.term {
    max-width: 140%;
    margin: auto;
    padding-top: 30px;
    overflow: auto; /* 텍스트 오버플로우를 숨김 */
    max-height: 200px; /* 스크롤 영역의 최대 높이를 설정하세요 */
}
.term2 {
    max-width: 70%;
    margin: auto;
    padding-top: 30px;
    overflow: auto; /* 텍스트 오버플로우를 숨김 */
    max-height: 200px; /* 스크롤 영역의 최대 높이를 설정하세요 */
}

.formuse {
   max-width: 100%;
    display: block;
    width: 100%;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}

.checkbox-container {
    display: flex;
    align-items: center;
    margin-top: 10px;
}

.checkbox-container input[type="checkbox"] {
    margin-right: 5px;
}

#profilePicture {
  background-color:  #d9d9d9; /* 배경색을 투명으로 설정합니다. */
    border: none; /* 테두리를 제거합니다. */
    outline: none; /* 포커스 표시를 제거합니다. */
    cursor: pointer; /* 커서 모양을 포인터로 변경합니다. */
    float: right; /* 오른쪽으로 이동합니다. */
}

.btn-file {
       position: relative;
        overflow: hidden;
        display: inline-block;
}
.btn-file input[type=file]) {

    position: absolute;
        top: 0;
        right: 0;
        min-width: 100%;
        min-height: 100%;
        font-size: 100px;
        text-align: right;
        filter: alpha(opacity=0);
        opacity: 0;
        outline: none;
        background: white;
        cursor: pointer;
}

#btnReg {
    background-color: #a5a5a5;; /* 배경색을 변경하세요 */
    color: #fff; /* 텍스트 색상을 변경하세요 */
    border: none;
    padding: 10px 20px;
    font-size: 15px; /* 폰트 크기를 변경하세요 */
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease; /* 부드러운 전환 효과 추가 */
}

#btnReg:hover {
    background-color: #333; /* 마우스 호버 시 배경색 변경 */
}

h3 {
    font-weight: 900; /* 글자 굵기를 높은 값으로 설정 (900은 매우 굵은 글씨) */
    font-size: 26px; /* 폰트 크기 설정 */
    color: #000; /* 글자색 설정 */
    margin-left: 20px;
    position: relative;
    font-family: 'Gothic A1', sans-serif;
}

/* 밑줄 효과 */
h3::before {
    content: "";
    position: absolute;
    bottom: -5px; /* 밑줄의 위치 조절 */
    left: 0;
    width: 100%;
    height: 2px;
    background-color: #9e0e0b;    /* 밑줄 색상 설정 */
    transform: scaleX(0);
    transform-origin: right;
    transition: transform 0.3s ease;
}

h3:hover::before {
    transform: scaleX(1); /* 마우스 호버 시 밑줄 효과 확대 */
}

</style>

<script type="text/javascript">
var emailCheckStatus = false;
$(document).ready(function() {

   $("#userId").focus();
   
   $("#btnReg").on("click", function() {
      
      //공백체크
      var emptCheck = /\s/g;
      //영문 대소문자, 숫자로만 이루어진 4~12자리 정규식
      var idPwCheck = /^[a-zA-Z0-9]{4,12}$/;

      if($.trim($("#userId").val()).length <= 0)
      {
         alert("사용자 아이디를 입력하세요.");
         $("#userId").val("");
         $("#userId").focus();
         return;
      }
      
      if(emptCheck.test($("#userId").val()))
      {
         alert("사용자 아이디는 공백을 포함할수 없습니다.");
         $("#userId").focus();
         return;
      }
      
      if(!idPwCheck.test($("#userId").val()))
      {
         alert("사용자 아이디는 4~12자의 영문 대소문자와 숫자로만 입력하세요.");
         $("#userId").focus();
         return;
      }
      
      
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
      
      if($.trim($("#userEmail1").val()).length <= 0)
      {
         alert("사용자 이메일을 입력하세요.");
         $("#userEmail1").focus();
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
      if (!$('#mailCheckBtn').prop('disabled')) {
          alert("이메일 인증을 해주세요.");
          $("#mailCheckBtn").focus();
          return;
      }
      
      if($.trim($("#mailCheckInput").val()).length <= 0)
      {
         alert("인증번호를 입력해주세요.");
         $("#mailCheckInput").val("");
         $("#mailCheckInput").focus();
         return;
      }
      
      if(!emailCheckStatus){
    	  alert("인증번호가 다릅니다.");
          $("#mailCheckInput").val("");
          $("#mailCheckInput").focus();
    	  return;
      }
      
      //전화번호 조합
      $("#userPhone").val($("#phone1").val() + $("#phone2").val() + $("#phone3").val());
      $("#userEmail").val($("#userEmail1").val() + $("#userEmail2").val());

      
      $("#userPwd").val($("#userPwd1").val());
      
      //아이디 중복체크 aJax
      $.ajax({
         type:"POST",
         url:"/user/idCheck",
         data:{
            userId:$("#userId").val()
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
               //alert("아이디 중복 없음 가입 가능");
               fn_userReg();
            }
            else if(response.code == 100)
            {
               alert("중복된 아이디 입니다.");
               $("#userId").focus();
            }
            else if(response.code == 400)
            {
               alert("파라미터 값이 올바르지 않습니다.");
               $("#userId").focus();
            }
            else
            {
               alert("오류가 발생하였습니다.");
               $("#userId").focus();
            }
         },
         error:function(xhr, status, error)
         {
            icia.common.error(error);
         }
      });
   });
   
	$("#mailCheckBtn").click(function() {
		const eamil = $("#userEmail1").val() + $("#userEmail2").val(); // 이메일 주소값
		console.log("완성된 이메일 : " + eamil); // 이메일 오는지 확인
		const checkInput = $("#mailCheckInput") // 인증번호 입력하는곳 
		$("#mailCheckBtn").attr("disabled",true);
		$.ajax({
			type : "POST",
			url : "/user/mailCheck",
		    data:{
		    	eamil:eamil
		    },
		    datatype:"JSON",
			success : function(response) {
				var data = response.data.data;
				console.log("data : " +  data);
				checkInput.attr("disabled",false);
				code =response.data.data;
				alert("인증번호가 전송되었습니다.")
			},
		    error:function(error)
		    {
		    	icia.common.error(error);
				$("#mailCheckBtn").attr("disabled",false);
		    }		
		}); // end ajax
	}); // end send eamil
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$("#mailCheckInput").blur(function () {
		const inputCode = $(this).val();
		const $msg = $("#mailCheckMsg");
		
		if(inputCode === code){
			$msg.html("인증번호가 일치합니다.");
			$msg.css("color","green");
			$("#mailCheckBtn").attr("disabled",true);
			$("#userEamil1").attr("readonly",true);
			$("#userEamil2").attr("readonly",true);
			$("#userEmail2").attr("onFocus", "this.initialSelect = this.selectedIndex");
	        $("#userEmail2").attr("onChange", "this.selectedIndex = this.initialSelect");
	        
	        emailCheckStatus = true;
		}else{
			$msg.html("인증번호가 불일치 합니다. 다시 확인해주세요!.");
			$msg.css("color","red");
			
			emailCheckStatus = false;
		}
	});
});

function fn_userReg()
{
	var form = $("#regForm")[0];
	var formData = new FormData(form);
	
	$.ajax({
		type:"POST",
		enctype:"multipart/form-data",
		url:"/user/regProc",
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
	            alert("회원 가입이 되었습니다.");
	            location.href = "/";
	         }
	         else if(response.code == 100)
	         {
	            alert("회원 아이디가 중복 되었습니다.");
	            $("#userId").focus();
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
			$("#btnWrite").prop("disabled", false);		//글쓰기 버튼 활성화
		}
		
	});
	

}

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
    
function agree() {
    // 체크박스 상태 확인
    var checkBox = document.getElementById("agreement");
    
    if (checkBox.checked == true) {
        // 동의한 경우에 실행할 동작
        alert("동의하셨습니다.");
        // 이후에 원하는 작업을 수행할 수 있습니다.
    } else {
        // 동의하지 않은 경우에 실행할 동작
        alert("동의하지 않으셨습니다.");
        // 이후에 원하는 작업을 수행할 수 있습니다.
    }
}
</script>
    

</head>

<body>


       <h3 style="margin-left: 20px;">회원가입</h3>
       
   	<form name="regForm" id="regForm" method="post" enctype="multipart/form-data">

    <div class="row mt-2">
        <div class="col-12">
               <div class="form-group">
                    <label for="userId" style="font-size: 17px;" >사용자 아이디</label>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="ID" maxlength="13"/>
                </div>
          
                <div class="form-group">
                    <label for="userPwd1" style="font-size: 17px;">비밀번호</label>
                    <input type="password" class="form-control" id="userPwd1" name="userPwd1" placeholder="비밀번호" maxlength="12"  />
                </div>
            
                <div class="form-group">
                    <label for="userPwd2" style="font-size: 17px;" >비밀번호 확인</label>
                    <input type="password" class="form-control" id="userPwd2" name="userPwd2" placeholder="비밀번호 확인" maxlength="12"  />
                </div>
           
                 <div class="form-group">
                    <label for="userNickname" style="font-size: 17px;" >닉네임</label>
                    <input type="text" class="form-control" id="userNickname" name="userNickname" placeholder="닉네임" maxlength="15" />
                </div>
                <div class="form-group">
                    <label for="userName" style="font-size: 17px;" >사용자 이름</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="사용자 이름" maxlength="15"  />
                </div>
                
                <div class="form-group email-form">
					<label for="userEmail1" style="font-size: 17px;">사용자 이메일</label>
					<div class="input-group">
					<input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="사용자 이메일" >
					<select class="form-control" name="userEmail2" id="userEmail2" >
						<option>@naver.com</option>
						<option>@daum.net</option>
						<option>@gmail.com</option>
					</select>
				</div>   
				<div class="input-group-addon">
					<button type="button" class="btn btn-primary" id="mailCheckBtn">본인인증</button>
				</div>
				<div class="mail-check-box">
					<input class="form-control" id="mailCheckInput" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
				</div>
					<span id="mailCheckMsg"></span>
				</div>
                
                <div class="form-group">
                  <label for="userName" style="font-size: 17px;" >전화번호</label>
             <div class="phone">
            <input id="phone1" type="text" size="1" maxlength="3"> -
            <input id="phone2" type="text" size="3" maxlength="4"> -
            <input id="phone3" type="text" size="3" maxlength="4">
            </div>
             
             <div class="form-group2">
                <label for="profilePicture" style="font-size: 17px;">프로필 사진 업로드</label>
				<input type="file" id="profilePicture" name="profilePicture" style="margin: 0 auto; display: block; background-color :#a5a5a5;" onchange="previewImage(this);" />
				<img id="preview" src="#" alt="프로필 미리보기" style="font-size: 15px; display: block; margin: 10px auto 0; max-width: 100%;" />
            </div>
        </div>
       
                <div class="form-group">
                    <label for="userAddress" style="font-size: 17px;" >사용자 주소</label>
                    <input type="text" class="form-control" id="userAddress" name="userAddress" placeholder="사용자 주소" maxlength="30"  />
                   <input type="text" id="sample6_postcode" placeholder="우편번호">
               <input type="button" style = "background-color :#a5a5a5;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
               <input type="text" id="sample6_address" placeholder="주소"><br>
               <input type="text" id="sample6_detailAddress" placeholder="상세주소">
               <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                     <!-- 입력 완료 버튼 -->
                <input type="button" onclick="setInputAddress()"  style=" background-color :#a5a5a5; display: block; margin: 0 auto;" value="입력 완료">
                </div>
                <br>
                
              <div class="form-group3">
              <label for="agreement" style="margin-left: 130px;">이용약관</label>
                  <div class="term2" style="padding-top: 30px;">
      
                          <div class="box">
                              <h4>회원가입 이용약관</h4>
                              <p class="formuse">제 1조 Lorem ipsum dolor sit amet<br> <!-- 약관 텍스트 내용 -->
                           이 약관은 (0)0000(전자거래 사업자)이 운영하는 홈페이지(이하 "쇼핑몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 (0)0000와 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.<br>
                           ※ 「PC통신 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」<br>
                           제2조(정의)   
                           ① "쇼핑몰" 이란 사업자가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 쇼핑몰을 운영하는 사업자의 의미로도 사용합니다.<br>
                           ② "이용자"란 "쇼핑몰"에 접속하여 이 약관에 따라 "쇼핑몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
                           ③ "회원"이라 함은 "쇼핑몰"에 개인정보를 제공하여 회원등록을 한 자로서, "쇼핑몰"의 정보를 지속적으로 제공받으며, "쇼핑몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br>
                           ④ "비회원"이라 함은 회원에 가입하지 않고 "쇼핑몰"이 제공하는 서비스를 이용하는 자를 말합니다.</p>
                        </div>
                         <div class="checkbox-container">
                          <input type="checkbox" id="agreement" onclick="agree();">
                               <label for="agreement">이용약관에 동의합니다.</label>
                           </div>

                       </div>
                        </div>
         
                <input type="hidden" id="userPwd" name="userPwd" value="" />
                <input type="hidden" id="userPhone" name="userPhone" value="" />
                <input type="hidden" id="userEmail" name="userEmail" value="" />

                <br>
                <button type="button" id="btnReg" class="btn btn-primary" style="width: 350px; margin: 0 auto; display: block;">등록</button>

    </div>
       </div>
</form>
</body>
</html>