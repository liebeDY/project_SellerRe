<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/admin/adminPage(css).css">
    
    <!-- Jquery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <!-- JS -->
    <script src="${pageContext.request.contextPath }/assets/js/admin/admin_main_menuChange.js"></script>
    
</head>
<body>
    <!-- 관리자 Topbar 영역 -->
    <div class="admin_topbar_container">
        <div class="admin_topbar_area">
            <div class="admin_main">
                <!-- 클릭 시 관리자 메인(홈페이지 정보)로 이동-->
                <span class="mm">
                    <a href="#"> 관리자 페이지  </a>
                </span>

                <span>
                    <ul>
                        <!-- 클릭 시 정보수정창으로 이동  -->
                        <li> 
                            <a href="#"> 관리자 ${sessionScope.user_Id} 님  </a>
                        </li>

                        <li> 
                            <!-- 클릭 시 SellerRe(user화면) index로 이동 -->
                            <a href="${pageContext.request.contextPath }/index"> SellerRe </a>
                        </li>

                        <li>
                            <!-- 클릭 시 로그아웃 후 index로 이동 -->
                            <a href="${pageContext.request.contextPath }/admin/logout" onClick="alert('로그아웃 되었습니다');"> 로그아웃</a>
                        </li>
                    </ul>
                </span>
            </div>
        </div>
    </div>

    <hr />

    <!-- 관리자 운영 리스트 영역 -->
    <form action="${pageContext.request.contextPath }/admin/selectAdminPage">
        <div class="admin_list_container">
            <ul class="admin_list_area">
                <li class="admin_list_area_list">
                    <input type="submit" class="list_button" name="adminPageType" value="홈페이지정보">
                </li>
                <li class="admin_list_area_list">
                    <div id="admin_page_category_product_menu">상품관리</div>
                </li>
                <li class="admin_list_area_list">
                    <div id="admin_page_category_user_menu">
                        <input type="submit" class="list_button" name="adminPageType" value="회원관리">
                    </div>
                </li>
                <li class="admin_list_area_list">
                    <div id="admin_page_category_board_menu">게시판관리</div>
                </li>
            </ul>
        </div>



        <!-- 관리자 운영 리스트 클릭시 출력 영역 -->
        <div id="print_area">

        </div>

        <div id="content_area">
            <c:set var="url" value="${pageContext.request.contextPath }/admin/adminHomePage"/>
            
            <c:if test="${type == 1}">
               <c:set var="url" value="${pageContext.request.contextPath }/admin/adminHomePage"/>   
            </c:if>
            
            <c:if test="${type == 2}">
               <c:set var="url" value="${pageContext.request.contextPath }/admin/adminUser"/>
            </c:if>

            <c:if test="${type == 3}">
                <c:set var="url" value="${pageContext.request.contextPath }/admin/adminProduct" />
            </c:if>

            <c:if test="${type == 4}">
                <c:set var="url" value="${pageContext.request.contextPath }/admin/adminCategory" />
            </c:if>

            <c:if test="${type == 5}">
                <c:redirect url="${pageContext.request.contextPath }/notice/notice_board" />
            </c:if>

            <c:if test="${type == 6}">
                <c:redirect url="${pageContext.request.contextPath }/qna/mav_qna_list?qna_type=1" />
            </c:if>

            <c:if test="${type == 7}">
                <c:redirect url="${pageContext.request.contextPath }/report/mav_report_List" />
            </c:if>
        </div>
    </form>
   
   <c:import url="${url }"/>

</body>
</html>