<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 	//세션안에 로그인이 null이라면 접근을 허용하지 않는다.
	if(session.getAttribute("loginAdminId")==null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

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
			CategoryDao categoryDao = new CategoryDao();
			ArrayList<Category> categoryList = categoryDao.selectCategoryList();
			
		%>
		<h1 class="bg-warning text-white">상품 추가</h1>
		<form method="post" action="/mall-admin/product/addProductAction.jsp">
			<table class="table table-bordered">
				<tr class="table-info">
					<td>category_id</td>
					<td>
						<select name="categoryId">
							<option value="">카테고리 선택</option>
							<%
								for(Category c : categoryList) {
							%>
								<option value="<%=c.categoryId %>"><%=c.categoryName %></option>
							<%
								}
							%>
						</select>
					</td>
				</tr>	
				<tr class="table-warning">
					<td>product_name</td>
					<td>
						<input type="text" name="productName">
					</td>
				</tr>
				<tr class="table-info">
					<td>product_price</td>
					<td>
						<input type="text" name="productPrice">
					</td>
				</tr>
				<tr class="table-warning">
					<td>product_content</td>
					<td>
						<textarea rows="5" cols="80" name="productContent"></textarea>
					</td>
				</tr>
				<tr class="table-info">
					<td>product_soldout</td>
					<td>
						<input type="radio" name="productSoldout" value="N" checked="checked">[판매중]
						<input type="radio" name="productSoldout" value="Y">[품절]
					</td>
				</tr>															
			</table>
			<button type="submit" class="btn btn-warning text-white" role="button" >[확 인] </button>
		</form>
	</div>
</body>
</html>