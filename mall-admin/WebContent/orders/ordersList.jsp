<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId")==null){
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
<title>ordersList</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp" ></jsp:include>
	</div>
	<%

	request.setCharacterEncoding("UTF-8");
	//페이지에 출력할 주문내용
	String ordersState = ""; 
	//null인지 체크
	if (request.getParameter("ordersState") != null) {
		//ordersState를 입력값을 저장하는 변수로 지정
		ordersState = request.getParameter("ordersState");
	}
	//dao에 있는 주문 목록을 받아온다.
	OrdersDao ordersDao = new OrdersDao();
	ArrayList<OrdersAndProduct> list = null;
	ArrayList<String> list2 = null;
	
	//리스트 전체출력
	if (ordersState.equals("")) {
		list = ordersDao.selectOrdersList();
	//검색한 주문 상태 리스트 출력	
	} else {
		list = ordersDao.selectOrdersListByState(ordersState);
	}
		list2 = ordersDao.selectOrdersStateList();
	%>
	<h1>주문 목록</h1>
	<form method="post" action="/mall-admin/orders/ordersList.jsp">
		<select name="ordersState">
			<option value="">선택</option>
			<%
				//주문 상태 검색 버튼 출력하는 부분
				for(String s : list2){				
			%>			
						<option><%=s %></option>
			<%				
					}	
			%>
		</select>
		<button type="submit">주문상태별로 보기</button>
	</form>
	<table Class="table">
		<thead>
			<tr>
				<th>orders_id</th>
				<th>product_id</th>
				<th>product_name</th>
				<th>orders_amount</th>
				<th>orders_price</th>
				<th>member_email</th>
				<th>orders_addr</th>
				<th>oders_state</th>
				<th>orders_date</th>
				<th>orders_state 수정</th>
			</tr>
		</thead>
		<tbody>
			<%
				//리스트를 불러온다.
				for(OrdersAndProduct ordersAndProduct : list) {
			%>
			<tr>
				<td><%=ordersAndProduct.orders.ordersId %></td>
				<td><%=ordersAndProduct.orders.productId %></td>
				<td><%=ordersAndProduct.product.productName %></td>
				<td><%=ordersAndProduct.orders.ordersAmount %></td>
				<td><%=ordersAndProduct.orders.ordersPrice %></td>
				<td><%=ordersAndProduct.orders.memberEmail %></td>
				<td><%=ordersAndProduct.orders.ordersAddr %></td>
				<td><%=ordersAndProduct.orders.ordersState %></td>
				<td><%=ordersAndProduct.orders.ordersDate %></td>
				<td><a href = "/mall-admin/orders/modifyOrdersState.jsp?ordersId<%=ordersAndProduct.orders.ordersId%>" >orders state 수정</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
		
	</table>
</div>
</body>
</html>