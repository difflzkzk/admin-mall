package dao;

import java.sql.*;
import vo.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import commons.DBUtil;

public class AdminDao {
	public Admin login(Admin admin) throws Exception {
		 Admin returnAdmin = null;
		 	DBUtil dbUtil = new DBUtil();
		 	//DBUtil 메소드를 커넥셩으로 호출하여 사용
		 	Connection conn = dbUtil.getConnection();
			String sql = "select admin_id from admin where admin_id =? and admin_pw=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, admin.adminId);
			stmt.setString(2, admin.adminPw);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				returnAdmin = new Admin();
				returnAdmin.adminId = rs.getString("admin_id");
			}
					 return returnAdmin;
	}
}
