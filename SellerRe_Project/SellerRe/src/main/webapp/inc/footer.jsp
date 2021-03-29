<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/inc/footer(css).css">	
</head>
<body>
 <!-- footer -->
    <footer id="footer">

        <!-- footer 전체 감싸는 div -->
        <div id="footer_total_container">

            <!-- footer 왼쪽 부분 : 로고, 문의메일 전체 div -->
            <div id="footer_left">

                <!-- 로고 -->
                <div class="footer_contents_div" id="footer_left_logo_div">
                    <img src="img/main_logo/logo_3.png" alt="" id="footer_logo_img">
                </div>

                <!-- 텍스트 -->
                <div class="footer_contents_div">
                    <h2 class="footer_contents_span_title">문의메일</h2>
                    <span>sellerHelp@naver.com</span>
                </div>
            </div>


            <!-- footer 오른쪽 부분 : 제작자 전체 div -->
            <div id="footer_right">


                <!-- footer 콘텐츠(텍스트) 전체 div -->
                <div class="footer_contents_div">

                    <!-- 제작자 h2 -->
                    <h2 class="footer_contents_span_title">제작자</h2>

                    <!-- 이름 명단 -->
                    <div id="footer_right_member">
                        <div id="footer_right_member_1">

                            <span>노다혜 010-3456-4321 &nbsp; 김진수 010-1234-5678</span><br>
                            <span>한동윤 010-1234-5678 &nbsp; 김범기 010-1234-5678</span><br>
                            <span>박찬호 010-1234-5678 &nbsp; 최운규 010-1234-5678</span><br>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </footer>

    <!-- copyright -->
    <div id="copyright">
        <p class="copyright">&copy; 2021 Portfolio Web Site </p>
    </div>
</body>
</html>
