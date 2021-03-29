<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/qna/qna_List.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/qna/qna_Button.css">
	
	<!-- JS -->
	<script src="${pageContext.request.contextPath }/assets/js/qna/QnA_Button.js"></script>

</head>
<body>
   	<!-- top 영역 시작 -->
   	<c:if test="${sessionScope.user_type == 1 || empty sessionScope.user_id}">
		<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
    </c:if>
    <c:if test="${sessionScope.user_type == 2 }">
		<c:import url="${pageContext.request.contextPath }/inc/adminTopbar.jsp" />
    </c:if>
    <!-- top 영역 끝 -->
    	
	<form id="QnA_Button_Form">
		<table class="QnA_Button_Table">
	        <tr>
	            <td class="QnA_Button_td">
	            	<input type="button" class="QnA_btn_1" name="QnA_btn_1" id="QnA_btn_1" value="구매 / 판매">
	            </td>
	            
	            <td class="QnA_Button_td">
	            	<input type="button" class="QnA_btn_2" name="QnA_btn_2" id="QnA_btn_2" value="계정">
	            </td>
	            
	            <td class="QnA_Button_td">
	            	<input type="button" class="QnA_btn_3" name="QnA_btn_3" id="QnA_btn_3" value="이용 제재">
	            </td>
	            
	            <td class="QnA_Button_td">
	            	<input type="button" class="QnA_btn_4" name="QnA_btn_4" id="QnA_btn_4" value="거래시 주의사항">
	            </td>
	            
	            <td class="QnA_Button_td">
	            	<input type="button" class="QnA_btn_5" name="QnA_btn_5" id="QnA_btn_5" value="기타">
	            </td>
	        </tr>
	    </table>
	    
	    <input type="hidden" name="qna_type" id="qna_type" value="">
	    
	    
    </form>
   <table class="QnA_Content_List_Table">
   
      <c:if test="${empty QnAList  }">
         <tr>
              <td class="QnA_Content_List_td">
              <c:choose>
              	<c:when test="${sessionScope.user_type == 1 or empty sessionScope.user_type }">
	               	<button class="QnA_content_btn" onClick="alert('관리자가 아닙니다'); return false;">등록된 QnA가 없습니다. 작성 버튼을 눌러 등록하세요.</button>
              	</c:when>
              	
              	<c:otherwise>
	              <a href="${pageContext.request.contextPath }/qna/qna_WritingForm">
	               	<input class="QnA_content_btn" type="button" value="등록된 QnA가 없습니다. 작성 버튼을 눌러 등록하세요." />
	              </a>
              	</c:otherwise>
              </c:choose>
            </td>
         </tr>
      </c:if>
      
      <c:if test="${ not empty QnAList  }">
         <c:forEach var="q" items="${QnAList }">
             <tr>
                 <td class="QnA_Content_List_td">
                     <a href="${pageContext.request.contextPath }/qna/mav_qna_content?qna_num=${q.qna_num }">
                         <input class="QnA_content_btn" type="button" value="${q.qna_title }" />
                      </a>
                  </td>
              </tr>
         </c:forEach>
      </c:if>
      
      <c:if test="${sessionScope.user_type == 2 }">
           <tr>
               <td class="writing_btn_td">
    	           	<a href="${pageContext.request.contextPath }/qna/qna_WritingForm">
        	           <input class="qna_writing_btn" name="qna_writing_btn" type="button" value="Q&A 작성">
	               	</a>	
               </td>
           </tr>
        </c:if>
    </table>
    
    <!-- footer 영역 시작 -->
    <c:if test="${sessionScope.user_type == 1 || empty sessionScope.user_id}">
		<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	</c:if>
    <!-- footer 영역 끝 -->
</body>
</html>