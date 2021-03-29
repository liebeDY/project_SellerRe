<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/user/find_pw(css).css" />
</head>
<body>
	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
    <!-- top 영역 끝 -->
    
    
	<div class="container">
		<div class="find_pw_container">
			<div class="find_pw_area">
				<p> 비밀번호 찾기 </p>
			</div>
			
			<div class="find_pw_input_area">
				<input type="text" name="user_email" class="user_email" id="user_email" placeholder="이메일을 입력해주세요" />
			</div>
			
			<div class="find_pw_btn_area">
				<input type="button" name="find_pw_btn" class="find_pw_btn" id="find_pw_btn" value="임시비밀번호 발급" />
			</div>
		</div>
	</div>


	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
    <!-- top 영역 끝 -->
</body>
</html>