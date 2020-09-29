<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();//지금있는 나의 세션이 지워진다
	response.sendRedirect("/mall-admin/login.jsp");
%>