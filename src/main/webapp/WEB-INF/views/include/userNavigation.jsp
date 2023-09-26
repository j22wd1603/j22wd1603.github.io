<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<style>

/*유저 카테고리*/

*{
font-family: 'Gothic A1', sans-serif;
}
.user-ul {
    list-style: none;
    padding: 30px;
    margin: 0;
    background-color: #ffffff;
    
    
}
.user-category-container-second {

    height: 150px;
    width: auto;
   	text-align: center; 
   	background-color: #ffffff;
    
}

.user-dropdown {
   position: relative;
   display: inline-block;
   margin-right: 20px;
   margin-left: 20px;
}
.user-dropbtn {
   font-weight: 400;
   height: 48px;
   width: 200px;
   cursor: pointer;
   font-size: 15px;
   border: none; 
   background-color: #f1f1f1; 
   border-radius: 5px; 
}

.user-dropdown-content {
  display: none;
  position: absolute;
  z-index: 1;
  font-weight: 400;
  background-color: #f9f9f9;
  min-width: 200px;
  right: 0;
  

}

.user-dropdown-content a {
  display: block;
  text-decoration: none;
  color: rgb(37, 37, 37);
  font-size: 12px;
  padding: 12px 20px;
}

.user-dropdown-content a:hover {
  background-color: #ececec;
}

.user-dropdown:hover .user-dropdown-content {
  display: block;
}

.user-dropdown:hover .user-dropdown-content {
  display: block;
}


</style>
<style>
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);


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
 

<style>

.no-questions {
  display: flex;
  justify-content: center;
  align-items: center;
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
    align-items: center; /* 내부 요소를 수직 가운데 정렬합니다. */
    border-bottom: 1px solid #ccc; /* 각 항목마다 하단에 회색 선 추가 */
     text-align: center;
     margin: auto;
     
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
  text-align: center;
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
   margin: 0;
   border: none;

}

.card-body .check , .delete{
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
   width:79%
   text-align: left;
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
}

.number li a.active {
   background-coler: rgb(252, 212, 205);
}

.btn{
   /* position: absolute; 는 절대적인 값으로 상대적인 값이 필요하다. */
   /* 상대적인 값은 전체 영역을 담당하는 class="card"에 position: relative;를 추가한다. */
   position: absolute; /*절대적인 값*/
   padding: 10px;
   margin: 10px 10px 20px 10px ;
   color: #696969;
      
   
}
.btn a{
   padding: 10px;
   background-color: #db7093;
   color: #fff;
   border-radiu: 10px;
   border-radius: 5px;
}.0

.title {
    width: 200px; /* 원하는 폭으로 설정하세요 */
    white-space: nowrap; /* 제목이 한 줄로 표시되도록 설정 */
    overflow: hidden; /* 내용이 넘칠 경우 숨김 처리 */
    text-overflow: ellipsis; /* 내용이 넘칠 경우 ...으로 표시 */
    text-align: left;
}
.whitebox{

width:800px;
margin-bottom: 100px;
}

.middlebox{
width:7px;
}

</style>



<div class="user-category-container-second">
    
        <ul class="user-ul">
           <div class="user-dropdown">
            <button class="user-dropbtn">MY</button>
            <div class="user-dropdown-content">
               <a href="/user/mypage">내 게시글</a>
              <a href="/user/mypageMyQ">질문과 답변</a>
               <a href="/user/mypageScrap">스크랩북</a>
               <a href="/user/mypageLikes">좋아요</a>
            </div>
         </div>
           
         <div class="user-dropdown">
            <button class="user-dropbtn">SHOP</button>
            <div class="user-dropdown-content">
               <a href="/user/cartPage">장바구니</a>
              <a href="/user/myShopping">주문조회</a>
               <a href="/user/mypageReview">리뷰</a>
            </div>
         </div>
         
          <div class="user-dropdown">
            <button class="user-dropbtn">SET</button>
            <div class="user-dropdown-content">
               <a href="/user/userUpdate">설정</a>
            </div>
         </div>
      </ul>
    
</div>
