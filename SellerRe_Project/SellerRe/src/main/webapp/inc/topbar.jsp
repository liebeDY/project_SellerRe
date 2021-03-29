<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/inc/topbar(css).css">
</head>
<body>
    <div class="topbar_container">
        <div class="topbar_area">
        	<c:if test="${empty sessionScope.user_id }">
        		<ul>
	                <li><a class="list" href="${pageContext.request.contextPath }/user/login"> 로그인 </a></li>
	                <li><a class="list" href="${pageContext.request.contextPath }/user/registerAgree"> 회원가입 </a></li>
	                <li><a class="list" href="${pageContext.request.contextPath }/user/login" onClick="alert('로그인 후 이용이 가능합니다.')"> 나의 거래 </a></li>
	                <li><a class="list" href="${pageContext.request.contextPath }/user/login" onClick="alert('로그인 후 이용이 가능합니다.')"> 상품등록 </a></li>
                </ul>
        	</c:if>
        	
        	<c:if test="${not empty sessionScope.user_id }">
        		<ul>
        		<c:if test="${sessionScope.user_type == 1 }">
	                <li><a class="list" href="/user/userProfile?user_id=${sessionScope.user_id}"> ${sessionScope.user_nickname}님 </a></li>
        		</c:if>
        		<c:if test="${sessionScope.user_type == 2 }">
	                <li><a class="list" href="/admin/adminMain?user_id=${sessionScope.user_id}"> ${sessionScope.user_nickname}님 </a></li>
        		</c:if>
<%-- 	                <li><a href="${pageContext.request.contextPath }/user/userEdit"> 내 정보수정 </a></li> --%>
	                <li><a class="list"  href="${pageContext.request.contextPath }/user/logout" onClick="alert('로그아웃 되었습니다')"> 로그아웃 </a></li>
	                <li><a class="list" href="${pageContext.request.contextPath }/wish/wishList?user_id=${sessionScope.user_id}"> 찜 목록 </a></li>
	                <li><a class="list" href="${pageContext.request.contextPath }/product/product_add"> 상품등록 </a>
	                <li><a class="list" href="${pageContext.request.contextPath }/product/product_list"> 상품리스트 </a></li>
                </ul>
        	</c:if>
        </div>
    </div>
    
    <div class="top_menu_total_container">
    
	 <!-- 로고 시작 -->
        <div class="top_menu_logo_area">
            <a href="${pageContext.request.contextPath }/index" class="top_menu_logo_a">
                <img src="${pageContext.request.contextPath }/assets/img/logo.png" alt="logo" class="top_menu_logo_img">
            </a>
        </div>

            <!-- 검색창 -->
        <form action="${pageContext.request.contextPath }/product/searchKeyword">
           <div class="top_menu_search_area">
               <input type="text" class="top_menu_search_input" id="top_search_input" name="searchKeyword" placeholder="검색어를 입력하세요">
               <input type="submit" class="top_menu_search_input" id="top_search_icon" value="" />
           </div>
           <input type="hidden" id="searchKeyword_id" name="user_id" value="${sessionScope.user_id}"/>
      	</form>


        <!-- 메뉴 게시판 아이콘 영역 -->
        <div class="top_menu_board_area">
            <!-- 게시판 링크 1 -->
            <a href="${pageContext.request.contextPath }/notice/notice_board" class="top_menu_board_item">
                <img src="${pageContext.request.contextPath }/assets/img/main_board/notice.png" alt="아이콘 사진" class="top_menu_board_img">
            </a>

            <!-- 게시판 링크 2 -->
            <a href="${pageContext.request.contextPath }/qna/mav_qna_list?qna_type=1" class="top_menu_board_item">
                <img src="${pageContext.request.contextPath }/assets/img/main_board/qna.png" alt="아이콘 사진" class="top_menu_board_img">
            </a>

            <!-- 게시판 링크 3 -->
            <a href="${pageContext.request.contextPath }/report/mav_report_List" class="top_menu_board_item">
                <img src="${pageContext.request.contextPath }/assets/img/main_board/report.png" alt="아이콘 사진" class="top_menu_board_img">
            </a>
        </div>
    </div>
    <!-- 메뉴 끝 -->
    
    
    
    
</body>
</html>