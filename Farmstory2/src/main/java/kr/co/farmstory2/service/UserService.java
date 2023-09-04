package kr.co.farmstory2.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dao.UserDAO;
import kr.co.farmstory2.dto.UserDTO;

public class UserService {

	private static UserService instance = new UserService();
	public static UserService getInstance() {
		return instance;
	}
	private UserService() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	UserDAO dao = UserDAO.getInstance();
	
	public void insertUser(UserDTO dto) {
		dao.insertUser(dto);
	}
	public UserDTO selectUser(String uid, String pass) {
		return dao.selectUser(uid, pass);
	}
	public int selectCountUid(String uid) {
		return dao.selectCountUid(uid);
	}
	public int selectCountNickname(String nick) {
		return dao.selectCountNickname(nick);
	}
	public int selectCountHp(String hp) {
		return dao.selectCountHp(hp);
	}
	public int selectCountEmail(String email) {
		return dao.selectCountEmail(email);
	}
	public List<UserDTO> selectUsers(String uid) {
		return dao.selectUsers(uid);
	}
	public void updateUser(UserDTO dto) {
		dao.updateUser(dto);
	}
	public void deleteUser(String uid) {
		dao.deleteUser(uid);
	}
}
