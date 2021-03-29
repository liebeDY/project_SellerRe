<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/product/productDetail(css).css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/inc/footer(css).css">	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bxslider.css">	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/review/review.css">	
	
	
	<!-- BX Slider -->
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script> 
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>	
    
    <!-- JS -->
    <script src="${pageContext.request.contextPath }/assets/js/wish_clickImg.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/product_priceReplace.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/product/product_detail.js"></script>    
</head>
<body>


   <!-- top 영역 시작 -->
   <c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
   <!-- top 영역 끝 -->
    
   <form method="post" id="action_from">
         <!-- 상품 디테일 전체 컨테이너 -->
         <div class="product_detail_all_container">
			<!-- 배너 슬라이드 영역 시작 -->
			<div class="main_banner_container">
				<div class="bx-viewport">
					<ul class="slider">
						<c:forEach var="i" items="${files }">
							<li>
								<img class="silder_img" src="${pageContext.request.contextPath }/productImg?fname=${i }&product_num=${p.product_num}" />
							</li>
                        </c:forEach>
                     </ul>
                 </div>
             </div>
          </div>
          <!-- 배너 슬라이드 끝 -->

		<!-- 상품 디테일 유저 정보 컨테이너-->
        <div class="product_detail_user_info_container">
            <div class="user_info_area"> 
                <!-- 클릭 시 해당 회원정보 창으로 이동 -->
                <a class="user_nickname" href="${pageContext.request.contextPath }/user/userProfile?user_id=${p.user_id}">
                    ${u.user_nickname }
                </a>
            </div>

            <div class="user_info_area">
                <div class="user_id">
                   ( ${p.user_id } )
                </div>
            </div>

            <div class="user_info_area">
                <div class="user_score">
                    <span> ★ </span>
                    <span> &nbsp;(${user_avg }) </span>
                </div>
            </div>
        </div>

        <hr />

        <!-- 상품 정보 컨테이너 -->
        <div class="product_detail_info_container">
            <div class="product_detail_name">
                ${p.product_name }
                
                <c:if test="${wishResultType == 0 }">
               		<!--상품 찜하기 하트  -->
                   	<div class="wish_img_area">
                       <img class="wish_icon" src="${pageContext.request.contextPath }/assets/img/wish_0.png" />
                   	</div>
                </c:if>
                
                <c:if test="${wishResultType == 1 }">
               		<!--상품 찜하기 하트  -->
                   	<div class="wish_img_area">
                       <img class="wish_icon" src="${pageContext.request.contextPath }/assets/img/wish_1.png" />
                   	</div>
                </c:if>
            </div>


			<!-- 가격 표시 : js에서 span의 class로 변경한다  -->
            <div class="product_detail_price" >
            <c:if test="${p.result == 1 }">
                <span class="product_price">${p.product_price } 원</span>
            </c:if>
            
            <c:if test="${p.result == 2 }">
              	<span class="product_result">거래완료</span>
            </c:if>
            </div>

            <div class="product_detail_category">
                ${c1.category_name } > ${c2.category_name } > ${c3.category_name }
            </div>

            <div class="product_detail_info" >
                 ${p.product_info }
            </div>

            <!-- 찜 & 조회수 카운트 컨테이너 -->
            <div class="product_detail_wish_and_view_cnt_container">
                <div class="product_detail_wish_cnt">
                    찜 <span class="cnt"> ${wishCount } 개 </span>
                </div>
    
                <div class="product_detail_view_cnt">
                    조회수 <span class="cnt"> ${p.product_hit } 회 </span> 
                </div>
                
                <c:if test="${ sessionScope.user_id == p.user_id || sessionScope.user_type == 2}">
                    <input type="button" id="prod_detail_edit_btn" class="prod_detail_edit_btn" value="제품수정" />
                    <input type="button" id="prod_detail_del_btn" class="prod_detail_del_btn" value="제품삭제" />
                </c:if>
                
	            <!--  로그인된 id -->
				<input type="hidden" id="login_user_id" name="login_user_id" value="${sessionScope.user_id }"/>
				<input type="hidden" id="product_num" name="product_num" value="${p.product_num }"/>
				<input type="hidden" name="user_id" value="${p.user_id }"/>
            </div>
        </div>

        <hr />
	</form>

	<form method="post" class="review_form">   
        <!-- 상품 디테일 댓글 컨테이너 -->
        <div class="product_detail_reply_container">
             <table class="review_table">
        		<tr>
					<td class="review_writing_td">
						<textarea class="review_writing" name="review_content" id="review_content"></textarea>
					</td>
					
					<td class="writing_btn_td">
						<input class="review_writing_btn" type="button" id="review_writing_btn" value=" 댓글 작성">
					</td>
				</tr>
  	  		</table>
			<input type="hidden" id="writer_id" name="writer_id" value="${sessionScope.user_id }" />
			<input type="hidden" name="product_num" value="${p.product_num }" />
        </div>
	</form>
	
	<div class="product_detail_reply_container">
		<table class="review_view_table">
			<c:if test="${empty reviewList }">
				<tr>
					<td>
						등록된 댓글이 없습니다.
					</td>
    			</tr>
			</c:if>
    
			<c:forEach var="review" items="${reviewList }">
				<c:set var="writeonly">
					<c:if test="${sessionScope.user_id != review.writer_id }">
						disabled    			
					</c:if>
				</c:set> 
    	
				<form method="post" class="order_review_form">
					<c:if test="${review.writer_id != p.user_id }">
						<tr>
							<td class="review_view_order_td" colspan="2">
								<div class="review_order_info">
									<span class="order_id">작성자 : <a class="review_user_link" href="${pageContext.request.contextPath }/user/userProfile?user_id=${review.writer_id }"> ${review.writer_id }</a></span>
									<span class="order_date">작성일 : ${review.review_date }</span>
									<span class="review_btn">
		                    			<c:if test="${sessionScope.user_id == review.writer_id }">
			                        		<input class="review_edit" type="button" value="수정">
			                        		<input class="review_del" type="button" value="삭제">
			                    		</c:if>
		                    		</span>
		                		</div>
		                		<textarea class="review_view_order" name="review_content" id="" ${ writeonly}>${review.review_content }</textarea>
		            		</td>
		        		</tr>
					</c:if>
					
					<input type="hidden" name="review_num" value="${review.review_num }" />
				    <input type="hidden" id="writer_id" name="writer_id" value="${sessionScope.user_id }" />
	    		    <input type="hidden" name="product_num" value="${p.product_num }" />
				</form>
			
				<form method="post" class="seller_review_form">
					<c:if test="${review.writer_id == p.user_id }">
			        	<tr>
			           		<td class="review_view_seller_td" colspan="2">
			                	<textarea class="review_view_seller" name="review_content" id="" ${ writeonly}>${review.review_content }</textarea>
			                	<div class="review_seller_info">
			                    	<span class="review_btn">
			                    		<c:if test="${sessionScope.user_id == p.user_id }">
				                        	<input class="review_edit" type="button" value="수정">
				                        	<input class="review_del" type="button" value="삭제">
			                       		</c:if>
			                    	</span>
			                    	<span class="seller_id">
			                    		작성자 : <a class="review_user_link" href="${pageContext.request.contextPath }/user/userProfile?user_id=${p.user_id}"> ${p.user_id } </a>
			                    	</span>
			                    	<span class="seller_date">작성일 : ${review.review_date }</span>
			                 	</div>
			            	</td>
			        	</tr>
			    	</c:if>
			    	<input type="hidden" name="review_num" value="${review.review_num }" />
					<input type="hidden" id="writer_id" name="writer_id" value="${sessionScope.user_id }" />
			        <input type="hidden" name="product_num" value="${p.product_num }" />
			    </form>
	        </c:forEach>
    	</table>
	</div>
</body>
</html>