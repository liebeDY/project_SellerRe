<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script> 
    <script src="${pageContext.request.contextPath }/assets/js/product_priceReplace.js"></script>
    
    
    <title>WishList</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/wish/wishList(css).css">
</head>
<body>

	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
    <!-- top 영역 끝 -->
    
    <div class="wish_product_font_area">
        <p class="wish_font"> 
            내가 찜한 상품 
        </p>
    </div>

    <!-- 상품 리스트 컨테이너-->
    <div class="product_list_container">

        <!--상품이 없을 때 컨테이너-->
        <!-- <div class="empty_wish_product_container">
            <img class="empty_wish_img" src="images/wish1.png" />
        </div>
        <div class="empty_font">
            <p> 찜한 상품이 없습니다. </p>
        </div> -->



        <!--상품이 있을 때 컨테이너 -->
        <c:forEach var="i" items="${wishList }" varStatus="status">
        <!-- 상품 이미지 영역-->
        <div class="wish_product_container">
            <div class="product_img_area">
               <a class="prod_detail_link" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}" >
                   <img class="product_img" src="${pageContext.request.contextPath }/productImg?fname=${fileList[status.index]}&product_num=${i.product_num}" />
               </a>
            </div>
        
            <!-- 상품 정보 영역-->
            <div class="product_info_area">
                <!-- 상품 이름 영역 -->
                <div class="wish_product_name_container">
                    <div class="wish_product_name">
                        <a class="wish_product_list" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}">
                           ${i.product_name }  (판매자 : ${i.user_id })
                        </a>
                    </div>
                </div>

                <!--상품 가격 영역 -->
                <div class="wish_product_price_container">
                    <div class="wish_product_price">
                        <a class="wish_product_list" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}">
                            <span class="product_price">${i.product_price } 원</span>
                        </a>
                    </div>
                </div>

                <!--상품 정보 영역 -->
                <div class="wish_product_info_container">
                    <dlv class="wish_product_info">
                        <a class="wish_product_list" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}">
                            ${i.product_info }
                        </a>
                    </dlv>
                </div>

                <!--상품 카테고리 영역 -->
                <div class="wish_product_category_container">
                    <div class="wish_product_category">
                        <a class="wish_product_list" href="#">
                            <div class="prod_category"> ${ c1[status.index].category_name } > ${ c2[status.index].category_name } > ${ c3[status.index].category_name } </div>
                        </a>
                    </div>
                </div>
            </div>

            <!--상품 찜 이미지 영역-->
            <div class="wish_product_img_container">
                <div class="wish_product_img_area">
                    <!--찜 이미지 영역 -->
                    <div class="wish_product_img">
                        <a class="wish_product_list" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}">
                            <img src="${pageContext.request.contextPath }/assets/img/wish_1.png" />
                        </a>
                    </div>

                    <!--찜 갯수 영역-->
                    <div class="wish_product_count">
                        <a class="wish_product_list" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}">
                            <p class="wish_count"> ${wishCountList[status.index]} </p>
                        </a>
                    </div>
                </div>
                
                <!--상품 댓글 영역 -->
                <div class="wish_product_reply_container">
                    <div class="wish_product_reply_area">
                        <!--댓글 이미지 영역-->
                        <div class="wish_product_reply_img">
                            <a class="wish_product_list" href="#">
                                <img src="${pageContext.request.contextPath }/assets/img/bb.png" />
                            </a>
                        </div>
                    </div>

                    <!-- 댓글 갯수 영역 -->
                    <div class="wish_product_reply_count">
                        <a class="wish_product_list" href="#">
                            <p class="review_count"> ${reviewCountList[status.index]}</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <hr />
        </c:forEach> 
    </div>
    
    <!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
    <!-- footer 영역 끝 -->
</body>
</html>