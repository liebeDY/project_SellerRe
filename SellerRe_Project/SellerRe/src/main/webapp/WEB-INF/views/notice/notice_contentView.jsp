<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/notice/notice_ContentView.css">
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- JS -->
	<script src="${pageContext.request.contextPath }/assets/js/notice/notice_contentView.js"></script>
</head>
<body>
	
   	<!-- top 영역 시작 -->
   	<c:if test="${sessionScope.user_type == 1 || empty sessionScope.user_type }">
		<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
    </c:if>
    <c:if test="${sessionScope.user_type == 2 }">
		<c:import url="${pageContext.request.contextPath }/inc/adminTopbar.jsp" />
    </c:if>
    <!-- top 영역 끝 -->

	<c:import url="${pageContext.request.contextPath }/notice/Board"></c:import>
	
	<form id="contentForm" action="${pageContext.request.contextPath }">
		<input type="hidden" name="notice_num" value="${n.notice_num }">
		<table>
			<tr>
				<th class="notice_wirter_id">작성자 : Admin</th>
				<c:if test="${sessionScope.user_type == 2 }">
					<th class="title"><input class="title_text_box" type="text" name="notice_title" value="${n.notice_title }"></th>
				</c:if>
				<c:if test="${sessionScope.user_type != 2 }">
					<th class="title"><input class="title_text_box" type="text" name="notice_title" value="${n.notice_title }" disabled></th>
				</c:if>
				<th class="YMD">${n.notice_date }</th>
			</tr>

			<tr>
				<td class="content" colspan="3">
					<c:if test="${sessionScope.user_type == 2 }">
						<textarea name="notice_content">${n.notice_content}</textarea>
					</c:if>
					<c:if test="${sessionScope.user_type != 2 }">
						<textarea name="notice_content" disabled>${n.notice_content}</textarea>
					</c:if>
				</td>
			</tr>

			<tr>
				<td class="btn_td" colspan="3">
					<c:if test="${sessionScope.user_type == 2 }">
						<input class="del_btn" type="button" id="del" value="삭제">
						<input class="edit_btn" type="button" id="edit" value="수정">
					</c:if>
						<input class="list_btn" type="button" id="list" onClick="history.back();" value="목록으로">
				</td>
			</tr>
		</table>
	</form>
	
	<!-- footer 영역 시작 -->
   	<c:if test="${sessionScope.user_type == 1 || empty sessionScope.user_type }">
		<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	</c:if>
    <!-- footer 영역 끝 -->
</body>
</html>