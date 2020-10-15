<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	if(session.getAttribute("loginAdminId") == null){
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
	<%	
		int productId = Integer.parseInt(request.getParameter("productId"));
	 	System.out.println(productId+ "<--productId");
	 	
		Product product = new ProductDao().selectProductOne(productId);
	%>
		<h1 class="bg-secondary text-white">상품상세보기</h1>
		<table class="table table-bordered">
				<tr>
					<td>상품 사진</td>
					<td><img src="./image/default.jpeg"><%=product.getProductPic() %>
						<a href="/mall-admin/product/modifyProductPic.jsp?productId=<%=product.getProductId() %>">이미지 수정</a>
					</td>
				</tr>
				<tr>
					<td>상품 번호</td>
					<td><%=product.productId %></td>
				</tr>
				<tr>
					<td>카테고리 번호</td>
					<td><%=product.categoryId %></td>				
				</tr>
				<tr>
					<td>상품 이름</td>
					<td><%=product.productName %></td>				
				</tr>
				<tr>
					<td>상품 가격</td>
					<td><%=product.productPrice %></td>				
				</tr>
				<tr>
					<td>코멘트</td>
					<td><%=product.productContent %></td>				
				</tr>
				<tr>
					<td>판매 현황</td>
					<td>
						<%				
							if(product.productSoldout.equals("Y")) {
						%>		
								<a href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.productId%>&productSoldout=<%=product.productSoldout%>" class="btn btn-danger text-white" role="button">품절</a>
						<%		
							} else {
						%>		
								<a href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.productId%>&productSoldout=<%=product.productSoldout%>" class="btn btn-info text-white" role="button">판매중</a>
						<%		
							}
						%>
					</td>				
				</tr>		
				<tr class="table-danger">
					<td><a href="/mall-admin/product/productUpdate.jsp?productId=<%=productId%>"class="btn btn-info" role="button">수정</a>	</td>
					<td><a href="/mall-admin/product/productDeleteAction.jsp?productId=<%=productId%>"class="btn btn-info" role="button">삭제</a>	</td>
				</tr>					
		</table>
	</div>
</body>
</html>
