<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/qna/qna_Writing.css">
	
	<script type="text/javascript">
	    $(document).ready(function() {
		    
	    	// 수정
	        $("#qna_writing_btn").click(function() {
	        	$("#qna_type").val(1);
				$("#QnA_Writing_Form").attr('action', '/qna/qna_Writing');
				$("#QnA_Writing_Form").submit();
			});
		});
	</script>
</head>
<body>

	<!-- top 영역 시작 -->
   	<c:if test="${sessionScope.user_type == 1 }">
		<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
    </c:if>
    <c:if test="${sessionScope.user_type == 2 }">
		<c:import url="${pageContext.request.contextPath }/inc/adminTopbar.jsp" />
    </c:if>
    <!-- top 영역 끝 -->
    
	<form method="post" id="QnA_Writing_Form">
		<table class="QnA_Writing_Table">
	        <tr>
	            <td class="qna_title_td_1">
	            	<label class="qna_title_label">* 제목</label>
	            </td>
	            <td class="qna_title_td_2">
	            	<input class="qna_title" type="text" name="qna_title" placeholder="제목을 입력하세요.">
	            </td>
	        </tr>
	
	        <tr>
	            <td class="qna_type_td_1">
	            	<label class="qna_type_lable">* 타입 선택</label>
	            </td>
	            <td class="qna_type_td_2">
	                <input type="radio" name="qna_type" value="1">구매/판매 
	                <input type="radio" name="qna_type" value="2">계정 
	                <input type="radio" name="qna_type" value="3">이용 제재 
	                <input type="radio" name="qna_type" value="4">거래시 주의사항 
	                <input type="radio" name="qna_type" value="5">기타 
	            </td>
	        </tr>
	
	        <tr>
	            <td class="qna_content_td_1">
	            	<label class="qna_content_lable">* 상세 내용</label>
	            </td>
	            <td class="qna_content_td_2">
	                <textarea class="qna_content" name="qna_content" placeholder="내용을 입력 하세요."></textarea>
	            </td>
	        </tr>
	
	        <tr>
	            <td class="qna_btn_td" colspan="2">
	                <input class="qna_cancel_btn" name="qna_cancel_btn" id="qna_cancel_btn" type="button" onClick="history.back();" value="작성 취소">
	                <input class="qna_writing_btn" name="qna_writing_btn" id="qna_writing_btn" type="button" value="작성 완료">
	            </td>
	        </tr>
	    </table>
	    <input type="hidden" name="qna_type" id="qna_type" value="" />
    </form>
    
   <!-- footer 영역 시작 -->
    <c:if test="${sessionScope.user_type == 1 }">
		<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	</c:if>
    <!-- footer 영역 끝 -->    
</body>
</html>