package dao;
import java.util.*;

import commons.DBUtil;
import vo.*;
import java.sql.*;

public class CategoryDao {


	//	ī�װ� ��� �߰�
	public void insertCategory(Category category) throws Exception {
		//DB���� �ּҰ��� DBUtil �޼���� ȣ�����
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "insert into category(category_name) values(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.categoryName);
		stmt.executeLargeUpdate();
		conn.close();
	}
	
	
	// ī�װ� ��� ���
	public ArrayList<Category> selectCategoryList() throws Exception {
		ArrayList<Category> list = new ArrayList<Category>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select category_id, category_name from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.categoryId = rs.getInt("category_id");
			category.categoryName = rs.getString("category_name");
			list.add(category);
		}
		conn.close();
		return list;
	}
	
	
	// ī�װ� ��� ����
	public void deleteCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "delete from category where category_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, category.categoryId);
		stmt.executeLargeUpdate();
		conn.close();
	}
	
	
	// ī�װ� ��� ����
	public void updateCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "update category set category_name = ? where category_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.categoryName);
		stmt.setInt(2, category.categoryId);
		stmt.executeLargeUpdate();
		conn.close(); //������ �ڲ� �ȹٲ� .
	}
	// ī�װ� ���� �� �ʿ��� �� ���� (Action���� ������ ������ �ɰ�����)
	public Category selectCategory(Category categroy) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select category_id, category_name from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		Category category = null;
		while(rs.next()) {
			category = new Category();
			category.categoryId = rs.getInt("category_id");
			category.categoryName = rs.getString("category_name");
			
		}
			conn.close();
			return category;
	}
}
