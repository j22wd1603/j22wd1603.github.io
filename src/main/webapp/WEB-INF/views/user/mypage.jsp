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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/293152e236.js"></script>

<style>
.card {
	box-shadow: 3px 3px 50px #e6e6e6;
	border-radius:20px;
	position: relative;
    display: inline-block;
    border-radius: 20px;
    text-align:center;
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

 .title {
  
    white-space: nowrap; /* 제목이 한 줄로 표시되도록 설정 */
    text-overflow: ellipsis; /* 내용이 넘칠 경우 ...으로 표시 */
    display: flex;
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
            -webkit-align-items: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: justify;
            -webkit-justify-content: space-between;
            justify-content: space-between;
            margin: 0 0 20px;
        }

.no-questions {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 300px; /* 필요한 높이 값으로 조정하세요. */
  font-size: 18px;
  color: #333;
}

.content-box{
	display: flex; /* Flexbox 컨테이너로 설정합니다. */
  	justify-content: space-between; /* 내부 요소 사이에 공간을 균등하게 분배합니다. */
 	align-items: center; /* 내부 요소를 수직 가운데 정렬합니다. */
 	border-bottom: 1px solid #ccc; /* 각 항목마다 하단에 회색 선 추가 */
  	text-align: center;
  	margin: auto;
  	
}

.up-box {
        display: flex;
    -webkit-font-smoothing: antialiased;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    justify-content: space-between;
    margin: 0 0 40px;
    padding: 10px 0 10px;
    border-bottom: 1px solid #ededed;

}
.num, .title, .date, .count, .delete {
  	flex: 1; /* 요소들이 동일한 너비로 가로 정렬되도록 설정 */
    display: flex; /* .num 요소들 내부에서도 정렬을 수행 */
    justify-content: center; /* 가운데 정렬 */
    align-items: center;
    
}

/* 마지막 항목에는 선 제거 */
.content-box:last-child {
    border-bottom: none;
}

.card-body{
  border-bottom: 1px solid #ccc; /* 각 항목마다 하단에 회색 선 추가 */
  padding: 20px; /* 내용 주위의 간격 조정 */
  text-align: center;
  padding-bottom: 10px; /* 가로 선과 컨텐츠 사이의 간격 조절 (선택 사항) */
  width: 100%;
}



.card-body div{

	border-bottm: 1px solid #e6e6e6;
	
}

.card-body div div {

	display: inline-block;
	padding: 15px 10px 15px 10px;
	margin: 0;
	border: none;   
  

}

.card-body .check .delete{
	width: 7%;
}

.css-vxgh1s e17n0xi1 {
display: flex;
    -webkit-font-smoothing: antialiased;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    justify-content: space-between;
    margin: 0 0 40px;
    padding: 10px 0 10px;
    border-bottom: 1px solid #ededed;
}

.card-body .title{
	width:150%;
	overflow: hidden; 
}


.card-body .delete button{
	background-color: #fff;
	border: none;
}

.num{
		text-align: center;

}
.number{
padding: 10px;
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
	color:#6c757d;
}

.number li a.active {
	background-coler: rgb(252, 212, 205);
}

.userbtn{
    font-size: 16px;
    margin-top: 0;
    margin-bottom: 0.5rem;
    font-weight: 600;
    line-height: 1.2;
    color: #8b1411;
    padding-left: 700px;
    padding-right: 20px;

}

.userbtn a{
	padding: 10px;
	background-color: #8b1411;
	color: #fff;
	border-radiu: 10px;
	border-radius: 5px;
}.0

.title {
    width: 100px; /* 원하는 폭으로 설정하세요 */
    white-space: nowrap; /* 제목이 한 줄로 표시되도록 설정 */
    overflow: hidden; /* 내용이 넘칠 경우 숨김 처리 */
    text-overflow: ellipsis; /* 내용이 넘칠 경우 ...으로 표시 */
    text-align: left;
    text-overflow: ellipsis;
    
}
.whitebox{

	width:800px;
	margin-bottom: 100px;
	flex-direction: column;

}
.middlebox{

	width:7px;
	
}
.mytitle {
text-align: left;
	color:#000000;
	font-weight:bold;
	font-size:18px;
	line-height:1; 
}

</style>
<script type="text/javascript">
var checkValue = "";

$(document).ready(function() {
	
});

function fn_mySearch()
{
	document.myForm.commuIdk.value = "";
	document.myForm.searchValue.value = $("#_searchValue").val();
	document.myForm.curPage.value = "1";
	document.myForm.action = "/user/mypage";
	document.myForm.submit();
}

function fn_list(curPage)
{
	document.myForm.commuIdk.value = "";
	document.myForm.curPage.value = curPage;
	document.myForm.action = "/user/mypage";
	document.myForm.submit();
}


function fn_boardDelete(idk)
{
	
	if(confirm("게시물을 삭제 하시겠습니까?") == true)
	{
		$.ajax({
			type:"POST",
			url:"/community/myDelete",
			data:{
				commuIdk:idk
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
					alert("게시물이 삭제 되었습니다.");
					location.href = "/user/mypage";
				}
				else if(response.code == 400)
				{
					alert("파라미터 값이 올바르지 않습니다.");
				}
				else if(response.code == 403)
				{
					alert("본인글이 아니므로 삭제할수 없습니다.");
				}
				else if(response.code == 404)
				{
					alert("해당 게시물을 찾을수 없습니다.");
					location.href = "/user/mypage";
				}
				else if(response.code == -999)
				{
					alert("답변 게시물이 존재하여 삭제할수 없습니다.");
				}
				else
				{
					alert("게시물 삭제시 오류가 발생하였습니다.");
				}
			},
			error:function(xhr, status, error)
			{
				icia.common.error(error);
			}
		});
	}
}

