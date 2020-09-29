<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="vo.*"  %>
<%@ page import ="dao.*"  %>
<%
	request.setCharacterEncoding("UTF-8");
	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");
	Admin paramAdmin = new Admin();
	paramAdmin.adminId = adminId;
	paramAdmin.adminPw = adminPw;
	
	AdminDao adminDao = new AdminDao();
	Admin loginAdmin = adminDao.login(paramAdmin);
	
	if(loginAdmin == null) {
		System.out.println("로그인 실패!");
		response.sendRedirect("/mall-admin/login.jsp");
		
	}else{
		System.out.println("로그인 성공!"); // 로그인 정보를 session에 저장(page < request < session < application)
		session.setAttribute("loginAdminId",loginAdmin.adminId);//session에 로그인 변수 만들기.response.sendRedirect("/mall-admin/index.jsp");
		response.sendRedirect("/mall-admin/index.jsp");
	}
%>
