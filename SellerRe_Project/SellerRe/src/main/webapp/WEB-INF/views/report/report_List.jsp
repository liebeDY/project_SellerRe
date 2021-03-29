<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/report/report_List.css">
	
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$(".writing_btn").click(function() {
				location.href = "${pageContext.request.contextPath}/report/report_Writing";
			});
		});
	</script>

<body>
	<!-- top 영역 시작 -->
	<c:if test="${sessionScope.user_type == 1 || empty sessionScope.user_id}">
		<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
    </c:if>
    <c:if test="${sessionScope.user_type == 2 }">
		<c:import url="${pageContext.request.contextPath }/inc/adminTopbar.jsp" />
    </c:if>
    <!-- top 영역 끝 -->


    <div class="all">
        <table>
            <tr>
                <th class="th_num">번호</th>
                <th class="th_title">제목</th>
                <th class="th_writer">작성자</th>
                <th class="th_date">작성일</th>
                <th class="th_hit">조회</th>
            </tr>
            
			<c:forEach var="r" items="${reportList }" varStatus="status">
				 <tr>
	                <td>${status.count }</td>
	                <td><a href="${pageContext.request.contextPath }/report/mav_Report_Content?report_num=${r.report_num }">${r.report_title }</a></td>
	                <td>${r.report_writer_id }</td>
	                <td>${r.report_date }</td>
	                <td>${r.report_hits }</td>
	            </tr>
			</c:forEach>

            <tr>
                <td class="td_btn" colspan="5">
	                <c:if test="${not empty sessionScope.user_id }">
	                    <input class="writing_btn" type="button" value="게시글 작성">
	                </c:if>
                </td>
            </tr>
        </table>
    </div>
    
   	<!-- footer 영역 시작 -->
	<c:if test="${sessionScope.user_type == 1 || empty sessionScope.user_id}">
		<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
    </c:if>
    <c:if test="${sessionScope.user_type == 2 }">
		<c:import url="${pageContext.request.contextPath }/inc/adminTopbar.jsp" />
    </c:if>
    <!-- footer 영역 끝 -->
</body>
</html>