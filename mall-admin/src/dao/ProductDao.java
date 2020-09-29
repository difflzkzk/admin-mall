package dao;

import java.util.*;

import commons.DBUtil;

import java.sql.*;
import vo.*;

public class ProductDao {
	
	public void updateProductSoldout(int productId, String productSoldout) throws Exception  {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();//DBUtil 메소드를 호출하여 DB주소값을 호출한다
		String sql = "update product set product_soldout = ? where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		if(productSoldout.equals("Y")) {
			stmt.setString(1, "N");
		} else {
			stmt.setString(1, "Y");
		}
		stmt.setInt(2, productId);
		
		int row = stmt.executeUpdate();
		System.out.println(row +"행 수정");
	}
	
	public Product selectProductOne(int productId) throws Exception {
		Product product = null;
		//String driver = "org.mariadb.jdbc.Driver";
		//String dbaddr = "jdbc:mariadb://localhost:3306/mall";
		//String dbid = "root";
		//String dbpw = "java1004";
		//Class.forName(driver);
		//Connection conn = DriverManager.getConnection(dbaddr, dbid, dbpw);
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql="select product_id, category_id, product_name, product_price, product_content, product_soldout, product_pic from product where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			product = new Product();
			product.productId = rs.getInt("product_id");
			product.categoryId = rs.getInt("category_id");
			product.productName = rs.getString("product_name");
			product.productPrice = rs.getInt("product_price");
			product.productContent = rs.getString("product_content");
			product.productSoldout = rs.getString("product_soldout");
			product.productPic = rs.getString("product_pic"); // default.jpg를 가져온다.
		}
		
		return product;
	}
	
	public void insertProduct(Product product) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection(); //DBUtil 메소드를 호출하여 DB주소값을 호출한다
		String sql = "insert into product(category_id, product_name, product_price, product_content, product_soldout) values (?,?,?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.categoryId);
		stmt.setString(2, product.productName);
		stmt.setInt(3, product.productPrice);
		stmt.setString(4, product.productContent);
		stmt.setString(5, product.productSoldout);
		stmt.executeUpdate();
		
		conn.close();
		
	}
	
	public ArrayList<Product> selectProductListBycategoryId(int categoryId) throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, category_id, product_name, product_price, product_content, product_soldout from product where category_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,  categoryId);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product();
			p.productId = rs.getInt("product_id");
			p.categoryId = rs.getInt("category_id");
			p.productName = rs.getString("product_name");
			p.productPrice = rs.getInt("product_price");
			p.productContent = rs.getString("product_content");
			p.productSoldout = rs.getString("product_soldout");
			list.add(p);
		}
		conn.close();
		return list;
	}
	
	public ArrayList<Product> selectProductList() throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();	
		String sql = "select product_id, category_id, product_name, product_price, product_content, product_soldout from product";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product();
			p.productId = rs.getInt("product_id");
			p.categoryId = rs.getInt("category_id");
			p.productName = rs.getString("product_name");
			p.productPrice = rs.getInt("product_price");
			p.productContent = rs.getString("product_content");
			p.productSoldout = rs.getString("product_soldout");
			list.add(p);
		}
		conn.close();
		return list;
	}
	
	public Product selectProductOne(Product product) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select product_id, category_id, product_name, product_price, product_content, product_soldout from product";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		//Product product = null;
		while(rs.next()) {
			product = new Product();
			product.productId = rs.getInt("product_id");
			product.categoryId = rs.getInt("category_id");
			product.productName = rs.getString("product_name");
			product.productPrice = rs.getInt("product_price");
			product.productContent = rs.getString("product_content");
			product.productSoldout = rs.getString("product_soldout");
		}
		conn.close();
		return product;
	}
	
	
	public void deleteProduct(Product product) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "delete from product where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.productId); //주키 삭제
		stmt.executeUpdate();
		conn.close();
	}
	
	public void updateProductOne(Product product) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "update product set product_name=?,product_price=?,product_content=? where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, product.productName);
		stmt.setInt(2, product.productPrice);
		stmt.setString(3, product.productContent);
		stmt.setInt(4, product.productId);
		stmt.executeLargeUpdate();
		conn.close();
	}
	

	public Product updatemodifyProductPic(Product product) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql ="update product set product_pic where product_id";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,product.productPic);
		stmt.executeUpdate();
		conn.close();
		return product;
		}
		
		
	
	
	
}
