package dao;
import vo.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import commons.DBUtil;

	//공지 리스트 출력
	public class NoticeDao {

	//공지 상세보기
		public Notice selectNoticeOne(int noticeId) throws Exception{
			Notice notice = null;
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			String sql="select notice_id, notice_title, notice_content, notice_date from notice where notice_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, noticeId);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				notice = new Notice();
				notice.noticeId = rs.getInt("notice_id");
				notice.noticeTitle = rs.getString("notice_title");
				notice.noticeContent = rs.getString("notice_content");
				notice.noticeDate = rs.getString("notice_date");
				
			}
			conn.close();
			return notice;
		}
		//전체리스트 출력
		public ArrayList<Notice> selectNoticeList() throws Exception {
			ArrayList<Notice> list = new ArrayList<Notice>();
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			String sql = "select notice_id, notice_title, notice_content, notice_date from notice order by notice_id desc limit 0, 10";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Notice n =new Notice();
				n.noticeId = rs.getInt("notice_id");
				n.noticeTitle = rs.getString("notice_title");
				n.noticeContent = rs.getString("notice_content");
				n.noticeDate = rs.getString("notice_date");
				list.add(n);
			}
			conn.close();
			return list;
		}
		
		public Notice insertNotice(Notice notice) throws Exception {
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection(); //DBUtil 메소드를 호출하여 DB주소값을 호출한다
			String sql = "insert into notice(notice_id,notice_title,notice_contnent,notice_date) values(?,?,now())";
			PreparedStatement stmt = conn.prepareStatement(sql);
		
			stmt.setString(1, notice.noticeTitle);
			stmt.setString(2, notice.noticeContent);
			
			stmt.executeUpdate();
			
			
			return notice;
		}
		
		public void updateNotice(Notice notice) throws Exception{
			//데이터 베이스 연결
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			//sql문
			String sql ="update notice set notice_title = ?, notice_content = ?, notice_date = now() where notice_id = ?";
			//데이터베이스 접속
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, notice.getNoticeTitle());
			stmt.setString(2, notice.getNoticeContent());
			stmt.setInt(3, notice.getNoticeId());
			//결과 수정
			stmt.executeLargeUpdate();
		}
		
}
