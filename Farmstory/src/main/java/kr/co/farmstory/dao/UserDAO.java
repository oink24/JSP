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
	
	public void insertUser(UserDTO dto) {}
	
	public UserDTO selectUser(String uid, String pass) {
		return null;
	}
	
	// 중복체크
	public int selectCountUid(String uid) {
		return 0;
	}
	public int selectCountNicname(String nickname) {
		return 0;
	}
	public int selectCountHp(String hp) {
		return 0;
	}
	public int selectCountEmail(String email) {
		return 0;
	}
	
	public void selectUsers() {}
	public void updateUser() {}
	public void deleteUser() {}
}