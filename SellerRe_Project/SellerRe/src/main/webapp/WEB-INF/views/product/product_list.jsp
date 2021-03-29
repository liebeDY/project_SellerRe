<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/product/product_list(css).css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/inc/topbar(css).css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/index(css).css">
    
   	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/product_priceReplace.js"></script>
</head>
<body>

   	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
    <!-- top 영역 끝 -->
    
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
    
    
	<!-- 가격 검색 영역 컨테이너 -->
    <div class="price_search_container">
        <div class="search_container">
            <div class="search_icon_container">
                <img src="${pageContext.request.contextPath }/assets/img/main_search/search_icon.png" />
            </div>

            <div class="search_name_container">
                <p class="price_area"> 가격 </p>
            </div>

            <form class="price" method="POST" action="${pageContext.request.contextPath }/product/selectProductByPrice">
                <div class="search_input_container">
                    <input type="hidden" name="user_id" value="${sessionScope.user_id }" />
					<input type="hidden" class="searchKeyword" name="searchKeyword" value="${searchKeyword}" />
					<input type="hidden" class="categoryName" name="categoryName" value="${categoryName}" />
                    <input type="text" name="min" class="min" id="min" placeholder="최소가격" />
                    <span class="and_price"> ~ </span> 
                    <input type="text" name="max" class="max" id="max" placeholder="최대가격" />
                    <div class="Search_btn_container">
                        <input type="submit" name="search_btn" class="search_btn" value="검색" />
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    <c:if test="${empty allProdList }">
       <div class="list_container">
          검색된 상품이 없습니다.
       </div>
    </c:if>
    
    <c:if test="${not empty allProdList }">
      <c:forEach var="i" items="${allProdList }" varStatus="status">
         <!-- 상품 리스트 컨테이너-->
          <div class="product_list_container">
              <!-- 상품 이미지 영역-->
              <div class="product_img_area">
                 <a class="prod_detail_link" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}" >
                     <img class="product_img" src="${pageContext.request.contextPath }/productImg?fname=${fileList[status.index]}&product_num=${i.product_num}" />
                 </a>
              </div>
      
              <!-- 상품 정보 영역-->
              <div class="product_info_area">
                  <!-- 상품 이름-->
                  <div class="product_name">
                     <div class="prod_name">
                         <a class="prod_detail_link"  href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}" >
                             ${i.product_name }  (판매자 : ${i.user_id })
                         </a>
                       </div>

                        <!-- 찜하기 안했을 때의 상태-->
                        <div class="wish_container">
                           <a class="prod_detail_link" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}" >
                               <img src="${pageContext.request.contextPath }/assets/img/wish_0.png" /> 
                            </a>
                            <div class="wish_count_area">
                               ${wishCount[status.index] }
                            </div>
                        </div> 

                        <!-- 짬하기 후 상태-->
<!--                         <div class="wish_container"> -->
<%--                             <img src="${pageContext.request.contextPath }/assets/img/wish1.png" /> --%>
<%--                          <input type="hidden" class="product_num" name="product_num" value="${i.product_num }" /> --%>
<!--                         </div> -->
                  </div>
      
         
                  <!-- 상품가격 및 삭제버튼-->
                  <!-- 가격 표시 : js에서 span의 class로 변경한다  -->
                  <div class="product_price_container">
                      <div class="prod_price"> 
                         <a class="prod_detail_link" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}" >
                            <span class="product_price">${i.product_price } 원</span>
                         </a>
                      </div>
                      
                      
				<!-- 상품 등록일 -->
                      <div>
                      
                      <fmt:formatDate var="reg_date" value="${i.reg_date}" pattern="yyyy.MM.dd" />
                          <span class="product_regDate">${reg_date}</span>
                      </div>
                  </div>
      
                  <!-- 상품설명 및 거래완료 버튼-->
                  <div class="product_info">
                      <div class="prod_info"> 
                         <a class="prod_detail_link" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}" >
                            ${i.product_info }
                         </a>
                      </div>
				  <div>
                      <c:if test="${i.result == 1 }">
                      		<input class="product_result_btn" type="button" value="거래중"/>
                      </c:if>
                      <c:if test="${i.result == 2 }">
                      		<input class="product_result_btn" type="button" value="거래완료"/>
                      </c:if>
                  </div>
                  </div>
                  <!-- 카테고리 -->
                  <div class="product_category">
                      <div class="prod_category"> ${ c1[status.index].category_name } > ${ c2[status.index].category_name } > ${ c3[status.index].category_name } </div>
                  </div>
              </div>
          </div>
         <input type="hidden" name="user_id" value="${sessionScope.user_id }" />
          <hr />
      </c:forEach>
    </c:if>
    
      <!-- footer 영역 시작 -->
   <c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
    <!-- footer 끝 -->
</body>
</html>