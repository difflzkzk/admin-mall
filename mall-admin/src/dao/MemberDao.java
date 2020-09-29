package dao;
import commons.DBUtil;
import vo.*;
import java.sql.*;
import java.util.*;

public class MemberDao {
	public void insertMember(Member member) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into member(member_email, member_pw, member_name, member_date) values(?,?,?,now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		stmt.executeLargeUpdate();
	
		
		conn.close();
	}
	
	public ArrayList<Member> selectMemberList() throws Exception{
		ArrayList<Member> list = new ArrayList<Member>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select member_email,member_pw,member_name,member_date from member";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Member m = new Member();
			m.memberEmail = rs.getString("member_email");
			m.memberPw = rs.getString("member_pw");
			m.memberName = rs.getString("member_name");
			m.memberDate = rs.getNString("member_date");
			list.add(m);
			
		}
		conn.close();
		return list;
	}
	
	public void deleteMember(Member member) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql ="delete from member where member_email = ? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.memberEmail); // 주키 삭제 
		stmt.executeLargeUpdate();
		conn.close();
	}
	

}