$(function(){
    var chkObj = document.getElementsByName("RowCheck");
    var rowCnt = chkObj.length;

    $("input[name='RowCheck']").click(function(){
        if($("input[name='RowCheck']:checked").length == rowCnt){
            $("input[name='allCheck']")[0].checked = true;
        }
        else{
            $("input[name='allCheck']")[0].checked = false;
        }
    });
});
    function deleteValue(){
        var valueArr = new Array();
        var list = $("input[name='RowCheck']");
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

        if(checkValue == "")		//if(valueArr.length == 0){
        {
            alert("선택된 게시물이 없습니다.");
        }
        else{
            var chk = confirm("게시물을 삭제하시겠습니까?");
            if (chk) {
            $.ajax({
                type:"POST",
                url:"/community/mySelectDelete",
                data:{
                    valueArr : checkValue		//valueArr // 보내고자 하는 data 변수 설정 
                },
                datatype:"JSON",
                beforeSend:function(xhr)
                {
                    xhr.setRequestHeader("AJAX", "true");    
                },
                success:function(jdata){
                    if(jdata.code === 0) {
                        alert("삭제되었습니다.");
                        location.replace("/user/mypage"); //list로 페이지 새로 고침            
                    }
                    else{
                        alert("삭제되지 않았습니다.");    
                    }
                }
            });
            } else {
                // 사용자가 "취소"를 클릭한 경우에 대한 처리
              
            }
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
            <a class="css-1p9dybm e1q26atk3" href="/user/mypageMyQ">
               <div class="css-zpotx6 e1q26atk2">
                  <svg width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
                     <path fill="#424242" fill-rule="nonzero" d="M22.588 3H1.413C.633 3 0 3.638 0 4.426L0 9.53l.605-.088c.12-.017.243-.026.367-.026 1.413 0 2.558 1.157 2.558 2.584S2.385 14.584.972 14.584c-.124 0-.247-.009-.367-.026L0 14.47l.001 5.104C.001 20.362.633 21 1.413 21h21.175c.78 0 1.412-.638 1.412-1.426V4.426C24 3.638 23.368 3 22.588 3zM1.413 4.07h21.175c.195 0 .353.159.353.356v15.148c0 .197-.158.357-.353.357H1.413l-.071-.008c-.161-.033-.282-.176-.282-.349l-.002-3.923-.086.002c1.997 0 3.617-1.635 3.617-3.653l-.004-.182C4.493 9.945 3.006 8.443 1.152 8.35l-.094-.003.002-3.922c0-.197.158-.357.353-.357zm14.646 2.138c.293 0 .53.237.53.53v1.614c0 .292-.237.53-.53.53-.292 0-.53-.238-.53-.53V6.737c0-.292.238-.53.53-.53zm0 4.455c.293 0 .53.237.53.53v1.614c0 .293-.237.53-.53.53-.292 0-.53-.237-.53-.53v-1.614c0-.293.238-.53.53-.53zm0 4.456c.293 0 .53.237.53.53v1.614c0 .292-.237.53-.53.53-.292 0-.53-.238-.53-.53v-1.615c0-.292.238-.53.53-.53z"></path>
                  </svg>
               </div>
                        <div class="css-10ewlqi e1q26atk1">내 질문</div>
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
                 
                    <h1 class="mytitle">내 게시글

                          <c:choose>
						    <c:when test="${empty list}">
						        <span class="css-1vy2ypg e17n0xi0">0</span>
						    </c:when>
						    <c:otherwise>
						        <c:set var="postCount" value="0" />
						        <c:forEach var="commuMy" items="${list}">
						            <!-- 게시물이 있을 때마다 게시물 갯수 1씩 증가 -->
						            <c:set var="postCount" value="${postCount + 1}" />
						        </c:forEach>
						        <!-- 게시물 갯수를 출력 -->
						        <span class="css-1vy2ypg e17n0xi0">${postCount}</span>
						    </c:otherwise>
						</c:choose>
                     </h1>
                  <div class="css-vxgh1s e17n0xi1"></div>
                 <div class="userbtn"><a href="/community/writeForm">글쓰기</a></div>
               </div>
 
              
           	 <!-- 게시판의 화면은 class="card"로 적용     margin: 0 0 40px;-->
<c:if test="${empty list}">
  <div class="no-questions">
    내 게시글이 없습니다.
  </div>
</c:if>
<c:if test="${not empty list}">

          <div class="card">
			  <!-- 검색어 입력하기 -->
			  <div class="card-body">
			    <input type="search" id="_searchValue" name="_searchValue" value="${searchValue}" placeholder="검색어를 입력하세요.">
			    <a class="search" style="background-color:#8b1411;" href="javascript:void(0)" onclick="fn_mySearch()">검색</a>
			    
			  <!-- 내용을 html로 작성하기 -->
			 
			  <div class="content-box">
			  	<div class="check">선택삭제</div>
			  
			  	<div class="num">글번호</div>
			  	<div class="title" style="text-align: center;">제목</div>
			  	<div class="date">작성일</div>
			  	<div class="count">조회</div>
			  	<div class="delete">삭제</div>
			  </div>
			  
			  
<c:if test="${!empty list}">	
	<c:forEach var="commuMy" items="${list}" varStatus="status">	
			  <div class="content-box">
			    <div class="check"><input type="checkbox" name="RowCheck" value="${commuMy.commuIdk}"></div>
			    <div class="num">${commuMy.commuIdk}</div>
			     <div class="title"><a href="/community/view?commuIdk=${commuMy.commuIdk}">${commuMy.commuTitle}</a></div>
			    <div class="date">${commuMy.regDate}</div>
			    <div class="count"><fmt:formatNumber type="number" maxFractionDigits="3" value="${commuMy.commuViews}" /></div>
			    <div class="delete"><button class="btnDelete" onClick="fn_boardDelete(${commuMy.commuIdk})"><i class="fa-solid fa-trash-can"></i></button></div>
			  </div>
	</c:forEach>
</c:if>		  

			   </div>
  
<c:if test="${!empty paging}">	
			  <ul class="number" style="margin:auto;">	
	<c:if test="${paging.prevBlockPage gt 0}">
			<li><a href="javascript:void(0)" style="color:#6c757d;" onclick="fn_list(${paging.prevBlockPage})">&lt;</a></li>
	</c:if>
	
	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
		<c:choose>
			<c:when test="${i ne curPage}">
			<li><a href="javascript:void(0)" style="color:#6c757d;" onclick="fn_list(${i})">${i}</a></li>
			</c:when>
			<c:otherwise>
			<li><a href="javascript:void(0)" style="color:#6c757d;" class="active">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<c:if test="${paging.nextBlockPage gt 0}">
		    <li><a href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})">&gt;</a></li>
	</c:if>
			   </ul>
</c:if>
			  

			</div>
			</c:if>
		

</section>
        </div>
         
 	<form name="myForm" id="myForm" method="post">
		<input type="hidden" name="commuIdk" value="" />
		<input type="hidden" name="searchValue" value="${searchValue}" />
		<input type="hidden" name="curPage" value="${curPage}" />
	</form>

           </div>
       </div>
       </div>
       

 </body>
 </html>
 