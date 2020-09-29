<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.sql.*" %>

<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>


<% 
	request.setCharacterEncoding("utf-8");
	
	
Product product = new Product();
	product.productId=Integer.parseInt(request.getParameter("productId"));
	product.productName=request.getParameter("productName");
	product.productContent=request.getParameter("productContent");
	product.productSoldout=request.getParameter("productSoldout");
	//아래로 4개
	
	System.out.println(product.productId);
	System.out.println(product.productName);
	System.out.println(product.productContent);
	System.out.println(product.productSoldout);
	
	ProductDao ProductDao = new ProductDao();
	ProductDao.updateProductOne(product);
	
	response.sendRedirect("/mall-admin/product/productList.jsp");
%>
