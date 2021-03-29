<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/report/report_Edit.css">
	
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#writing_btn").click(function() {
				$("#report_edit_form").attr('action', '/report/report_Edit');
				$("#report_edit_form").submit();
			});
			
			$("#cancel_btn").click(function() {
		    	$("#report_edit_form").attr('action', '/report/mav_Report_Content');
		    	$("#report_edit_form").submit();
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

	<form method="post" id="report_edit_form" enctype="multipart/form-data">
        <table>
            <tr>
                <td class="reportTitle_td">
                    <label class="title_Lable">* 제목 </label>
                </td>
                <td class="reportTitle_text_td">
                    <input class="reportTitle_text" name="report_title" type="text" placeholder="제목을 입력하세요." value="${r.report_title }">
                </td>
            </tr>

            <tr>
                <td class="reason_td">
                    <label class="reason_Lable">* 신고 사유</label>
                </td>
                <td>
                    <select class="reason_select" name="report_reason">
                        <option value="선택안함">선택하세요.</option>
                        <option value="사기">사기</option>
                        <option value="상품 불량">상품 불량</option>
                        <option value="상품 되팔기">상품 되팔기</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td class="nickCheck_td">
                    <label class="nickCheck_Lable">* 닉네임 체크 </label>
                </td>
                <td>
                    <input class="nickCheck_text" name="user_nickname" type="text" placeholder="검색할 닉네임을 입력하세요.">
                    <input class="nickCheck_Btn" type="button" value="닉네임 확인">
                </td>
            </tr>

            <tr>
                <td class="reportContent_td">
                    <label class="content_Lable">* 상세내용 </label>
                </td>
                <td class="textArea_td">
                    <textarea class="reportContent_text" name="report_content" placeholder="내용을 입력하세요.">${r.report_content }</textarea>
                </td>
            </tr>

            <tr class="file_tr">
                <td class="file_td">
                    <label class="file_Lable">* 첨부파일 </label>
                </td>
                <td>
                    <input type="file" name="report_img1" class="report_img1" id="report_img1">
                    <input type="file" name="report_img2" class="report_img2" id="report_img2">
                    <input type="file" name="report_img3" class="report_img3" id="report_img3">
                </td>
            </tr>

            <tr class="btn_tr">
                <td class="btn_td" colspan="2">
                    <input class="cancel_btn"  id="cancel_btn" type="button" value="수정 취소">
                    <input class="writing_btn" id="writing_btn" type="button" value="수정 완료">
                </td>
            </tr>
        </table>
        <input type="hidden" name="report_num" value="${r.report_num }" />
    </form>
</body>
</html>