<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login/jsp");
		return;
	}
%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.ArrayList" %>
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
		<%
			request.setCharacterEncoding("utf-8");
			
			int categoryId = Integer.parseInt(request.getParameter("categoryId"));	
			
			CategoryDao categoryDao = new CategoryDao();
			Category category = null;
			category = categoryDao.selectCategory(category);
		%>
		<h1 class="bg-dark text-white">카테고리 수정</h1>
		<form method="post" action="/mall-admin/category/categoryUpdateAction.jsp">
			<table class="table table-bordered">
				<thead>
					<tr class="table">
						<th>카테고리 번호</th>
						<th>카테고리 이름</th>
					</tr>
				</thead>
				
				<tbody>
						<tr class="table">
							<td><input type="hidden" value=<%=category.categoryId %> name="categoryId"><%=category.categoryId %></td>
							<td><input type="text" value=<%=category.categoryName %> name="categoryName"></td>
						</tr>
				</tbody>
			</table>
			<button type="submit" class="btn btn-info text-white" role="button">수정 확인</button>
		</form>
	</div>
</body>
</html>