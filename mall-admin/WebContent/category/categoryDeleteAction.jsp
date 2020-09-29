<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>

<%
	request.setCharacterEncoding("utf-8");

	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	Category category = new Category();
	category.categoryId = categoryId;
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.deleteCategory(category);
	
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>