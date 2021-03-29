<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/notice/notice_ContentWriting.css">
	
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- JavaScript -->
	<script>
		$(document).ready(function(){
			$("#writing").click(function(){
				$("#noticeForm").submit();
			});
			$("#reset").click(function(){
				$("#noticeForm").attr('action','/notice/notice_board')
				$("#noticeForm").submit();
			});
		});
	</script>
</head>
<body>

	 <c:if test="${sessionScope.user_type == 2 }">
		<c:import url="${pageContext.request.contextPath }/inc/adminTopbar.jsp" />
    </c:if>

	<form method="post" id="noticeForm" action="${pageContext.request.contextPath }/notice/notice_writing">
		<table>
			<tr>
				<th class="title">
				<input class="title_text_box" type="text" placeholder="제목을 작성하세요." name="notice_title"></th>
			</tr>

			<tr>
				<td class="content">
					<textarea name="notice_content" placeholder="내용을 입력하세요."></textarea>
				</td>
			</tr>

			<tr>
				<td class="btn_td">
					<input class="writing_btn" type="button" id="writing" value="작성완료">
					<input class="reset_btn" type="button" id="reset" value="작성취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>