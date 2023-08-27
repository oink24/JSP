package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.User5DTO;

public class User5DAO {

	// 로거 생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertUser5(User5DTO dto) {
		try {
			logger.info("User5DAO insertUser5...1");
			
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			
			DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
			Connection conn = ds.getConnection();
			
			PreparedStatement psmt = conn.prepareStatement("INSERT INTO `user5` VALUES (?,?,?,?,?,?,?)");
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getBirth());
			psmt.setInt(4, dto.getGender());
			psmt.setInt(5, dto.getAge());
			psmt.setString(6, dto.getAddr());
			psmt.setString(7, dto.getHp());
			
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();			
			logger.info("User5DAO insertUser5...2");
			
		}catch(Exception e) {
			logger.error("※※※ User5DAO insertUser5 error : " + e.getMessage());
		}
	}
	
	public User5DTO selectUser5(String uid) {
		
		User5DTO dto = new User5DTO();
		try {
			logger.info("User5DAO selectUser5...1");
			
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			
			DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
			Connection conn = ds.getConnection();
			
			PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `user5` WHERE `uid`=?");
			psmt.setString(1, uid);
			
			ResultSet rs = psmt.executeQuery();
			
			if (rs.next())
			{
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setBirth(rs.getString(3));
				dto.setGender(rs.getString(4));
				dto.setAge(rs.getString(5));
				dto.setAddr(rs.getString(6));
				dto.setHp(rs.getString(7));
			}
			
			rs.close();
			psmt.close();
			conn.close();
			logger.info("User5DAO selectUser5...1");
			
		}catch(Exception e) {
			logger.error("※※※ User5DAO selectUser5 error : " + e.getMessage());
		}
		
		return dto;
	}
	
	public List<User5DTO> selectUser5s() {
		
		List<User5DTO> users = new ArrayList<>();
		try {
			logger.info("User5DAO selectUser5s...1");
			
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			
			DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
			Connection conn = ds.getConnection();
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM `user5`");
			
			while (rs.next())
			{
				User5DTO dto = new User5DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setBirth(rs.getString(3));
				dto.setGender(rs.getString(4));
				dto.setAge(rs.getString(5));
				dto.setAddr(rs.getString(6));
				dto.setHp(rs.getString(7));
				
				users.add(dto);
			}
			
			rs.close();
			stmt.close();
			conn.close();
			logger.info("User5DAO selectUser5s...2");
			
		}catch(Exception e) {
			logger.error("※※※ User5DAO selectUser5 error : " + e.getMessage());
		}
		
		return users;
	}
	
	public void updateUser5(User5DTO dto) {
		try {
			logger.info("User5DAO updateUser5...1");
			
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			
			DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
			Connection conn = ds.getConnection();
			
			PreparedStatement psmt = conn.prepareStatement("UPDATE `user5` SET `name`=?, `birth`=?, `gender`=?, `age`=?, `address`=?, `hp`=? WHERE `uid`=?");
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getBirth());
			psmt.setInt(3, dto.getGender());
			psmt.setInt(4, dto.getAge());
			psmt.setString(5, dto.getAddr());
			psmt.setString(6, dto.getHp());
			psmt.setString(7, dto.getUid());
			
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			logger.info("User5DAO updateUser5...2");
			
		}catch(Exception e) {
			logger.error("※※※ User5DAO updateUser5 error : " + e.getMessage());
		}
	}
	
	public void deleteUser5(String uid) {
		try {
			logger.info("User5DAO deleteUser5...1");
			
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			
			DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
			Connection conn = ds.getConnection();
			
			PreparedStatement psmt = conn.prepareStatement("DELETE FROM `user5` WHERE `uid`=?");
			psmt.setString(1, uid);
			
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			logger.info("User5DAO deleteUser5...2");
			
		}catch(Exception e) {
			logger.error("※※※ User5DAO deleteUser5 error : " + e.getMessage());
		}
	}
}
