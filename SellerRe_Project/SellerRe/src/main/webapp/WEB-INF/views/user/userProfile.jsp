<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/user/userProfile(css).css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/inc/topbar(css).css">
	
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	
	<!-- JavaScript -->
	<script src="${pageContext.request.contextPath }/assets/js/user/userProfile.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/product_priceReplace.js"></script>
</head>
<body>
	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
	<!-- top 영역 끝 -->

	<!-- 유저 정보 컨테이너 -->
	<div class="user_info_container">
		<div class="user_info_area">

			<!-- 유저 닉네임 & ID 영역 -->
			<div class="user_id_nick_area">
				<div>${u.user_nickname }</div>
				<div>&nbsp;(${u.user_id })</div>
			</div>
			
			<form method="post" action="${pageContext.request.contextPath }/user/userScore">
				<!-- 유저 평점 및 정보수정 버튼 영역-->
				<div class="user_score_editbtn_area">
					<!-- 유저 평점 영역 -->
					<div class="user_score_area">
						<div class="star">★</div>
						<div>&nbsp;( ${user_avg} )</div>
					</div>

					<c:if test="${sessionScope.user_id == u.user_id }">
						<a href="${pageContext.request.contextPath }/user/userEdit"> 
							<input type="button" class="editbtn" value="정보수정" />
						</a>
					</c:if>
				</div>

				<!-- 찜리스트 버튼 영역 -->
				<div class="user_wishbtn_area">
					<div class="wishbtn_area">
						<c:if test="${sessionScope.user_id == u.user_id }">
	                        본인의 평점입니다.
	                    </c:if>
						<c:if test="${sessionScope.user_id != u.user_id }">
	                        이 회원을 평가해주세요! 
	                    </c:if>

						<!-- 찜리스트 버튼 -->
						<div>
							<c:if test="${sessionScope.user_id == u.user_id }">
								<input type="button" name="wishbtn" class="wishbtn" id="wishbtn" value="찜목록" />
							</c:if>
						</div>
					</div>

					<c:choose>
						<c:when test="${empty sessionScope.user_id }">
                    		로그인 후 평가가 가능합니다.
                    	</c:when>

						<c:when test="${sessionScope.user_id != u.user_id }">
							<!-- 유저 평가 버튼 -->
							<div class="user_score_btn">
								<input type="button" name="" class="score_btn" value="1" /> 
								<input type="button" name="" class="score_btn" value="2" /> 
								<input type="button" name="" class="score_btn" value="3" /> 
								<input type="button" name="" class="score_btn" value="4" /> 
								<input type="button" name="" class="score_btn" value="5" />
							</div>
						</c:when>
					</c:choose>
				</div>
				<input type="hidden" name="user_id" value="${u.user_id }" /> 
				<input type="hidden" name="user_score" id="user_score" value="" />
			</form>
		</div>
	</div>

	<hr />

	<c:if test="${empty myProductList }">
		<div class="empty_container">등록된 상품이 없습니다. 상품을 등록해주세요</div>
	</c:if>

	<c:if test="${not empty myProductList }">
		<c:forEach var="i" items="${myProductList }" varStatus="status">
			<form method="post" class="f">
				<!--     상품 리스트 컨테이너 -->
				<div class="product_list_container">
					<!-- 상품 이미지 영역 -->
					<div class="product_img_area">
						<a href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}">
							<img class="product_img" src="${pageContext.request.contextPath }/productImg?fname=${fileList[status.index] }&product_num=${i.product_num}" />
						</a>
					</div>

					<!-- 상품 정보 영역-->
					<div class="product_info_area">
						<!-- 상품 이름 및 수정버튼 -->
						<div class="product_name">
							<div class="prod_name">
								<a class="prod_detail_link" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}">
									${i.product_name } (판매자 : ${i.user_id }) </a>
							</div>

							<div>
								<c:if test="${sessionScope.user_id == i.user_id }">
									<input type="button" class="prod_edit_btn" name="prod_edit_btn" value="제품수정" />
								</c:if>
							</div>
						</div>

						<!-- 상품가격 및 삭제버튼 -->
						<div class="product_price_container">
							<div class="prod_price">
								<a class="prod_detail_link" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}">
									<span class="product_price"> ${i.product_price } </span>
								</a>
							</div>

							<div>
								<c:if test="${sessionScope.user_id == i.user_id }">
									<input type="button" class="del_btn" name="del_btn" value="제품삭제" />
								</c:if>
							</div>
						</div>



						<!-- 상품설명 및 거래완료 버튼 -->
						<div class="product_info">
							<div class="prod_info">
								<a class="prod_detail_link" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&product_num=${i.product_num}">
									${i.product_info } 
								</a>
							</div>
							<div>
								<c:if test="${sessionScope.user_id == i.user_id && i.result == 1}">
									<input type="button" id="status.index" class="result_btn" name="trade_btn" value="거래완료하기" />
								</c:if>
								
								<c:if test="${sessionScope.user_id == i.user_id && i.result == 2}">
									<input type="button" id="status.index" class="result_btn" name="trade_btn" value="거래완료" />
								</c:if>
							</div>
						</div>

						<!-- 카테고리 -->
						<div class="product_category">
							<div class="prod_category">
								${c1[status.index].category_name } > ${c2[status.index].category_name } > ${c3[status.index].category_name }
							</div>
						</div>
					</div>
				</div>

				<input type="hidden" name="product_num" value="${i.product_num }" />
				<input type="hidden" name="user_id" value="${i.user_id }" />
				<hr />
			</form>
		</c:forEach>
	</c:if>

	<!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>