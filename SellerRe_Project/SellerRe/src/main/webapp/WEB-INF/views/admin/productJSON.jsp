<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
[
	<c:forEach var="i" items="${allProdList }" varStatus="status">
		<c:if test="${not status.first }">
			,
		</c:if>
		{"product_num":${i.product_num }, "product_name":"${i.product_name }", "product_price":"${i.product_price }", "product_info":"${i.product_info }", "product_user_id":"${i.user_id }"}
	</c:forEach>
]