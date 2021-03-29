<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/notice/notice_Board.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/topbar(css).css">

	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

  	<!-- top 영역 시작 -->
	<c:if test="${sessionScope.user_type == 1 || empty sessionScope.user_id }">
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
				<th class="th_date">작성일</th>
				<th class="th_hit">조회</th>
			</tr>
			
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">등록된 공지가 없습니다.</td>
				</tr>
			</c:if>
				
			<c:if test="${not empty list}">
				<c:forEach var="n" items="${list }" varStatus="status">
					<tr>
						<td> ${status.count} </td>
						<td>
							<a class="link" href="${pageContext.request.contextPath }/notice/notice_contentView?notice_num=${n.notice_num}">${n.notice_title}</a>
						</td>
						<td> ${n.notice_date } </td>
						<td> ${n.notice_hits } </td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${sessionScope.user_type == 2 }">
				<tr>
					<td class="td_btn" colspan="5">
						<input class="writing_btn" type="button" id="Writing" onclick="location.href = '${pageContext.request.contextPath }/notice/notice_writing'" value="공지사항 작성">
					</td>
				</tr>
				</c:if>
		</table>
	</div>
	
	<!-- top 영역 시작 -->
	<c:if test="${sessionScope.user_type == 1 || empty sessionScope.user_id }">
		<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
    </c:if>
    <!-- top 영역 끝 -->
</body>
</html>