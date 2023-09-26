<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">

<script>

</script>
</head>
 
<body> 
	<header>
		<nav>
			<!-- 상세 카테고리-->
			<div class="category-container">
			    <ul>
						<c:if test="${shopTabCode eq 'A'}">
						      <li><a href="/shop/product?shopTabCode=A">ALL</a></li>
						      <li><a href="/shop/product?shopTabCode=A&shopDetailTabCode=AA">BED</a></li>
						      <li><a href="/shop/product?shopTabCode=A&shopDetailTabCode=AB">SOFA</a></li>
						      <li><a href="/shop/product?shopTabCode=A&shopDetailTabCode=AC">STORAGE</a></li>
						      <li><a href="/shop/product?shopTabCode=A&shopDetailTabCode=AD">CHAIR</a></li>
						      <li><a href="/shop/product?shopTabCode=A&shopDetailTabCode=AE">TABLE</a></li>
						</c:if>
						
						<c:if test="${shopTabCode eq 'B'}">
						      <li><a href="/shop/product?shopTabCode=B">ALL</a></li>
						      <li><a href="/shop/product?shopTabCode=B&shopDetailTabCode=BA">TV</a></li>
						      <li><a href="/shop/product?shopTabCode=B&shopDetailTabCode=BB">냉장고</a></li>
						      <li><a href="/shop/product?shopTabCode=B&shopDetailTabCode=BC">세탁기&건조기</a></li>
						      <li><a href="/shop/product?shopTabCode=B&shopDetailTabCode=BD">에어컨</a></li>
						      <li><a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE">주방가전</a></li>
						</c:if>
						
						<c:if test="${shopTabCode eq 'C'}">
						      <li><a href="/shop/product?shopTabCode=C">ALL</a></li>
						      <li><a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA">조명</a></li>
						      <li><a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB">패브릭</a></li>
						      <li><a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC">데코&식물</a></li>
						</c:if>
			     </ul>
			  
			 <div class="category-container-second">
				 <ul>
				 		<c:if test="${shopTabCode eq 'A'&& shopDetailTabCode eq ''}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								      <a href="/shop/product?shopTabCode=A&orderBy=regDate_desc">NEW</a>
									  <a href="/shop/product?shopTabCode=A&orderBy=productPrice_desc">Price(High)</a>
								      <a href="/shop/product?shopTabCode=A&orderBy=productPrice_asc">Price(Low)</a>
							 	  </div>
							 </div>
				    		 
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=A&productBrandName=ARTIZAC">ARTIZAC</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=AUDO COPENHAGEN">AUDO COPENHAGEN</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=BOSSE">BOSSE</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=CANE COLLECTION">CANE COLLECTION</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=CHALSFURNITURE">CHALSFURNITURE</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=COTE TABLE">COTE TABLE</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=CUERO DESIGN">CUERO DESIGN</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=EMU">EMU</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=ESTERN EDITION">ESTERN EDITION</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=FATBOY">FATBOY</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=FERM LIVING FURNITURE">FERM LIVING FURNITURE</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=GERVASONI">GERVASONI</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=HAY">HAY</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=JACKSON CHAMELEON">JACKSON CHAMELEON</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=KOBEOMSUK">KOBEOMSUK</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=MANUFACT">MANUFACT</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=MASSPRODUCTIONS">MASSPRODUCTIONS</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=MOJOW">MOJOW</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=MONTANA">MONTANA</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=POLSPOTTEN">POLSPOTTEN</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=ROSAMANSION">ROSAMANSION</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=SEESAY">SEESAY</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=STELLA WORKS">STELLA WORKS</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=TACCHINI">TACCHINI</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=TECTA">TECTA</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=TOILETPAPER HOME">TOILETPAPER HOME</a>
							       <a href="/shop/product?shopTabCode=A&productBrandName=ZANOTTA">ZANOTTA</a>
							     </div>
							 </div>   
						</c:if>	 
				    	<c:if test="${shopTabCode eq 'A'&& shopDetailTabCode eq 'AA'}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								      <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AA&regDate=orderby desc">NEW</a>
								       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AA&orderBy=productPrice_desc">Price(High)</a>
								      <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AA&orderBy=productPrice_asc">Price(Low)</a>
							 	  </div>
							 </div>
				    		 
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AA&productBrandName=CANE COLLECTION">CANE COLLECTION</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AA&productBrandName=CHALSFURNITURE">CHALSFURNITUREN</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AA&productBrandName=COTE TABLE">COTE TABLE</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AA&productBrandName=ESTERN EDITION">ESTERN EDITION</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AA&productBrandName=GERVASONI">GERVASONI</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AA&productBrandName=ROSAMANSIONE">ROSAMANSION</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AA&productBrandName=SEESAY">SEESAY</a>
							     </div>
							 </div>   
						</c:if>	 
						
						<c:if test="${shopTabCode eq 'A'&& shopDetailTabCode eq 'AB'}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								      <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AB&regDate=orderby desc">NEW</a>
								       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AB&orderBy=productPrice_desc">Price(High)</a>
								      <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AB&orderBy=productPrice_asc">Price(Low)</a>
							 	  </div>
							 </div>
				    		 
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AB&productBrandName=JACKSON CHAMELEON">JACKSON CHAMELEON</a>
							     </div>
							 </div>   
						</c:if>	
						
							<c:if test="${shopTabCode eq 'A'&& shopDetailTabCode eq 'AC'}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								      <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AC&regDate=orderby desc">NEW</a>
								       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AC&orderBy=productPrice_desc">Price(High)</a>
								      <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AC&orderBy=productPrice_asc">Price(Low)</a>
							 	  </div>
							 </div>
				    		 
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AC&productBrandName=ARTIZAC">ARTIZAC</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AC&productBrandName=AUDO COPENHAGEN">AUDO COPENHAGEN</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AC&productBrandName=BOSSE">BOSSE</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AC&productBrandName=COTE TABLE">COTE TABLE</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AC&productBrandName=JACKSON CHAMELEON">JACKSON CHAMELEON</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AC&productBrandName=KOBEOMSUK">KOBEOMSUK</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AC&productBrandName=MONTANA">MONTANA</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AC&productBrandName=SEESAY">SEESAY</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AC&productBrandName=STELLA WORKS">STELLA WORKS</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AC&productBrandName=TECTA">TECTA</a>
							     </div>
							 </div>   
						</c:if>	
					
						<c:if test="${shopTabCode eq 'A'&& shopDetailTabCode eq 'AD'}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								    <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AD&regDate=orderby desc">NEW</a>
								       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AD&orderBy=productPrice_desc">Price(High)</a>
								      <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AD&orderBy=productPrice_asc">Price(Low)</a>
							 	  </div>
							 </div>
				    		 
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AD&productBrandName=CUERO DESIGN">CUERO DESIGN</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AD&productBrandName=EMU">EMU</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AD&productBrandName=FATBOY">FATBOY</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AD&productBrandName=MANUFACT">MANUFACT</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AD&productBrandName=MOJOW">MOJOW</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AD&productBrandName=POLSPOTTEN">POLSPOTTEN</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AD&productBrandName=TECTA">TECTA</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AD&productBrandName=TOILETPAPER HOME">TOILETPAPER HOME</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AD&productBrandName=ZANOTTA">ZANOTTA</a>
							      </div>
							 </div>   
						</c:if>	
						
						<c:if test="${shopTabCode eq 'A'&& shopDetailTabCode eq 'AE'}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								      <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AE&regDate=orderby desc">NEW</a>
								       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AE&orderBy=productPrice_desc">Price(High)</a>
								      <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AE&orderBy=productPrice_asc">Price(Low)</a>
							 	  </div>
							 </div>
				    		 
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AE&productBrandName=BOSSE">BOSSE</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AE&productBrandName=CHALSFURNITURE">CHALSFURNITURE</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AE&productBrandName=COTE TABLE">COTE TABLE</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AE&productBrandName=FERM LIVING FURNITURE">FERM LIVING FURNITURE</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AE&productBrandName=HAY">HAY</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AE&productBrandName=MASSPRODUCTIONS">MASSPRODUCTIONS</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AE&productBrandName=TACCHINI">TACCHINI</a>
							       <a href="/shop/product?shopTabCode=A&shopDetailTabCode=AE&productBrandName=TECTA">TECTA</a>
							      </div>
							 </div>   
						</c:if>	
						
						
						<c:if test="${shopTabCode eq 'B' && shopDetailTabCode eq ''}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								       <a href="/shop/product?shopTabCode=B&orderBy=regDate_desc">NEW</a>
									   <a href="/shop/product?shopTabCode=B&orderBy=productPrice_desc">Price(High)</a>
								       <a href="/shop/product?shopTabCode=B&orderBy=productPrice_asc">Price(Low)</a>

							 	  </div>
							 </div>
				    		 
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=B&productBrandName=BALMUDA">BALMUDA</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=BORAL">BORAL</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=CARRIER">CARRIER</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=COOING">COOING</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=CUCKOO">CUCKOO</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=ESTRA">ESTRA</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=FINALKITCHEN">FINALKITCHEN</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=HAIER">HAIER</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=ILLY">ILLY</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=INNOS">INNOS</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=IRIVER">IRIVER</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=KANU">KANU</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=KICHEN">KICHEN</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=KIZEN">KIZEN</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=LACUZIN">LACUZIN</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=LG">LG</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=LIKEME">LIKEME</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=LOCKNLOCK">LOCKNLOCK</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=LUCOMS">LUCOMS</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=MIELE">MIELE</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=MINIX">MINIX</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=MOSH">MOSH</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=NESPRESSO">NESPRESSO</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=QUEENSENSE">QUEENSENSE</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=SAMSUNG">SAMSUNG</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=THEHAAM">THEHAAM</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=VOAR">VOAR</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=WIDEVIEW">WIDEVIEW</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=WINIA">WINIA</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=ZEVEN">ZEVEN</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=딜팩토리">딜팩토리</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=보쉬">보쉬</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=신일전자">신일전자</a>
							       <a href="/shop/product?shopTabCode=B&productBrandName=캠트래블">캠트래블</a>
							       
								 </div>
							 </div>   
						</c:if>	     
						  
						<c:if test="${shopTabCode eq 'B'&& shopDetailTabCode eq 'BA'}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BA&orderBy=regDate_desc">NEW</a>
									   <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BA&orderBy=productPrice_desc">Price(High)</a>
								       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BA&orderBy=productPrice_asc">Price(Low)</a>
								  </div>
							 </div>
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BA&productBrandName=ESTRA">ESTRA</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BA&productBrandName=INNOS">INNOS</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BA&productBrandName=IRIVER">IRIVER</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BA&productBrandName=LG">LG</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BA&productBrandName=LIKEME">LIKEME</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BA&productBrandName=LUCOMS">LUCOMS</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BA&productBrandName=SAMSUNG">SAMSUNG</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BA&productBrandName=THEHAAM">THEHAAM</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BA&productBrandName=WIDEVIEW">WIDEVIEW</a>
							       </div>
							 </div>   
						</c:if>	
						
						<c:if test="${shopTabCode eq 'B'&& shopDetailTabCode eq 'BB'}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BB&orderBy=regDate_desc">NEW</a>
									   <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BB&orderBy=productPrice_desc">Price(High)</a>
								       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BB&orderBy=productPrice_asc">Price(Low)</a>
							 	  </div>
							 </div>
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BB&productBrandName=CARRIER">CARRIER</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BB&productBrandName=COOING">COOING</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BB&productBrandName=HAIER">HAIER</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BB&productBrandName=LG">LG</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BB&productBrandName=SAMSUNG">SAMSUNG</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BB&productBrandName=WINIA">WINIA</a>
							       
							       </div>
							 </div>   
						</c:if>	
						
						<c:if test="${shopTabCode eq 'B'&& shopDetailTabCode eq 'BC'}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BC&orderBy=regDate_desc">NEW</a>
									   <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BC&orderBy=productPrice_desc">Price(High)</a>
								       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BC&orderBy=productPrice_asc">Price(Low)</a>
							 	  </div>
							 </div>
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BC&productBrandName=COOING">COOING</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BC&productBrandName=LG">LG</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BC&productBrandName=MIELE">MIELE</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BC&productBrandName=SAMSUNG">SAMSUNG</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BC&productBrandName=WINIX">WINIX</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BC&productBrandName=보쉬">보쉬</a>
							      </div>
							 </div>   
						</c:if>	
						
						<c:if test="${shopTabCode eq 'B'&& shopDetailTabCode eq 'BD'}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BD&orderBy=regDate_desc">NEW</a>
									   <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BD&orderBy=productPrice_desc">Price(High)</a>
								       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BD&orderBy=productPrice_asc">Price(Low)</a>
							 	  </div>
							 </div>
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BD&productBrandName=CARRIER">CARRIER</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BD&productBrandName=CUCKOO">CUCKOO</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BD&productBrandName=LG">LG</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BD&productBrandName=SAMSUNG">SAMSUNG</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BD&productBrandName=WINIA">WINIA</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BD&productBrandName=딜팩토리">딜팩토리</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BD&productBrandName=신일전자">신일전자</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BD&productBrandName=캠트래블">캠트래블</a>
							      </div>
							 </div>   
						</c:if>	
						
						
						<c:if test="${shopTabCode eq 'B'&& shopDetailTabCode eq 'BE'}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&orderBy=regDate_desc">NEW</a>
									   <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&orderBy=productPrice_desc">Price(High)</a>
								       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&orderBy=productPrice_asc">Price(Low)</a>
							 	  </div>
							 </div>
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=BALMUDA">BALMUDA</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=BORAL">BORAL</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=CUCKOO">CUCKOO</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=FINALKITCHEN">FINALKITCHEN</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=ILLY">ILLY</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=KANU">KANU</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=KICHEN">KICHEN</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=KIZEN">KIZEN</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=LACUZIN">LACUZIN</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=LOCKNLOCK">LOCKNLOCK</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=MINIX">MINIX</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=MOSH">MOSH</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=NESPRESSO">NESPRESSO</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=QUEENSENSE">QUEENSENSE</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=SAMSUNG">SAMSUNG</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=VOAR">VOAR</a>
							       <a href="/shop/product?shopTabCode=B&shopDetailTabCode=BE&productBrandName=ZEVEN">ZEVEN</a>
							      </div>
							 </div>   
						</c:if>	
						
						
						<c:if test="${shopTabCode eq 'C'&& shopDetailTabCode eq ''}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								       <a href="/shop/product?shopTabCode=C&orderBy=regDate_desc">NEW</a>
									   <a href="/shop/product?shopTabCode=C&orderBy=productPrice_desc">Price(High)</a>
								       <a href="/shop/product?shopTabCode=C&orderBy=productPrice_asc">Price(Low)</a>
							 	  </div>
							 </div>
				    		 
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
								       <a href="/shop/product?shopTabCode=C&productBrandName=MJK">MJK</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=MUJI">MUJI</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=WE ART">WE ART</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=나티아스민">나티아스민</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=노르딕슬립">노르딕슬립</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=데일리오브젝트">데일리오브젝트</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=뢴베크말">뢴베크말</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=뢴스테브말">뢴스테브말</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=루이스 폴센">루이스 폴센</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=마르셋">마르셋</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=메누">메누</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=미우크돈">미우크돈</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=브란들리아이불">브란들리아이불</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=셰르크니프로트">셰르크니프로트</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=셰른브레카">셰른브레카</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=쇠데르셴">쇠데르셴</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=스모스포레">스모스포레</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=슬램프">슬램프</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=아둥놀이터">아둥놀이터</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=아르떼미데">아르떼미데</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=아르텍">아르텍</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=아브스킬드라">아브스킬드라</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=알름셰른">알름셰른</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=양키캔들">양키캔들</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=영이오브제">영이오브제</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=올루체">올루체</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=울비데">울비데</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=이케아">이케아</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=조말론">조말론</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=카드릴리">카드릴리</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=카르텔">카르텔</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=코코도르">코코도르</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=코코플라워">코코플라워</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=크바른벤">크바른벤</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=트레단센">트레단센</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=티에라선인장">티에라선인장</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=파라칠나">파라칠나</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=판둘">판둘</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=페르시스크 믹스">페르시스크 믹스</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=페르시스크 셸림 가스가이">페르시스크 셸림 가스가이</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=포스카리니">포스카리니</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=폰타나 아르떼">폰타나 아르떼</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=프락틀뤼싱">프락틀뤼싱</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=프리츠한센">프리츠한센</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=플로스">플로스</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=피아바">피아바</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=피엘하브레">피엘하브레</a>
								       <a href="/shop/product?shopTabCode=C&productBrandName=헤이">헤이</a>
							     </div>
							 </div>   
						</c:if>	 
						
							<c:if test="${shopTabCode eq 'C'&& shopDetailTabCode eq 'CA'}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&orderBy=regDate_desc">NEW</a>
									   <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&orderBy=productPrice_desc">Price(High)</a>
								       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&orderBy=productPrice_asc">Price(Low)</a>
							 	  </div>
							 </div>
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=루이스 폴센">루이스 폴센</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=마르셋">마르셋</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=메누">메누</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=슬램프">슬램프</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=아르떼미데">아르떼미데</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=아르텍">아르텍</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=올루체">올루체</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=카르텔">카르텔</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=파라칠나">파라칠나</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=판둘">판둘</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=포스카리니">포스카리니</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=폰타나 아르떼">폰타나 아르떼</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=프리츠한센">프리츠한센</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=플로스">플로스</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CA&productBrandName=헤이">헤이</a>
							      </div>
							 </div>   
						</c:if>	
						
							<c:if test="${shopTabCode eq 'C'&& shopDetailTabCode eq 'CB'}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&orderBy=regDate_desc">NEW</a>
									   <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&orderBy=productPrice_desc">Price(High)</a>
								       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&orderBy=productPrice_asc">Price(Low)</a>
							 	  </div>
							 </div>
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=MUJI">MUJI</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=나티아스민">나티아스민</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=노르딕슬립">노르딕슬립</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=뢴베크말">뢴베크말</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=뢴스테브말">뢴스테브말</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=미우크돈">미우크돈</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=브란들리아이불">브란들리아이불</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=셰르크니프로트">셰르크니프로트</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=셰른브레카">셰른브레카</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=쇠데르셴">쇠데르셴</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=스모스포레">스모스포레</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=아브스킬드라">아브스킬드라</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=알름셰른">알름셰른</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=울비데">울비데</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=이케아">이케아</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=카드릴리">카드릴리</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=크바른벤">크바른벤</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=트레단센">트레단센</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=페르시스크 믹스">페르시스크 믹스</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=페르시스크 셸림 가스가이">페르시스크 셸림 가스가이</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=프락틀뤼싱">프락틀뤼싱</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CB&productBrandName=피엘하브레">피엘하브레</a>
							     </div>
							 </div>   
						</c:if>	
						
									<c:if test="${shopTabCode eq 'C'&& shopDetailTabCode eq 'CC'}">	 
				    		 <div class="dropdown">
							      <button class="dropbtn">OPTION</button>
							      <div class="dropdown-content">
								       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC&orderBy=regDate_desc">NEW</a>
									   <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC&orderBy=productPrice_desc">Price(High)</a>
								       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC&orderBy=productPrice_asc">Price(Low)</a>
							 	  </div>
							 </div>
				    		 
				    		 <div class="dropdown">
							      <button class="dropbtn">BRAND</button>
							      <div class="dropdown-content">
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC&productBrandName=MJK">MJK</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC&productBrandName=WE ART">WE ART</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC&productBrandName=데일리오브젝트">데일리오브젝트</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC&productBrandName=아둥놀이터">아둥놀이터</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC&productBrandName=양키캔들">양키캔들</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC&productBrandName=영이오브제">영이오브제</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC&productBrandName=조말론">조말론</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC&productBrandName=코코도르">코코도르</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC&productBrandName=코코플라워">코코플라워</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC&productBrandName=티에라선인장">티에라선인장</a>
							       <a href="/shop/product?shopTabCode=C&shopDetailTabCode=CC&productBrandName=피아바">피아바</a>
							     </div>
							 </div>   
						</c:if>	     
				 </ul>
			</div>
		</div>
	</nav>	
