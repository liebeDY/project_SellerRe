<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/admin/adminUser(css).css" >
	
	<!-- JS -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js" ></script>
	<script src="${pageContext.request.contextPath }/assets/js/admin/adminUser.js"></script>
</head>
<body>
   
    <p> 회원을 검색 / 삭제합니다 </p>
    
    <hr />
    
    <table>
      <tr>
         <td class="search" colspan="2">
            <p>
               <img class="icon" src="../../assets/img/main_search/search_icon.png"> <b>회원검색</b>
               <input type="text" class="text_box" id="search_user_id" name="search_user_id" placeholder="검색할 ID를 입력하세요" value="" /> 
               <input type="button" id="search_user_btn" value="검색">
            </p>
         </td>
      </tr>

      <tr>
         <th> Id </th>
         <td>
            <form action="${pageContext.request.contextPath }/user/userProfile">
               <span id="id"></span>
            </form>
         </td>
      </tr>

      <tr>
         <th> Name </th>
         <td><span id="name"></span></td>
      </tr>

      <tr>
         <th> Nickname </th>
         <td><span id="nickname"></span></td>
      </tr>

      <tr>
         <th class="type"> type </th>
         <td><span id="type"></span></td>
      </tr>

      <tr>
         <td colspan="2" class="del_td"><input type="button" id="del_btn" value="회원 삭제" /></td>
      </tr>
   </table>
</body>
</html>