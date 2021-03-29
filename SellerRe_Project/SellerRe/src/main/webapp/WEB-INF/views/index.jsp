<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   
   <!-- CSS -->
   <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/index(css).css">
   <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bxslider.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/inc/topbar(css).css">
	
	<!-- Jquery -->
	<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
	 
	<!-- BX Slider -->
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	
	<!-- JS -->   
	<script src="${pageContext.request.contextPath }/assets/js/product_priceReplace.js"></script>
    
    <script type="text/javascript">
       $(document).ready(function() {
          $(".slider").bxSlider({
             auto : true,
             speed : 300,
             mode : 'fade',
             infiniteLoop : true,
             pager : true,
             slideWidth : 1500
          });
       });
    </script>
</head>
<body>

	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
	<!-- top 영역 끝 -->
    
    <!-- 배너 슬라이드 영역 시작 -->
    <div class="main_banner_container">
       <div class="bx-viewport">
          <ul class="slider">
            <li>
               <img class="slider_img" src="${pageContext.request.contextPath }/assets/img/img1.png" />
            </li>
            
            <li>
               <img class="slider_img" src="${pageContext.request.contextPath }/assets/img/img2.png" />
            </li>
                        
            <li>
               <img class="slider_img" src="${pageContext.request.contextPath }/assets/img/img3.png" />
            </li>
            
            <li>
               <img class="slider_img" src="${pageContext.request.contextPath }/assets/img/img4.png" />
            </li>
            
            <li>
               <img class="slider_img" src="${pageContext.request.contextPath }/assets/img/img5.png" />
            </li>
         </ul>
       </div>
    </div>
    <!-- 배너 슬라이드 끝 -->


    <!-- 카테고리 영역 시작 -->
    <div class="main_category_container">

        <!-- 첫번째 줄 카테고리 5개 -->
        <div class="main_category_group1">
            <!-- 1 -->
            <div class="main_category_div">
                <a href="${pageContext.request.contextPath }/product/searchCategoryName?user_id=${sessionScope.user_id }&categoryName=패션의류" class="main_category_a">
                    <img src="${pageContext.request.contextPath }/assets/img/category_icon/fashion.png" alt="categoryImg" class="main_category_img">
                </a>
            </div>

            <!-- 2 -->
            <div class="main_category_div">
                <a href="${pageContext.request.contextPath }/product/searchCategoryName?user_id=${sessionScope.user_id }&categoryName=패션잡화" class="main_category_a">
                    <img src="${pageContext.request.contextPath }/assets/img/category_icon/high-heels.png" alt="categoryImg" class="main_category_img">
                </a>
            </div>

            <!-- 3 -->
            <div class="main_category_div">
                <a href="${pageContext.request.contextPath }/product/searchCategoryName?user_id=${sessionScope.user_id }&categoryName=화장품/미용" class="main_category_a">
                    <img src="${pageContext.request.contextPath }/assets/img/category_icon/lipstick.png" alt="categoryImg" class="main_category_img">
                </a>
            </div>

            <!-- 4 -->
            <div class="main_category_div">
                <a href="${pageContext.request.contextPath }/product/searchCategoryName?user_id=${sessionScope.user_id }&categoryName=디지털/가전" class="main_category_a">
                    <img src="${pageContext.request.contextPath }/assets/img/category_icon/monitor.png" alt="categoryImg" class="main_category_img">
                </a>
            </div>

            <!-- 5 -->
            <div class="main_category_div">
                <a href="${pageContext.request.contextPath }/product/searchCategoryName?user_id=${sessionScope.user_id }&categoryName=가구/인테리어" class="main_category_a">
                    <img src="${pageContext.request.contextPath }/assets/img/category_icon/sofa.png" alt="categoryImg" class="main_category_img">
                </a>
            </div>
        </div>

		<!-- 두번째 줄 카테고리 5개 -->
        <div class="main_category_group2">
            <!-- 6 -->
            <div class="main_category_div">
                <a href="${pageContext.request.contextPath }/product/searchCategoryName?user_id=${sessionScope.user_id }&categoryName=출산/육아" class="main_category_a">
                    <img src="${pageContext.request.contextPath }/assets/img/category_icon/baby.png" alt="categoryImg" class="main_category_img">
                </a>
            </div>

            <!-- 7 -->
            <div class="main_category_div">
                <a href="${pageContext.request.contextPath }/product/searchCategoryName?user_id=${sessionScope.user_id }&categoryName=식품" class="main_category_a">
                    <img src="${pageContext.request.contextPath }/assets/img/category_icon/food.png" alt="categoryImg" class="main_category_img">
                </a>
            </div>

            <!-- 8 -->
            <div class="main_category_div">
                <a href="${pageContext.request.contextPath }/product/searchCategoryName?user_id=${sessionScope.user_id }&categoryName=스포츠/레저" class="main_category_a">
                    <img src="${pageContext.request.contextPath }/assets/img/category_icon/sports.png" alt="categoryImg" class="main_category_img">
                </a>
            </div>

            <!-- 9 -->
            <div class="main_category_div">
                <a href="${pageContext.request.contextPath }/product/searchCategoryName?user_id=${sessionScope.user_id }&categoryName=생활/건강" class="main_category_a">
                    <img src="${pageContext.request.contextPath }/assets/img/category_icon/health.png" alt="categoryImg" class="main_category_img">
                </a>
            </div>

            <!-- 10 -->
            <div class="main_category_div">
                <a href="${pageContext.request.contextPath }/product/searchCategoryName?user_id=${sessionScope.user_id }&categoryName=기타" class="main_category_a">
                    <img src="${pageContext.request.contextPath }/assets/img/category_icon/etc.png" alt="categoryImg" class="main_category_img">
                </a>
            </div>
        </div>
    </div>
    <!-- 카테고리 영역 끝 -->


    <!-- 상품 리스트 출력 시작 -->
    <!-- 전체 상품 div container 영역 -->
    <div class="main_product_list_container">

        <!-- 전체 상품 div area 영역 layout 잡는 영역  -->
        <div class="main_product_total_area">

			<c:if test="${not empty indexList }">
				<c:forEach var="i" items="${indexList }" varStatus="status">
	               	<!-- 첫번째 상품 div container-->
	               	<div class="main_product_list">
	                   <!-- 사진 1 -->
	                   <div class="main_product_img_div">
	                       <a href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}" class="main_product_img_a">
	                           <img src="${pageContext.request.contextPath }/productImg?fname=${fileList[status.index]}&product_num=${i.product_num}" alt="" class="main_product_img">
	                       </a>
	                   </div>
	   
	                   <!-- 상품 설명 1 -->
	                   <div class="main_product_content_div">
	                       <a href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}" class="main_product_content_a">
	                           <span>${i.product_name }</span>
	                       </a>
	                   </div>
	   
	                   <!-- 가격 1 -->
	                   <div class="main_product_price_div">
	                       <span class="product_price">${i.product_price }</span>
	                   </div>
	               	</div>
				</c:forEach>
      		</c:if>
      
      
			<!-- 등록된 상품이 아무것도 없을 때  -->
			<c:if test="${empty indexList }">
	            <!-- 첫번째 상품 div container-->
   		        <div class="main_product_list">
        	        <!-- 사진 1 -->
            	    <div class="main_product_img_div">
						<a href="#" class="main_product_img_a">
							<img src="#" alt="" class="main_product_img">
						</a>
                </div>

                	<!-- 상품 설명 1 -->
                	<div class="main_product_content_div">
                    	<a href="#" class="main_product_content_a">
                        	<span>상품이 준비중입니다.</span>
                    	</a>
                	</div>

                	<!-- 가격 1-->
                	<div class="main_product_price_div">
                    	<span id="product_detail_price">상품이 준비중입니다.</span>
                	</div>
            	</div>
            
            	<!-- 두번째 상품 div container-->
            	<div class="main_product_list">
	                <!-- 사진 2 -->
                	<div class="main_product_img_div">
                    	<a href="#" class="main_product_img_a">
                        	<img src="#" alt="" class="main_product_img">
                    	</a>
                	</div>

                	<!-- 상품 설명 2 -->
                	<div class="main_product_content_div">
                    	<a href="#" class="main_product_content_a">
                        	<span>상품이 준비중입니다.</span>
                    	</a>
                	</div>

                	<!-- 가격 2-->
                	<div class="main_product_price_div">
                    	<span id="product_detail_price">상품이 준비중입니다.</span>
                	</div>
            	</div>
            
	            <!-- 세번째 상품 div container-->
	            <div class="main_product_list">
	                <!-- 사진 3 -->
	                <div class="main_product_img_div">
	                    <a href="#" class="main_product_img_a">
	                        <img src="#" alt="" class="main_product_img">
	                    </a>
	                </div>
	
	                <!-- 상품 설명 3 -->
	                <div class="main_product_content_div">
	                    <a href="#" class="main_product_content_a">
	                        <span>상품이 준비중입니다.</span>
	                    </a>
	                </div>
	
	                <!-- 가격 3-->
	                <div class="main_product_price_div">
	                    <span id="product_detail_price">상품이 준비중입니다.</span>
	                </div>
	            </div>
            
	            <!-- 네번째 상품 div container-->
	            <div class="main_product_list">
	
	                <!-- 사진 4 -->
	                <div class="main_product_img_div">
	                    <a href="#" class="main_product_img_a">
	                        <img src="#" alt="" class="main_product_img">
	                    </a>
	                </div>
	
	                <!-- 상품 설명 4 -->
	                <div class="main_product_content_div">
	                    <a href="#" class="main_product_content_a">
	                        <span>상품이 준비중입니다.</span>
	                    </a>
	                </div>
	
	                <!-- 가격 4-->
	                <div class="main_product_price_div">
	                    <span id="product_detail_price">상품이 준비중입니다.</span>
	                </div>
	            </div>
      		</c:if>
        </div>
    </div>
   
	<!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>