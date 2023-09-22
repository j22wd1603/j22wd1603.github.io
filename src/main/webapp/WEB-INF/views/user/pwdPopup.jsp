<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<!-- Favicon -->
<link href="/resources/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600&family=Teko:wght@400;500;600&display=swap" rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/resources/css/style.css" rel="stylesheet">


<style rel="stylesheet">


@charset "UTF-8";

@import url(https://fonts.googleapis.com/css?family=Lato:400,700);

* {
   -moz-box-sizing: border-box;
   -webkit-box-sizing: border-box;
   box-sizing: border-box;
}

p {
  margin-block: 1.5rem;
}

.text--center {
  text-align: center;
  color: #your-desired-color;
}


/* 기존 스타일을 덮어쓰기 위해 클래스 선택자 사용 */
.text--center a {
  color: #828282; /* 원하는 글자색으로 설정 */
  text-decoration: underline; /* 링크에 밑줄 추가 */
}


body .loginUtil{ -webkit-text-size-adjust: 100%;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
    --bg-vh: 7.07px;
    word-break: keep-all;
    color: #000 !important;
    box-sizing: border-box;
    padding: 0;
    font-family: "Antique-Legacy","Pretendard",sans-serif !important;
    font-weight: normal;
    letter-spacing: -0.3px;
    height: 35px;
    margin: 0 auto;
    font-size: 13px;
    text-align: center;
    line-height: 35px;

    
   }
   
   
body .container_member .content .submit-wrap {
    width: 100%;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: space-between; /* 아이템 간격을 최대한 확보하여 배치 */
}

body .container_member .content input.submit {
    display: block;
    width: 50%;
    margin: 0 auto;
    padding: 10px 0;
}

body .container_member .content .text--center a {
    display: inline-block;
    margin-top: 20px;
    text-align: center;
    text-decoration: none;
    color: #999999;
    width: 50%; /* 링크의 폭을 50%로 설정 */
}


/* 기존 스타일을 덮어쓰기 위해 클래스 선택자 사용 */
.login input[type="submit"]:hover {
  background-color: #c8c8c8; /* 원하는 배경색으로 설정 */
  color: #999999; /* 원하는 글자색으로 설정 */
}

.login input[type="submit"] {
  background-color: var(--loginSubmitBackgroundColor);
  color: var(--loginSubmitColor);
  font-weight: 100;
  text-transform: uppercase;
  
}

body {
   font-family: 'Lato', sans-serif;
   background-color: #f8f8f8;
}

body .container_member {
   position: relative;
   height: 100%;
    justify-content: center; /* 수평 방향 가운데 정렬 */
   -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
   -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
   box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
   padding: 0 7%;
}

body .container_member .half {
   float: left;
   width: 100%;
   height: 100%;
   padding: 58px 20% 0 20%;
}


body .container_member .half .signup-cont {
   float: left;
   width: 100%;
   height: 1000px;
   padding: 20px 20%;
}

body .container_member .half.bg {
   background-image: url("http://www.blueb.co.kr/SRC2/_image/v01.jpg");
   background-size: 400px;
   background-repeat: no-repeat;
}


body .container_member h1 {
   font-size: 18px;
   font-weight: 700;
   margin-bottom: 23px;
   text-align: center;
   text-indent: 6px;
   letter-spacing: 7px;
   text-transform: uppercase;
   color: #263238;
}

body .container_member .tabs {
   display: flex;
   margin-bottom: 29px;
   border-bottom: 1px solid #d9d9d9;
   justify-content: center;
   align-items: center;
}

body .container_member .tabs .tab {
   display: inline-block;
   margin-bottom: -1px;
   padding: 20px 15px 10px;
   cursor: pointer;
   letter-spacing: 0;
   border-bottom: 1px solid #d9d9d9;
   -moz-user-select: -moz-none;
   -ms-user-select: none;
   -webkit-user-select: none;
   user-select: none;
   transition: all 0.1s ease-in-out;
}

body .container_member .tabs .tab a {
   font-size: 15px;
   text-decoration: none;
   text-transform: uppercase;
   color: #d9d9d9;
   
   transition: all 0.1s ease-in-out;
}

body .container_member .tabs .tab.active a, body .container_member .tabs .tab:hover a
   {
   color: #263238;
}

body .container_member .tabs .tab.active {
   border-bottom: 1px solid #263238;
}

body .container_member .content form {
   position: relative;
   height: 287px;
}

body .container_member .content .submit-wrap {
    width: 100%; /* 100%로 설정하여 부모 요소 너비에 맞춤 */
    text-align: center; /* 내부 요소를 수평 방향 가운데 정렬 */
    display: flex; /* Flexbox 사용 */
    align-items: center; /* 수직 방향 가운데 정렬 */
}

body .container_member .content input.submit {
    display: block; /* 블록 레벨 요소로 변경하여 너비를 조절 */
    width: 50%; /* 원하는 너비로 설정 */
    margin: 0 auto; /* 수평 가운데 정렬 */
    padding: 10px 0; /* 위아래 패딩 추가 */
}

body .container_member .content label:first-of-type, body .container_member .content input:first-of-type,
   body .container_member .content .more:first-of-type {
   -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
   -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
   animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0, 0);
}

body .container_member .content label:nth-of-type(2), body .container_member .content input:nth-of-type(2),
   body .container_member .content .more:nth-of-type(2) {
   -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
   -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
   animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0, 0);
}

