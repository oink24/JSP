package ko.co.Jboard2.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ko.co.Jboard2.db.DBHelper;
import ko.co.Jboard2.db.SQL;
import ko.co.Jboard2.dto.UserDTO;

public class UserDAO extends DBHelper {

	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertUser(UserDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_USER);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getNick());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getHp());
			psmt.setString(7, dto.getZip());
			psmt.setString(8, dto.getAddr1());
			psmt.setString(9, dto.getAddr2());
			psmt.setString(10, dto.getRegip());
			
			psmt.executeUpdate();
			close();
			
		}catch(Exception e) {
			logger.error("insertUser error : " + e.getMessage());
		}
	}
	
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
			logger.error("selectCountUid error : " + e.getMessage());
		}
		
		return result;
	}
	public int selectCountNickname(String nick) {
		
		int result = 0;
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_NICKNAME);
			psmt.setString(1, nick);
			
			rs = psmt.executeQuery();
			
			if (rs.next())
				result = rs.getInt(1);
			
			close();
			
		}catch(Exception e) {
			logger.error("selectCountNickname error : " + e.getMessage());
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
			
		}catch(Exception e){
			logger.error("selectCountHp error : " + e.getMessage());
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
			
		}catch(Exception e){
			logger.error("selectCountEmail error : " + e.getMessage());
		}
		
		return result;
	}
	
	public UserDTO selectUser(String uid) {
		return null;
	}
	
	public List<UserDTO> selectUsers(String uid) {
		return null;
	}
	
	public void updateUser(UserDTO dto) {}
	
	public void deleteUser(String uid) {}
}
