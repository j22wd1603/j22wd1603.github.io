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

@import url(https://fonts.googleapis.com/css?family=Lato:400,700);


<style>
* {
    font-family: 'Gothic A1', sans-serif;
}

.card {

	
	box-shadow: 3px 3px 50px #e6e6e6;
	border-radius:20px;
	position: relative;
    display: inline-block;
    border-radius: 20px;
    text-align:center;
    border: 1px solid #ccc;



    font: inherit;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    /* 수직 가운데 정렬 속성을 초기화합니다. */
    align-items: space-between;
    -webkit-align-items: space-between;
    
    /* 수평 가운데 정렬 속성을 초기화합니다. */
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

  .css-f61xoy.focus-visible:focus {
    color: #bdbdbd;
  }

  @media (min-width: 768px) {
    .css-f61xoy:hover,
    .css-f61xoy:active {
      color: #bdbdbd;
    }
  }

  .css-1n1rkai {
    margin: 0 5px -2px 0;
  }
  .css-j2mjq4{
  	margin:0 0 60px;
  }
  
  .css-rd2t8e {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-pack: justify;
            -webkit-justify-content: space-between;
            justify-content: space-between;
       
}
        
</style>

<style>

.no-questions {
  display: flex;
  height: 300px; /* 필요한 높이 값으로 조정하세요. */
  font-size: 18px;
  color: #333;
}

*{
	margin:0;
	padding:0;
}

li{

list-style:non;

}

ul{

margin:auto;}

a{
coloer: inherit;
text-decoration:none;
}

  	
body{

	display:block;
}

.content-box{
	display: flex; /* Flexbox 컨테이너로 설정합니다. */
  	justify-content: space-between; /* 내부 요소 사이에 공간을 균등하게 분배합니다. */
 	border-bottom: 1px solid #ccc; /* 각 항목마다 하단에 회색 선 추가 */
  	margin: auto;
  	
}

.num {
  width:40px 
}

.num, .title, .date, .count, .delete {
  flex: 1; /* 요소들이 동일한 너비로 가로 정렬되도록 설정 */
}

/* 마지막 항목에는 선 제거 */
.content-box:last-child {
    border-bottom: none;
}

.card-body{
  border-bottom: 1px solid #ccc; /* 각 항목마다 하단에 회색 선 추가 */
  padding: 20px; /* 내용 주위의 간격 조정 */
  padding-bottom: 10px; /* 가로 선과 컨텐츠 사이의 간격 조절 (선택 사항) */
  width:100%;

}

.card-body input[type="search"]{

	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #999;
	border: 1px solid #999;
	border-radius: 10px;
	width: 300px;
	font-size: 16px;
}

.card-body a.search {
	
	padding: 10px 15px 10px 15px;
	margin-left:1 10px;
	border-radius: 10px;
	background-color: #db7093;
	color: #fff;
}

.card-body div{

	border-bottm: 1px solid #e6e6e6;
}

.card-body div div {

	display: inline-block;
	padding: 15px 10px 15px 10px;
	border: none;

}

.upbox{
	display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
	-webkit-font-smoothing: antialiased;
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    justify-content: space-between;
    margin: 0 0 40px;
    padding: 10px 0 10px;
    border-bottom: 1px solid #ededed;
}


.card-body .check , .delete{
	width: 7%;
}


.number li{
	display: inline-block;
}


.number li a{
	display: block;
	width: 40px;
	/*text-align이 위로 올라간다 */
	line-height: 40px;
	border-radius: 10px;
	margin: 3px;
	margin-top: 20px;
	box-shadow: 0 5px 10px #f1f1f1;
}

.number li a.active {
	background-coler: rgb(252, 212, 205); 
	margin-right: 10px; 
}

.btn{
	
    font-size: 16px;
    margin-top: 0;
    margin-bottom: 0.5rem;
    font-weight: 600;
    line-height: 1.2;
    color: #db7093;
    padding-left: 670px;
    padding-right: 20px;
    

}
.btn a{
    
	padding: 10px;
	background-color: #db7093;
	color: #fff;
	width: 150px; /* 원하는 가로 크기로 조정 */
	border-radius: 5px;
}

.title {
    width: 200px; /* 원하는 폭으로 설정하세요 */
    white-space: nowrap; /* 제목이 한 줄로 표시되도록 설정 */
    text-overflow: ellipsis; /* 내용이 넘칠 경우 ...으로 표시 */
    display: flex;
}
.whitebox{

width:800px;
margin-bottom: 100px;
flex-direction: column;

}

.middlebox{
width:7px;
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
         alert("test");
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

 <script>
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
      <style data-emotion="css 1x6h9tu">.css-1x6h9tu{width:100%;max-width:1256px;margin:0 auto;box-sizing:border-box;}@media all{.css-1x6h9tu{padding:0 15px;}}@media (min-width: 375px){.css-1x6h9tu{padding:0 15px;}}@media (min-width: 768px){.css-1x6h9tu{padding:0 40px;}}@media (min-width: 1024px){.css-1x6h9tu{padding:0 60px;}}@media (min-width: 1256px){.css-1x6h9tu{padding:0 60px;}}</style><div class="css-1x6h9tu ekbdbra0"><style data-emotion="css 1mux1hm">.css-1mux1hm{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-flex-wrap:wrap;-webkit-flex-wrap:wrap;-ms-flex-wrap:wrap;flex-wrap:wrap;box-sizing:border-box;}@media all{.css-1mux1hm{margin:0 -5px;}}@media (min-width: 375px){.css-1mux1hm{margin:0 -5px;}}@media (min-width: 768px){.css-1mux1hm{margin:0 -7.5px;}}@media (min-width: 1024px){.css-1mux1hm{margin:0 -10px;}}@media (min-width: 1256px){.css-1mux1hm{margin:0 -10px;}}</style><div class="css-1mux1hm el2z1iq0"><style data-emotion="css i5en0t">.css-i5en0t{box-sizing:border-box;width:100%;position:relative;padding-top:30px;}@media all{.css-i5en0t{padding-left:5px;padding-right:5px;}}@media (min-width: 375px){.css-i5en0t{padding-left:5px;padding-right:5px;}}@media (min-width: 768px){.css-i5en0t{padding-left:7.5px;padding-right:7.5px;}}@media (min-width: 1024px){.css-i5en0t{padding-left:10px;padding-right:10px;}}@media (min-width: 1256px){.css-i5en0t{padding-left:10px;padding-right:10px;}}@media (min-width: 1024px){.css-i5en0t{width:25%;}}</style><div class="css-i5en0t e1ivswjr3"><div class="sticky-container"><div class="sticky-child"><div class="css-0 e1ejty664"><style data-emotion="css itjaqv">.css-itjaqv{position:relative;padding:0;}@media (min-width: 768px){.css-itjaqv{padding:30px 25px 18px;border-radius:4px;border:1px solid #dadce0;box-shadow:0 2px 4px 0 rgba(63, 71, 77, .06);}}</style>
         <div class="css-itjaqv e1ejty663">
            <style data-emotion="css 1xbefvf">.css-1xbefvf{position:absolute;top:-14px;right:-6px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-align-items:flex-end;-webkit-box-align:flex-end;-ms-flex-align:flex-end;align-items:flex-end;z-index:1;}@media (min-width: 768px){.css-1xbefvf{top:18px;right:12px;}}</style>
  
      <style data-emotion="css hdhsoq">.css-hdhsoq{position:relative;min-height:84px;box-sizing:border-box;padding-left:104px;margin:0 0 20px;}@media (min-width: 768px){.css-hdhsoq{min-height:120px;padding:14px 0 0 140px;}}@media (min-width: 1024px){.css-hdhsoq{padding:0;}}</style><div class="css-hdhsoq e18gdfbl4"><style data-emotion="css 1uebeg0">.css-1uebeg0{position:absolute;top:0;left:0;width:84px;height:84px;margin:0 20px 0 0;border-radius:100%;background-color:#ededed;overflow:hidden;}@media (min-width: 768px){.css-1uebeg0{width:120px;height:120px;}}@media (min-width: 1024px){.css-1uebeg0{position:relative;margin:0 auto 24px;}}.css-1uebeg0:after{content:'';display:block;position:absolute;top:0;left:0;width:100%;height:100%;box-sizing:border-box;border:1px solid rgba(0, 0, 0, .07);border-radius:100%;}</style>
      <div class="css-1uebeg0 e18gdfbl3">
         <style data-emotion="css 1cqverl">.css-1cqverl{position:absolute;top:50%;left:50%;width:100%;-webkit-transform:translate(-50%, -50%);-moz-transform:translate(-50%, -50%);-ms-transform:translate(-50%, -50%);transform:translate(-50%, -50%);}</style>
         <img class="css-1cqverl e18gdfbl2" src="/resources/images/profile/${user.userId}.${user.imageFileExt}" />
      </div>
      <style data-emotion="css oycm3d">.css-oycm3d{text-align:left;}@media (min-width: 1024px){.css-oycm3d{text-align:center;}}</style>
      <div class="css-oycm3d e18gdfbl1">
         <style data-emotion="css n5l119">.css-n5l119{margin:0 0 3px;font-weight:bold;font-size:20px;line-height:1.2;color:#292929;overflow-wrap:break-word;word-break:break-all;}@media (min-width: 768px){.css-n5l119{margin:0 0 10px;font-size:26px;}}@media (min-width: 1024px){.css-n5l119{line-height:1.15;}}</style>
            <div class="css-n5l119 etfm1it0" id="userNickname">${user.userNickname}</div>
            <div class="css-oycm3d e1iro1t99">
               <style data-emotion="css 1uy49c8">.css-1uy49c8{margin:0 0 7px;display:block;font-size:13px;font-weight:400;line-height:19px;color:#828c94;}@media (min-width: 1024px){.css-1uy49c8{margin:0 0 13px;}}</style>
               <dl class="css-1uy49c8 e1iro1t98"><style data-emotion="css 7haicw">.css-7haicw{display:inline-block;margin-right:5px;}</style>
                
               </dl>
              
           </div>
        </div>
     </div>
      <style data-emotion="css 1049nre">@media (min-width: 768px){.css-1049nre{border-top:1px solid #eaebef;padding:22px 12px 0;}}@media (min-width: 1024px){.css-1049nre{padding:24px 0 6px;}}</style>
      <div class="css-1049nre epl9oik0">
         <style data-emotion="css 134c4us">.css-134c4us{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;color:#292929;}</style>
            <div class="css-134c4us ekeuxnk0">
               <style data-emotion="css 1p9dybm">.css-1p9dybm{-webkit-flex:1 0 0px;-ms-flex:1 0 0px;flex:1 0 0px;display:block;min-width:0;box-sizing:border-box;text-align:center;padding:18px 16px 14px;-webkit-transition:.1s opacity;transition:.1s opacity;}.css-1p9dybm.focus-visible:focus{opacity:.7;}@media (min-width: 768px){.css-1p9dybm:hover,.css-1p9dybm:active{opacity:.7;}}@media (min-width: 768px){.css-1p9dybm{padding:0 16px;}}@media (min-width: 1024px){.css-1p9dybm{padding:0;}}</style>
               <a class="css-1p9dybm e1q26atk3" href="/user/mypageScrap">
                  <style data-emotion="css zpotx6">.css-zpotx6{margin:0 auto 4px;}.css-zpotx6 svg{width:28px;height:28px;}</style>
                  <div class="css-zpotx6 e1q26atk2">
                     <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" preserveAspectRatio="xMidYMid meet">
                        <path fill-rule="evenodd" transform="matrix(1 0 0 -1 0 23.033)" d="M12.943 6.342a2 2 0 0 1-1.886 0L3 2.032V20.5a.5.5 0 0 0 .5.5h17a.5.5 0 0 0 .5-.5V2.033l-8.057 4.309zm-.471-.882l8.056-4.31A1 1 0 0 1 22 2.034V20.5a1.5 1.5 0 0 1-1.5 1.5h-17A1.5 1.5 0 0 1 2 20.5V2.033a1 1 0 0 1 1.472-.882l8.056 4.31a1 1 0 0 0 .944 0z"></path>
                     </svg>
                  </div>
                  <style data-emotion="css 10ewlqi">.css-10ewlqi{font-size:15px;line-height:21px;font-weight:normal;text-align:center;color:#424242;}@media (min-width: 1024px){.css-10ewlqi{font-size:13px;}}</style>
                  <div class="css-10ewlqi e1q26atk1">스크랩북</div>
                  <style data-emotion="css 2rwq1u">.css-2rwq1u{font-size:15px;line-height:21px;font-weight:bold;text-align:center;color:#424242;}</style>
                  <div class="css-2rwq1u e1q26atk0"><fmt:formatNumber type="number" maxFractionDigits="3" value="${userCnt.scrapCnt}" /></div>
               </a>
               <a class="css-1p9dybm e1q26atk3" href="/user/mypageLikes">
                  <div class="css-zpotx6 e1q26atk2">
                     <svg width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
                        <path fill="currentColor" d="M22.971 7.638c-.548-5.17-7.119-7.135-10.57-2.488a.5.5 0 0 1-.802 0C8.148.503 1.577 2.469 1.029 7.625.642 12.451 3.897 17.183 12 21.436c8.104-4.252 11.36-8.984 10.972-13.798zm.996-.093c.428 5.319-3.137 10.446-11.738 14.899a.5.5 0 0 1-.46 0C3.169 17.99-.395 12.864.034 7.532.656 1.67 7.904-.683 12 4.052 16.096-.683 23.344 1.67 23.967 7.545z">
                        </path>
                     </svg>
                  </div>
                 <div class="css-10ewlqi e1q26atk1">좋아요</div>
                 <div class="css-2rwq1u e1q26atk0"><fmt:formatNumber type="number" maxFractionDigits="3" value="${userCnt.likesCnt}" /></div>
            </a>
            <a class="css-1p9dybm e1q26atk3" href="/user/myCoupon">
               <div class="css-zpotx6 e1q26atk2">
                  <svg width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
                     <path fill="#424242" fill-rule="nonzero" d="M22.588 3H1.413C.633 3 0 3.638 0 4.426L0 9.53l.605-.088c.12-.017.243-.026.367-.026 1.413 0 2.558 1.157 2.558 2.584S2.385 14.584.972 14.584c-.124 0-.247-.009-.367-.026L0 14.47l.001 5.104C.001 20.362.633 21 1.413 21h21.175c.78 0 1.412-.638 1.412-1.426V4.426C24 3.638 23.368 3 22.588 3zM1.413 4.07h21.175c.195 0 .353.159.353.356v15.148c0 .197-.158.357-.353.357H1.413l-.071-.008c-.161-.033-.282-.176-.282-.349l-.002-3.923-.086.002c1.997 0 3.617-1.635 3.617-3.653l-.004-.182C4.493 9.945 3.006 8.443 1.152 8.35l-.094-.003.002-3.922c0-.197.158-.357.353-.357zm14.646 2.138c.293 0 .53.237.53.53v1.614c0 .292-.237.53-.53.53-.292 0-.53-.238-.53-.53V6.737c0-.292.238-.53.53-.53zm0 4.455c.293 0 .53.237.53.53v1.614c0 .293-.237.53-.53.53-.292 0-.53-.237-.53-.53v-1.614c0-.293.238-.53.53-.53zm0 4.456c.293 0 .53.237.53.53v1.614c0 .292-.237.53-.53.53-.292 0-.53-.238-.53-.53v-1.615c0-.292.238-.53.53-.53z"></path>
                  </svg>
               </div>
                        <div class="css-10ewlqi e1q26atk1">내 쿠폰</div>
                        <div class="css-2rwq1u e1q26atk0"><fmt:formatNumber type="number" maxFractionDigits="3" value="${userCnt.couponCnt}" /></div>
               </a>
            </div>
         </div>
      </div>
      <style data-emotion="css 1sravj">.css-1sravj{display:none;margin:14px 0 0;width:100%;box-sizing:border-box;padding:15px 0;font-size:14px;line-height:20px;border-radius:4px;background-color:#effbff;color:#3f474d;text-align:center;-webkit-transition:.1s background-color;transition:.1s background-color;}.css-1sravj >b{color:#35c5f0;}.css-1sravj::-moz-focus-inner{border:0;}.css-1sravj.focus-visible:focus{box-shadow:0 0 0 3px #a3e4f8;}.css-1sravj.focus-visible:focus{background-color:#e5f9ff;}@media (min-width: 768px){.css-1sravj:hover,.css-1sravj:active{background-color:#e5f9ff;}}@media (min-width: 1024px){.css-1sravj{display:block;}}</style>
      
      <style data-emotion="css 1pjipdo">.css-1pjipdo{margin-left:10px;vertical-align:-2px;}</style>
      <svg width="1em" height="1em" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet" class="css-1pjipdo e1s6kf710">
            
         </svg>
      </a></div></div></div></div>
      <style data-emotion="css 1dm5gv7">.css-1dm5gv7{box-sizing:border-box;width:100%;}@media all{.css-1dm5gv7{padding-left:5px;padding-right:5px;}}@media (min-width: 375px){.css-1dm5gv7{padding-left:5px;padding-right:5px;}}@media (min-width: 768px){.css-1dm5gv7{padding-left:7.5px;padding-right:7.5px;}}@media (min-width: 1024px){.css-1dm5gv7{padding-left:10px;padding-right:10px;}}@media (min-width: 1256px){.css-1dm5gv7{padding-left:10px;padding-right:10px;}}@media (min-width: 1024px){.css-1dm5gv7{width:8.333333333333332%;}}</style>
      <div class="middlebox">
         <style data-emotion="css vb69r7">.css-vb69r7{margin:0 -10px 20px;border-bottom:1px solid #ededed;}@media (min-width: 768px){.css-vb69r7{display:none;}}</style>
         <div class="css-vb69r7 e1ivswjr2"></div>
      </div>
      <style data-emotion="css 1ltj86z">.css-1ltj86z{box-sizing:border-box;width:100%;}@media all{.css-1ltj86z{padding-left:5px;padding-right:5px;}}@media (min-width: 375px){.css-1ltj86z{padding-left:5px;padding-right:5px;}}@media (min-width: 768px){.css-1ltj86z{padding-left:7.5px;padding-right:7.5px;}}@media (min-width: 1024px){.css-1ltj86z{padding-left:10px;padding-right:10px;}}@media (min-width: 1256px){.css-1ltj86z{padding-left:10px;padding-right:10px;}}@media (min-width: 1024px){.css-1ltj86z{width:66.66666666666666%;}}</style>
      <div class="css-1ltj86z e15wafbq0"><style data-emotion="css 1ecfa5v">.css-1ecfa5v{max-width:700px;margin:0 auto;padding:50px 0 0;color:#292929;}</style>
      <div class="css-1ecfa5v emjsage0">
    
         <section class="whitebox">
             
               <div class="up-box">
                 
                    <h1 class="mytitle">회원정보 수정
                        <style data-emotion="css 1vy2ypg">.css-1vy2ypg{margin-left:.4ch;color:#35c5f0;}</style>
                          
                     </h1>
                  <style data-emotion="css vxgh1s">.css-vxgh1s{margin:0 -10px;}</style>
                  <div class="css-vxgh1s e17n0xi1"></div>
                                	<div class="btn">
			</div>
               </div>
 
              
           	 <!-- 게시판의 화면은 class="card"로 적용     margin: 0 0 40px;-->


            <div class="card">
           <!-- 검색어 입력하기 -->
           <form name="regForm" id="regForm" method="post" enctype="multipart/form-data">
    <div class="container2">

    <div class="row mt-2">
        <div class="col-12">
               <div class="form-group">
    <label for="userId" style="font-size: 17px;">사용자 아이디</label>${user.userId}
</div>
          
                <div class="form-group">
                    <label for="userPwd1" style="font-size: 17px;">비밀번호</label>
                    <input type="password" class="form-control" id="userPwd1" name="userPwd1" value="${user.userPwd}" placeholder="비밀번호" maxlength="12"  />
                </div>
            
                <div class="form-group">
                    <label for="userPwd2" style="font-size: 17px;" >비밀번호 확인</label>
                    <input type="password" class="form-control" id="userPwd2" name="userPwd2" value="${user.userPwd}" placeholder="비밀번호 확인" maxlength="12"  />
                </div>
           
                 <div class="form-group" style="display: flex; align-items: center;">
    <label for="userNickname" style="font-size: 17px; flex: 1;">닉네임</label>
    <input type="text" class="form-control" id="userNickname" name="userNickname" value="${user.userNickname}" placeholder="닉네임" maxlength="15" style="flex: 2; width: 20px;" />
</div>
                <div class="form-group">
                    <label for="userName" style="font-size: 17px;" >사용자 이름</label>
                    <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="사용자 이름" maxlength="15"  />
                </div>
                <div class="form-group">
                    <label for="userEmail" style="font-size: 17px;" >사용자 이메일</label>
                    <input type="text" class="form-control" id="userEmail" name="userEmail" value="${user.userEmail}" placeholder="사용자 이메일" maxlength="30" />
                </div>
                <div class="form-group">
                  <label for="userName" style="font-size: 17px;" >전화번호</label>
             <div class="phone">
            <input id="phone1" type="text" size="1" maxlength="3" value= "phone1"> -
            <input id="phone2" type="text" size="3" maxlength="4" value= "phone2"> -
            <input id="phone3" type="text" size="3" maxlength="4" value= "phone3">
            </div>
             
             <div class="form-group2">
                <label for="profilePicture" style="font-size: 17px;">프로필 사진 수정</label>
            <input type="file" id="profilePicture" name="profilePicture" style="margin: 0 auto; display: block;" onchange="previewImage(this);" />
            
            </div>
        </div>
                <div class="form-group">
                    <label for="userAddress" style="font-size: 17px;" >사용자 주소</label>
                    <input type="text" class="form-control" id="userAddress" name="userAddress" placeholder="사용자 주소" maxlength="30" value="${user.userAddress}" />
                   <input type="text" id="sample6_postcode" placeholder="우편번호">
               <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
               <input type="text" id="sample6_address" placeholder="주소"><br>
               <input type="text" id="sample6_detailAddress" placeholder="상세주소">
               <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                     <!-- 입력 완료 버튼 -->
                <input type="button" onclick="setInputAddress()"  style="display: block; margin: 0 auto;" value="입력 완료">
                <button type="button" id="btnReg" style="width: 350px; margin: 0 auto; display: block;">등록</button>
                
                </div>
                <br>
             
                 <input type="hidden" id="userId" name="userId" value="${user.userId}" />
                <input type="hidden" id="userPwd" name="userPwd" value="" />
                <input type="hidden" id="userPhone" name="userPhone" value="" />

                <br>
          
       
    </div>
       </div>
</form>
			</div>
		


        </div>
         
 	<form name="myForm" id="myForm" method="post">
		<input type="hidden" name="commuIdk" value="" />
		<input type="hidden" name="searchValue" value="${searchValue}" />
		<input type="hidden" name="curPage" value="${curPage}" />
	</form>

           </div>
       </div>
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
 