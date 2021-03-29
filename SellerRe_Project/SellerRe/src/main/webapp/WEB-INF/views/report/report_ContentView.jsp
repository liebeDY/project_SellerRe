<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/report/report_ContentView.css">
	
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#report_edit_btn").click(function() {
				$("#report_content_form").attr('action', 'mav_Report_Edit');
				$("#report_content_form").submit();
			});
			
			$("#report_del_btn").click(function() {
				var con = confirm("이 글을 정말로 삭제하시겠습니까?");
				
				if (con == true) {
					$("#report_content_form").attr('action', 'report_del');
					$("#report_content_form").submit();
				} 
			});
			
			$(".list_btn").click(function() {
				$("#report_content_form").attr('action', 'mav_report_List');
				$("#report_content_form").submit();
			});
		});
	</script>

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
    
    
	<form method="post" id="report_content_form" enctype="multipart/form-data">
		<table>
			<tr>
				<th class="content_wirter_id">작성자 : ${r.report_writer_id }</th>
				<th class="title">${r.report_title }</th>
				<th class="YMD">${r.report_date }</th>
			</tr>
			
			<tr>
	<%--             <td colspan="3" class="content_user_td">* 신고 대상 : ${r.user_nickname } (${r.user_Id })</td> --%>
	        </tr>
	
			<tr>
				<td colspan="3" class="content_reason_td">* 신고 사유 : ${r.report_reason }</td>
			</tr>
	
			<tr>
				<td colspan="3" class="img_td">* 등록한 이미지</td>
			</tr>
			
			<c:forEach var="i" items="${files }" varStatus="status">
				<tr>
					<td colspan="3"><img class="img_list" src="${pageContext.request.contextPath }/reportImg?fname=${i}&report_num=${r.report_num}"></td>
				</tr>
			</c:forEach>
	
			<tr>
				<td class="content" colspan="3"><textarea disabled>${r.report_content }</textarea>
				</td>
			</tr>
	
			<tr>
				<td class="btn_td" colspan="3">
					<c:if test="${sessionScope.user_id == r.report_writer_id  || sessionScope.user_type == 2}">
						<input class="del_btn" type="button" id="report_del_btn" value="삭제">
						<input class="edit_btn" type="button" id="report_edit_btn" value="수정">
					</c:if>
					<input class="list_btn" type="button" id="list" onClick="history.back()" value="목록으로">
				</td>
			</tr>
		</table>
        <input type="hidden" name="report_num" value="${r.report_num }" />
	</form>
	
	
	<!-- footer 영역 시작 -->
	<c:if test="${sessionScope.user_type == 1 || empty sessionScope.user_type }">
		<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	</c:if>
    <!-- footer 영역 끝 -->
</body>
</html>