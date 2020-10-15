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
	
	public String login(Member member) throws Exception {
		String memberEmail = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select member_email from member where member_email=? and member_pw=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.memberEamil);
		stmt.setString(2, member.memberPw);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) { // 로그인 성공
			memberEmail = rs.getString("member_email");
		}
		conn.close();
		return memberEmail;
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
		
		String sql ="delete from member where member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.memberEmail); // 주키 삭제 
		stmt.executeLargeUpdate();
		conn.close();
	}
	
	public Member selectMemberEmailCk(String memberEmail) throws Exception {
		Member member = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		/*
		 * SELECT id
			from
			(SELECT member_email id FROM member
			UNION
			SELECT admin_id id FROM admin) t
			WHERE id = ?;
		 */
		String sql = "select id from (select member_email id from member union select admin_id id from admin) t where id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			// 지금 입력한 이메일은 이미 가입중이라 사용할 수 없다.
			member = new Member();
			member.memberEamil = rs.getString("id");
		}
		conn.close();
		return member;
	}


}
