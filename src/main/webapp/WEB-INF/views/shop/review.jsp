<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 작성 폼</title>
</head>
<body>
    <h1>리뷰 작성 폼</h1>
<c:forEach items="${reviewList}" var="review">
    <form action="/shop/review" method="post">
        <label for="userId">사용자 아이디:</label>
   <input type="text" name="userId" value="${userId}" readonly><br><br>
        
        <label for="productIdk">프로덕트 아이디케이:</label>
        <input type="text" name="productIdk" value="${review.productIdk}" readonly><br><br>
        
        <label for="productName">프로덕트 네임:</label>
        <input type="text" name="productName" value="${review.productName}" readonly><br><br>
        
        <label for="orderIdk">오더 아이디케이:</label>
        <input type="text" name="orderIdk" value="${review.orderIdk}" readonly><br><br>
        
        <label for="reviewContent">리뷰 컨텐트:</label>
        <textarea name="reviewContent" rows="4" cols="50"></textarea><br><br>
        
        <input type="submit" value="리뷰 작성">
    </form>
</c:forEach>

</body>
</html>