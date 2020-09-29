<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%	//로그인 값이 null이면 접근불가
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall_admin/login.jsp");
		return;
	}
%>

<%
	request.setCharacterEncoding("utf-8");
	
	int productId = Integer.parseInt(request.getParameter("productId"));
	Product product = new Product();
	product.productId = productId;
	ProductDao productDao = new ProductDao();
	productDao.deleteProduct(product);
	
	response.sendRedirect("/mall-admin/product/productList.jsp");
%>
