package dao;
import java.util.*;

import commons.DBUtil;
import vo.*;
import java.sql.*;

public class CategoryDao {


	//	카테고리 목록 추가
	public void insertCategory(Category category) throws Exception {
		//DB연동 주소값을 DBUtil 메서드로 호출받음
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "insert into category(category_name) values(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.categoryName);
		stmt.executeLargeUpdate();
		conn.close();
	}
	
	
	// 카테고리 목록 출력
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
	
	
	// 카테고리 목록 삭제
	public void deleteCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "delete from category where category_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, category.categoryId);
		stmt.executeLargeUpdate();
		conn.close();
	}
	
	
	// 카테고리 목록 수정
	public void updateCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "update category set category_name = ? where category_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.categoryName);
		stmt.setInt(2, category.categoryId);
		stmt.executeLargeUpdate();
		conn.close(); //순번이 자꾸 안바뀜 .
	}
	// 카테고리 수정 에 필요한 값 추출 (Action으로 보내질 디지털 쪼가리들)
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
