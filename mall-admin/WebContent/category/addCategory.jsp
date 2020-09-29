<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId")==null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
		
		<h1 class="bg-secondary text-white">카테고리 추가</h1>
		<form method="post" action="/mall-admin/category/addCategoryAction.jsp">
			<div class="btn btn-info text-white">카테고리 이름 입력</div>
			<div><input type="text" name="categoryName"></div>
			<div><button type="submit" class="btn btn-info text-white">확인</button></div>
		</form>
	</div>
</body>
</html>