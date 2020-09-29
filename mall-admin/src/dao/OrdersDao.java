package dao;
import java.util.*;
import vo.*;
import java.sql.*;
import commons.DBUtil;
public class OrdersDao {

	//order_state의 리스트값을 보여줌
	public ArrayList<String> selectOrdersStateList() throws Exception {
		ArrayList<String> list = new ArrayList<String>();
		//마리아db의 주소값을 DBUtil메소드로 호출받음
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql ="SELECT DISTINCT orders_state FROM orders";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
			list.add(rs.getString("orders_state"));
		}
		conn.close();
		return list;
	}
	
	//주문 내용 을 출력하는 메서드 
	//orders의 값과 product의 값을 포함하여 ArrayList로 가져온다.
	//selectOrdersList로 정의함
	public ArrayList<OrdersAndProduct> selectOrdersList() throws Exception{
		//리턴으로 보낼 ArrayList 생성
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		//마리아db주소값 연동
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//orders테이블의 값과 product테이블의 name값을 가져와 조인한다.
		String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			//객체를 지정
			OrdersAndProduct ordersAndProduct = new OrdersAndProduct();
			//포함되어 있는 클래스의 값을 표시한다.
			ordersAndProduct.orders = new Orders();
			ordersAndProduct.product = new Product();
			
			ordersAndProduct.orders.ordersId = rs.getInt("o.orders_id"); //주문 번호(PK)
			ordersAndProduct.orders.productId = rs.getInt("o.product_id"); //상품 번호(FK)
			ordersAndProduct.orders.ordersAmount = rs.getInt("o.orders_amount"); //주문한 상품 갯수
			ordersAndProduct.orders.ordersPrice = rs.getInt("o.orders_price"); //주문한 상품의 총 가격
			ordersAndProduct.orders.memberEmail = rs.getString("o.member_email"); //주문한 사람의 이메일
			ordersAndProduct.orders.ordersAddr = rs.getString("o.orders_addr"); //주문산 사람의 주소
			ordersAndProduct.orders.ordersState = rs.getString("o.orders_state"); //주문 상태(결제완료,배송완료,주문취소,배송준비중)
			ordersAndProduct.orders.ordersDate = rs.getString("o.orders_date"); //주문한 날짜
			ordersAndProduct.product.productName = rs.getString("p.product_name");// 상품의 이름
			
			list.add(ordersAndProduct);
		}
		conn.close();
		return list;
	}
	// ordersState에서 검색한 값이랑 일치되는 값을 매칭시킴
	public ArrayList<OrdersAndProduct> selectOrdersListByState(String ordersState) throws Exception{
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id  where o.orders_state = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ordersState);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			//객체를 지정
			OrdersAndProduct ordersAndProduct = new OrdersAndProduct();
			//포함되어 있는 클래스의 값을 표시한다.
			ordersAndProduct.orders = new Orders();
			ordersAndProduct.product = new Product();
			
			ordersAndProduct.orders.ordersId = rs.getInt("o.orders_id");
			ordersAndProduct.orders.productId = rs.getInt("o.product_id");
			ordersAndProduct.orders.ordersAmount = rs.getInt("o.orders_amount");
			ordersAndProduct.orders.ordersPrice = rs.getInt("o.orders_price");
			ordersAndProduct.orders.memberEmail = rs.getString("o.member_email");
			ordersAndProduct.orders.ordersAddr = rs.getString("o.orders_addr");
			ordersAndProduct.orders.ordersState = rs.getString("o.orders_state");
			ordersAndProduct.orders.ordersDate = rs.getString("o.orders_date");
			ordersAndProduct.product.productName = rs.getString("p.product_name");
			
			list.add(ordersAndProduct);
		}
		conn.close();
		return list;
	}
	
	public void updateOrdersStateById(Orders orders) throws Exception{
		
	}	
	public void updateOrdersState(Orders orders) {
		String sql = "update orders set orders_state = ? where orders_id = ?";
	}
	
	public Orders selectOrdersOne(int OrdersId) {
		String sql ="select orders_id, orders_state from orders where orders_id=? ";
		return null;
	}
}