body .container_member .content label:nth-of-type(3), body .container_member .content input:nth-of-type(3),
   body .container_member .content .more:nth-of-type(3) {
   -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
   -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
   animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0, 0);
}



body .container_member .content label {
   font-size: 1em;
   color: #263238;
   -moz-user-select: -moz-none;
   -ms-user-select: none;
   -webkit-user-select: none;
   user-select: none;
}

body .container_member .content label:not([for='remember']) {
   display: none;
}

body .container_member .content input.inpt {
   font-size: 14px;
   display: block;
   width: 80%;
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

body .container_member .content input.inpt::-webkit-input-placeholder {
   font-size: 14px;
   color: #999999;
   font-family: 'Lato', sans-serif;
}

body .container_member .content input.inpt:-moz-placeholder {
   font-size: 14px;
   color: #999999;
   font-family: 'Lato', sans-serif;
}

body .container_member .content input.inpt::-moz-placeholder {
   font-size: 14px;
   color: #999999;
   font-family: 'Lato', sans-serif;
}

body .container_member .content input.inpt:-ms-input-placeholder {
   font-size: 14px;
   color: #999999;
   font-family: 'Lato', sans-serif;
}

body .container_member .content input.inpt:focus {
   border-color: #999999;
}

body .container_member .content input.submit {
   font-size: 12px;
   display: block;
   width: 80%;
   margin: 0 auto; 
   height: 42px;
   cursor: pointer;
   vertical-align: middle;
   letter-spacing: 2px;
   text-transform: uppercase;
   color: #263238;
   border: 1px solid #263238;
   background: transparent;
   -moz-border-radius: 2px;
   -webkit-border-radius: 2px;
   border-radius: 2px;
}

body .container_member .content input.submit:hover {
   background-color: #263238;
   color: #ffffff;
   -moz-transition: all 0.2s;
   -o-transition: all 0.2s;
   -webkit-transition: all 0.2s;
   transition: all 0.2s;
}

body .container_member .content input:focus {
   outline: none;
}

body .container_member .content .checkbox {
   margin-top: 4px;
   overflow: auto;
   clip: rect(0, 0, 0, 0);
   width: 0;
   height: 0;
   margin: 17px -1px;
   padding: 0;
   border: 0;
}

body .container_member .content .checkbox+label {
   vertical-align: middle;
   display: inline-block;
   width: 50%;
}

body .container_member .content .checkbox+label:before {
   content: "\A";
   color: #999999;
   font-family: Verdana;
   font-weight: bold;
   font-size: 8px;
   line-height: 10px;
   text-align: center;
   display: inline-block;
   vertical-align: middle;
   position: relative;
   -moz-border-radius: 2px;
   -webkit-border-radius: 2px;
   border-radius: 2px;
   background: transparent;
   border: 1px solid #d9d9d9;
   width: 11px;
   height: 11px;
   margin: -2px 8px 0 0;
}


@
keyframes slideIn { 0% {
   filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
   opacity: 0;
   margin-left: -320px;
}

100% {
filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
opacity:1;
margin-left:0px;}
}
@-webkit-keyframes slideIn { 0% {
   filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
   opacity: 0;
   margin-left: -320px;
}

100%{
filter:progid:DXImageTransform.Microsoft.Alpha(enabled=false);
opacity:1;
margin-left:0px;}
}
.credits {
   display: block;
   position: absolute;
   right: 0;
   bottom: 0;
   color: #999999;
   font-size: 14px;
   margin: 0 10px 10px 0;
}

.credits a {
   filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
   opacity: 0.8;
   color: inherit;
   font-weight: 700;
   text-decoration: none;
}
.tc{
   color: red;
}

#Api {
   display: flex;
}
#loginApi > div {
   flex: 1;
}


    body {
        overflow: hidden;
    }

</style>
<script>
//아이디 값 받고 출력하는 ajax
var pwdV = "";

var PwdSearch_click = function(){
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/user/userSearchPwd?inputId="
				+$('#inputId').val()+"&inputEmail_2="+$('#inputEmail_2').val(),
		success:function(data){
			if(data == 0){
				$('#pwd_value').text("회원 정보를 확인해주세요");	
			} else {
				$('#pwd_value').text(data);
				// 아이디값 별도로 저장
				pwdV = data;
			}
		}
	});
}

</script>
<body>
<section class="container_member">
      <article class="half">
         <h1>비밀번호 찾기</h1>
         <div class="content">
            <div class="signin-cont cont">
               <form name="form1" method="post">
                  <input type="text" name="inputId" id="inputId" class="inpt"
                     required="required" placeholder="사용자 아이디"> 
                  <label for="text">ID</label>
                  
                  <input type="text" name="inputEmail_2" id="inputEmail_2" class="inpt" required="required"
                     placeholder="사용자 이메일">
                  <label for="text">Password</label>
                  
                  <div class="submit-wrap">
                     <input type="button" id="searchBtn" value="비밀번호 찾기" onclick="PwdSearch_click()" class="submit"> 
                  </div><br><br>
                  
                  <h1>
					<b>입력하신 정보로 등록된 비밀번호는</b>
				  </h1>
				  <h1 id="pwd_value"></h1>
                  
        		<use xlink:href="#icon-arrow-right"></use>
        
        		<svg xmlns="http://www.w3.org/2000/svg" class="icons"></svg>
        		</form>
        		</div>
        		</div>
      </article>
   </section>
   </body>
   </html>