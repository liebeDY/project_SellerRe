<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/user/registerForm(css).css">
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/inc/footer.css"> --%>
	
	<!-- Bootstrap -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
	
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- 다음 우편번호 검색 스크립트 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/daumPostCode.js"></script>
	
	<!-- JavaScript -->
	<script src="${pageContext.request.contextPath }/assets/js/user/registerForm.js"></script>
	
	<script type="text/javascript">
	    $(document).ready(function() {
		    $("#btn3").click(function() {
			    location.href="${pageContext.request.contextPath}/index";
	    	});
	    });
    </script>
</head>
<body>
	<div class="container">
        <div class="register_form">
            <h1> 회원가입 </h1>
        </div>
        
        <br /><br />
        
        <!--가입폼 시작-->
        <form method="post" class="form-horizontal" action="${pageContext.request.contextPath }/user/register">
            <!-- 아이디 -->
            <div class="form-group">
                <label for='userid' class="id_form col-md-6"> * 아이디 </label>
                <div class="col-md-15">
            		<input type="text" name="user_id" id="user_id" class="form-control" required/>
					<div id="idResult"></div>
            		<div class="id regex"></div>
                </div>
            </div>

			<!-- 비밀번호 -->
            <div class="form-group">
                <label for='"password"' class="col-md-6">  * 비밀번호</label>
                <div class="col-md-15">
                    <input type="password" name="user_pw" id="user_pw" class="form-control" required/>
              	  	<div id="pwdResult"></div> <br />
                </div>
            </div>
            
            <!-- 비밀번호 확인 -->
            <div class="form-group">
                <label for='password_re' class="col-md-6">  * 비밀번호 확인</label>
                <div class="col-md-15">
                    <input type="password" name="user_pw_re" id="user_pw_re" class="form-control" required/>
               		<div id="pwdResult_re"></div> <br />
                </div>
            </div>
    
    		<!-- 이름 -->
            <div class="form-group">
                <label for='name' class="col-md-6"> * 이름 </label>
                <div class="col-md-15">
                    <input type="text" name="user_name" class="form-control" required/>
                </div>
            </div>
            
            <!-- 닉네임 -->
            <div class="form-group">
				<label for='nickname' class="id_form col-md-6"> * 닉네임 </label>
				<div class="col-md-15">
					<input type="text" name="user_nickname" id="user_nickname" class="form-control" required />
					<div id="nickResult"></div> <br />
				</div>
			</div>
			
    		<!-- 이메일 -->
            <div class="form-group">
                <label for='email' class="col-md-6"> * 이메일</label>
                <div class="col-md-15">
                    <input type="email" name="user_email" id="user_email" class="form-control" placeholder="ex) honggildong@naver.com" required/>
                    <div id="emailResult"></div> <br />
                </div>
            </div>
    
    		<!-- 연락처 -->
            <div class="form-group">
                <label for='tel' class="col-md-6"> * 연락처 </label>
                <div class="col-md-15">
                    <input type="tel" name="user_tel" class="form-control" placeholder="'-'없이 입력" required/>
                </div>
            </div>

			<!-- 생년월일 -->
            <div class="form-group">
                <label for="birthday" class="col-md-6"> * 생년월일 </label>
                <div class="col-md-15">
                    <input type="date" name="user_birthday" id="user_birthday" min="1900-01-01"  class="form-control" required/>
                </div>
            </div>
    
    		<!-- 우편번호 (postcode) -->
            <div class="form-group">
                <label for='postcode'> &nbsp;&nbsp; * 우편번호</label>
                <div class="col-md-15 clearfix" id="post_container">
                    <input type="text" name="user_postcode" id="postcode" class="form-control pull-left" style='width: 30rem; margin-right: 5px'/>
                    <!-- 클릭 시, Javascript 함수 호출 : openDaumPostcode() -->
                    <input type='button' value='우편번호 찾기' class='btn btn-warning' id="btn1" onclick='execDaumPostcode("postcode", "addr1", "addr2")' required/>
                </div>
            </div>
    
    		<!-- 주소 (user_addr1) -->
            <div class="form-group">
                <label for='addr1' class="col-md-6"> * 주소</label>
                <div class="col-md-15">
                    <input type="text" name="user_addr1" id="addr1" class="form-control" required/>
                </div>
            </div>
    
    		<!-- 상세주소 (user_addr2) -->
            <div class="form-group">
                <label for='addr2' class="col-md-6"> * 상세주소</label>
                <div class="col-md-15">
                    <input type="text" name="user_addr2" id="addr2" class="form-control" required/>
                </div>
            </div>
            
    		<!-- 가입 & 재작성 버튼 -->
            <div class="form-group" >
                <div class="col-md-20" id="btn_group">
                    <button type="submit" class="btn btn-info" id="btn2">가입하기</button> 
                    <button type="reset" class="btn btn-info" id="btn3">다시작성</button>
                </div>
            </div>
            
            <input type="hidden" name="user_type" value="1">
        </form>
        <!-- 가입폼 끝 -->
    </div>
</body>
</html>