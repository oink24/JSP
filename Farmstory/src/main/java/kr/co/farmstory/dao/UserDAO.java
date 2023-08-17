package kr.co.farmstory.dao;

import kr.co.farmstory.db.DBHelper;
import kr.co.farmstory.db.SQL;
import kr.co.farmstory.dto.TermsDTO;
import kr.co.farmstory.dto.UserDTO;

public class UserDAO extends DBHelper {
	
	// singleton
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	// CRUD
	public TermsDTO selectTerms() {
		TermsDTO dto = new TermsDTO();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_TERMS);
			
			if (rs.next())
			{
				dto.setTerms(rs.getString(1));
				dto.setPrivacy(rs.getString(2));
			}
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public void insertUser(UserDTO dto) {
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(SQL.INSERT_USER);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getNickname());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getHp());
			psmt.setString(7, dto.getZip());
			psmt.setString(8, dto.getAddr1());
			psmt.setString(9, dto.getAddr2());
			psmt.setString(10, dto.getRegip());
			
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public UserDTO selectUser(String uid, String pass) {
		return null;
	}
	
	// 중복체크
	public int selectCountUid(String uid) {
		int result = 0;
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_UID);
			psmt.setString(1, uid);
			
			rs = psmt.executeQuery();
			
			if (rs.next())
				result = rs.getInt(1);
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public int selectCountNicname(String nickname) {
		int result = 0;
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_NICKNAME);
			psmt.setString(1, nickname);
			
			rs = psmt.executeQuery();
			
			if (rs.next())
				result = rs.getInt(1);
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public int selectCountEmail(String email) {
		int result = 0;
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_EMAIL);
			psmt.setString(1, email);
			
			rs = psmt.executeQuery();
			
			if (rs.next())
				result = rs.getInt(1);
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public int selectCountHp(String hp) {
		int result = 0;
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_HP);
			psmt.setString(1, hp);
			
			rs = psmt.executeQuery();
			
			if (rs.next())
				result = rs.getInt(1);
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void selectUsers() {}
	public void updateUser() {}
	public void deleteUser() {}
}