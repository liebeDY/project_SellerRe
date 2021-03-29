<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/admin/adminProduct(css).css">
    
	<!-- JS -->
	<script src="${pageContext.request.contextPath }/assets/js/admin/adminProduct.js"></script>
</head>

<body>

	<p> 상품을 검색 / 삭제합니다 </p>
	
    <hr />
    
    <form action="${pageContext.request.contextPath }/product/productDetail">
		<table id="table">
			<tr>
				<td class="search" colspan="2">
					<p>
						<img class="icon" src="../../assets/img/main_search/search_icon.png"> 
						<b>상품검색</b> &nbsp;
						<input type="text" id="searchKeyword" name="searchKeyword" placeholder="검색할 상품명을 입력하세요" /> 
						<input type="button" id="search_btn" name="search_btn" value="검색">
						<input type="hidden" id="user_id" name="user_id" value="${sessionScope.user_id }"/>
					</p>
				</td>
			</tr>
			
			<tr class="first_tr">
				<th>상품번호</th>
				<td></td>
			</tr>
			
			<tr class="first_tr">
				<th>상품명</th>
				<td></td>
			</tr>
			
			<tr class="first_tr">
				<th>상품가격</th>
				<td></td>
			</tr>
			
			<tr class="first_tr">
				<th>상품정보</th>
				<td></td>
			</tr>
			
			<tr class="first_tr">
				<th>판매자</th>
				<td></td>
			</tr>
		</table>
	</form>	
</body>
</html>