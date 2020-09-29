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
	
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String categoryName = request.getParameter("categoryName");
	
	Category category = new Category();
	category.categoryId = categoryId;
	category.categoryName = categoryName;
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.updateCategory(category);
	
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>