</header>

	
	<!-- 모든 네비 아래 제품 보여주는 단 -->	
<section>
	<div class="container-xxl py-5">
		<div class="container">
			 <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
			 
				<c:if test="${shopTabCode eq 'A'}">
				      <h4 class="category-title">FURNITURE</h4>
				      <h1 class="big-title">가구</h1>
				            
					<c:if test="${shopDetailTabCode eq 'AA'}">
					             <h1 class="small-title">침대</h1>
					</c:if>
					<c:if test="${shopDetailTabCode eq 'AB'}">
					             <h1 class="small-title">쇼파</h1>
					</c:if>
					<c:if test="${shopDetailTabCode eq 'AC'}">
					             <h1 class="small-title">수납</h1>
					</c:if>
					<c:if test="${shopDetailTabCode eq 'AD'}">
					             <h1 class="small-title">의자</h1>
					</c:if>
					<c:if test="${shopDetailTabCode eq 'AE'}">
					             <h1 class="small-title">테이블</h1>
					</c:if>
				</c:if>
				
				<c:if test="${shopTabCode eq 'B'}">
				      <h4 class="category-title">ELECTRONICES</h4>
				      <h1 class="big-title">가전</h1>
				            
					<c:if test="${shopDetailTabCode eq 'BA'}">
					             <h1 class="small-title">TV</h1>
					</c:if>
					<c:if test="${shopDetailTabCode eq 'BB'}">
					             <h1 class="small-title">냉장고</h1>
					</c:if>
					<c:if test="${shopDetailTabCode eq 'BC'}">
					             <h1 class="small-title">세탁기&건조기</h1>
					</c:if>
					<c:if test="${shopDetailTabCode eq 'BD'}">
					             <h1 class="small-title">에어컨</h1>
					</c:if>
					<c:if test="${shopDetailTabCode eq 'BE'}">
					             <h1 class="small-title">주방가전</h1>
					</c:if>
				</c:if>
				
				<c:if test="${shopTabCode eq 'C'}">
				      <h4 class="category-title">STUFF</h4>
				      <h1 class="big-title">잡화</h1>
				            
					<c:if test="${shopDetailTabCode eq 'CA'}">
					             <h1 class="small-title">조명</h1>
					</c:if>
					<c:if test="${shopDetailTabCode eq 'CB'}">
					             <h1 class="small-title">패브릭</h1>
					</c:if>
					<c:if test="${shopDetailTabCode eq 'CC'}">
					             <h1 class="small-title">데코&식물</h1>
					</c:if>
				</c:if>
		   </div>
		   
		   
		   	<!-- 제품 이미지 뿌려주는 단 -->
		        <div class="row g-0 team-items">
				   <c:forEach var="shop" items="${list}">
					    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
					        <div class="team-item position-relative">
					            <div class="position-relative">
					                <a href="/shop/productDetail?productIdk=${shop.productIdk}">
					                    <img class="img-fluid" src="/resources/images/product/small/${shop.productCode}.${shop.productFileExt}" alt="${shop.productName}"
					                        onmouseover="this.src='/resources/images/product/big/${shop.productCode}.${shop.productFileExt}'"
					                        onmouseout="this.src='/resources/images/product/small/${shop.productCode}.${shop.productFileExt}'">
					                </a>
					            </div>
					           <div class="bg-light text-center p-4">
								    <h3 class="mt-2">${shop.productName}</h3>
								    <span class="text-primary">${shop.productBrandName}</span></br>
								
								</div>
					        </div>
					    </div>
					</c:forEach>
				</div>
		</div>
	</div>
</section>
</body>
</html>