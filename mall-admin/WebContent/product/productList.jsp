<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>productList</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<%
		request.setCharacterEncoding("utf-8");
		int categoryId = -1;
		if(request.getParameter("categoryId") != null){
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}
		
		//과일 리스트 출력 (선택하여 출력)
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = null;		
		if(categoryId == -1){
			productList= productDao.selectProductList();
		} else {
			productList = productDao.selectProductListBycategoryId(categoryId);
		}
		
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	
	<h1 class="bg-secondary text-white">상품 목록</h1>
	
	<div>
		<%
			for(Category c : categoryList) {
		%>
			<a href="/mall-admin/product/productList.jsp?categoryId=<%=c.categoryId%>" class="btn btn-info" role="button" ><%=c.categoryName%></a>
		<%
			}
		%>	
	</div>
	
	
	<table class="table table-light table-striped table-hover">
		<thead>
			<tr>
				<th>상품 번호</th>
				<th>카테고리 번호</th>
				<th>상품 이름</th>
				<th>상품 가격</th>
				<th>코멘트</th>
				<th>판매 현황</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Product p : productList) {
					if(p.productSoldout.equals("Y")){
			%>
				<tr>
					<td><%=p.productId%></td>
					<td><%=p.categoryId%></td>
					<td><%=p.productName%></td>
					<td><%=p.productPrice%></td>
					<td><%=p.productContent%></td>
					<td>품절</td>
					<td>
						<del>
							<a href="/mall-admin/product/productOne.jsp?productId=<%=p.productId%>">제품 상세보기</a>
						</del>
					</td>
					
				</tr>	
			<%		
				} else {
			%>
				<tr>
					<td><%=p.productId%></td>
					<td><%=p.categoryId%></td>
					<td><%=p.productName%></td>
					<td><%=p.productPrice%></td>
					<td><%=p.productContent%></td>
					<td>판매중</td>
					<td>
						<del>
							<a href="/mall-admin/product/productOne.jsp?productId=<%=p.productId%>">제품 상세보기</a>
						</del>
					</td>
				</tr>
			<%
					}
				}
			%>	

		</tbody>		
	</table>
		<div>
			<a href="/mall-admin/product/addProduct.jsp" class="btn btn-warning text-white " role="button"  >상품 추가</a>
			<a href="/mall-admin/product/productList.jsp" class="btn btn-info" role="button">원래대로</a>
		</div>
	</div>
</body>
</html>