<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">

<!-- JavaScript 코드 추가 -->
<script>

</script>

</head>
<body>
    <div class="review-body">
        <header>
            <h1 id="review-title">REVIEW</h1>
        </header>
        <main>
            <section class="review-form">
                <h2>리뷰 작성</h2>
                <form  id="reviewForm"> 
                    <div class="form-group">
                        <label for="username">ID:</label>
                        <input type="text" id="username" name="username" required>
                         <label for="productname">제품명:</label>
                        <input type="text" id="productname" name="productname" required>
                    </div>
                    
                    
                    <div class ="star_rating">
					  <span class="star on" value="1"> </span>
					  <span class="star" value="2"> </span>
					  <span class="star" value="3"> </span>
					  <span class="star" value="4"> </span>
					  <span class="star" value="5"> </span>
					</div>
                    
                    
                    
                    
                    <div class="form-group">
                        <label for="rating">별점:</label>
                        <select id="rating" name="rating">
                            <option value="5">5</option>
                            <option value="4">4</option>
                            <option value="3">3</option>
                            <option value="2">2</option>
                            <option value="1">1</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="review">리뷰 내용:</label>           
                        <input type="text" id="reviewContent" name="reviewContent" placeholder="리뷰 내용" required>
                    </div>
                    <button type="submit">리뷰 작성</button>
                </form>
            </section>
        </main>
        
        
        
<script>
$(document).ready(function() {
    $('#reviewForm').submit(function(e) {
        e.preventDefault(); // 폼 제출을 중지

        var reviewContent = $('#reviewContent').val();

     
        $.ajax({
            type: 'POST',
            url: '/shop/review', 
            data: { reviewContent: reviewContent }, 
            success: function(response) {
                if (response.status === 0) {
                    alert('리뷰가 등록되었습니다.');
                    
                } else {
                    alert('리뷰 등록 중 오류가 발생했습니다.');
                   
                }
            },
            error: function(xhr, status, error) {
                console.error('Ajax 요청 오류:', error);
            }
        });
    });
});
</script>        
      
</body>
</html>