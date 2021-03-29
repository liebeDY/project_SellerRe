<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/admin/adminHomePage(css).css">
    
</head>
<body>
   <p> 홈페이지 정보를 조회합니다 </p>
   
   <hr />
    
   <table>
       <tr>
          <th>총 회원 수</th>
          <td>${totalUserNum } 명</td>
       </tr>
       
      <tr>
          <th>오늘 가입한 회원 수</th>
          <td>${todayUserNum } 명</td>
       </tr>
       <tr>
       
          <th>총 상품 수</th>
          <td>${totalProductNum } 개</td>
       </tr>
       <tr>
          <th>오늘 등록된 상품 수</th>
          <td>
          		${todayProductNum } 개
          </td>
       </tr>
    </table>
	<hr />

</body>
</html>