<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/review/review.css">
</head>
<body>
    <table class="review_table">
        <tr>
            <td class="review_writing_td">
                <textarea class="review_writing" name=""></textarea>
            </td>
            <td class="writing_btn_td">
                <input class="review_writing_btn" type="button" id="review_writing_btn" value=" 댓글 작성">
            </td>
        </tr>
    </table>

    <table class="review_view_table">
        <tr>
            <td class="review_view_order_td" colspan="2">
                <div class="review_order_info">
                    <span class="order_id">작성자 : <a class="review_user_link" href="#">끼야앙</a></span>
                    <span class="order_date">작성일 : 2021-03-03</span>
                    <span class="review_btn">
                        <input class="review_edit" type="button" value="수정">
                        <input class="review_del" type="button" value="삭제">
                    </span>
                </div>
                <textarea class="review_view_order" id=""></textarea>
            </td>
        </tr>

        <tr>
            <td class="review_view_seller_td" colspan="2">
                <textarea class="review_view_seller" id=""></textarea>
                <div class="review_seller_info">
                    <span class="review_btn">
                        <input class="review_edit" type="button" value="수정">
                        <input class="review_del" type="button" value="삭제">
                    </span>
                    <span class="seller_id">작성자 : <a class="review_user_link" href="#">끼야앙</a></span>
                    <span class="seller_date">작성일 : 2021-03-03</span>
                 </div>
            </td>
        </tr>
    </table>
</body>
</html>