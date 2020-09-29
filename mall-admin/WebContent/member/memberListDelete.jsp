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

	String memberEmail = request.getParameter("member_email");
	Member member = new Member();
	member.memberEmail = memberEmail;
	MemberDao memberDao = new MemberDao();
	memberDao.deleteMember(member);
	
	response.sendRedirect("/mall-admin/member/memberList.jsp");
%>