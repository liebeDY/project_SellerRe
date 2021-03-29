<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>My JSP Page</title>
	
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery.min.js"></script>

	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/user/userEdit(css).css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/inc/topbar(css).css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/inc/footer(css).css">
	
	<!-- Bootstrap -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
	
	<!-- 다음 우편번호 검색 스크립트 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/daumPostCode.js"></script>
	
	<!-- JavaScript -->
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btn4").click(function() {
 				var a = confirm("회원탈퇴를 진행하시겠습니까?");
				
 				if (a == true) {
					$("#user_EditForm").attr('action', '/user/userDelete');
					$("#user_EditForm").submit();
 				} else if (a == false) {
 					return false;
 				}
			});
		});
	</script>
</head>
<body>

	<div class="container">
        <div class="register_form">
            <h1> 정보수정 </h1>
        </div>
        
        <br /><br />
        
        <!-- 수정폼 시작 -->
        <form method="post" id="user_EditForm" class="form-horizontal" action="${pageContext.request.contextPath }/user/edit">
        
            <!-- 아이디 -->
            <div class="form-group">
                <label for='userid' class="id_form col-md-6"> * 아이디 </label>
                <div class="col-md-15">
                    <input type="text" name="user_id" class="form-control" value="${sessionScope.user_id }" readonly required/>
                </div>
            </div>

            <div class="form-group">
                <label for='"password"' class="col-md-6">  * 비밀번호</label>
                <div class="col-md-15">
                    <input type="password" name="user_pw" class="form-control" value="${u.user_pw }" required/>
                </div>
            </div>
    
            <div class="form-group">
                <label for='name' class="col-md-6"> * 이름 </label>
                <div class="col-md-15">
                    <input type="text" name="user_name" class="form-control" value="${u.user_name }" required/>
                </div>
            </div>
            
            <div class="form-group">
				<label for='nickname' class="id_form col-md-6"> * 닉네임 </label>
				<div class="col-md-15">
					<input type="text" name="user_nickname" class="form-control" value="${u.user_nickname }" required />

					<input type="button" id="nickCheck" value="닉네임 중복체크">
					<div id="nickResult"></div> <br />
				</div>
			</div>
    
            <div class="form-group">
                <label for='email' class="col-md-6"> * 이메일</label>
                <div class="col-md-15">
                    <input type="email" name="user_email" class="form-control" value="${u.user_email }" placeholder="ex) honggildong@naver.com" required/>
                </div>
            </div>
    
            <div class="form-group">
                <label for='tel' class="col-md-6"> * 연락처 </label>
                <div class="col-md-15">
                    <input type="tel" name="user_tel" class="form-control" value="${u.user_tel }" placeholder="'-'없이 입력" required/>
                </div>
            </div>

            <div class="form-group">
                <label for="birthday" class="col-md-6"> * 생년월일 </label>
                <div class="col-md-15">
                    <input type="date" name="user_birthday" class="form-control" value="${u.user_birthday }" required/>
                </div>
            </div>
    
    
            <div class="form-group">
                <label for='postcode'> &nbsp;&nbsp; * 우편번호</label>
                <div class="col-md-15 clearfix" id="post_container">
                    <input type="text" name="user_postcode" class="form-control pull-left" value="${u.user_postcode }" style='width: 30rem; margin-right: 5px'/>
                    <!-- 클릭 시, Javascript 함수 호출 : openDaumPostcode() -->
                    <input type='button' value='우편번호 찾기' class='btn btn-warning' id="btn1" onclick='execDaumPostcode("postcode", "addr1", "addr2")' required/>
                </div>
            </div>
    
            <div class="form-group">
                <label for='addr1' class="col-md-6"> * 주소</label>
                <div class="col-md-15">
                    <input type="text" name="user_addr1" class="form-control" value="${u.user_addr1 }" required/>
                </div>
            </div>
    
            <div class="form-group">
                <label for='addr2' class="col-md-6"> * 상세주소</label>
                <div class="col-md-15">
                    <input type="text" name="user_addr2" class="form-control" value="${u.user_addr2 }" required/>
                </div>
            </div>
    
            <div class="form-group" >
                <div class="col-md-20" id="btn_group">
                    <button type="submit" class="btn btn-info" id="btn2">수정하기</button> 
                    <button type="button" class="btn btn-info" id="btn3" onClick="history.back();">뒤로가기</button>
                    <input type="button" class="btn btn-info" id="btn4" value="탈퇴하기" /> 
                </div>
            </div>
            <input type="hidden" name="user_type" value="1">
        </form>
        <!-- 수정폼 끝 -->
    </div>
    

	<!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
    <!-- footer 끝 -->
</body>
</html>
