package kr.co.jboard.db;

public class SQL {
	
	// user
	public static final String INSERT_USER = "INSERT INTO `user` (`uid`, `pass`, `name`, `nickname`, `email`, `hp`, `zip`, `addr1`, `addr2`, `regip`, `regDate`)"
														+ " VALUES (?,SHA2(?, 256),?,?,?,?,?,?,?,?,NOW())";
	public static final String SELECT_USER = "SELECT * FROM `user` WHERE `uid`=? AND `PASS`=SHA2(?, 256)";
	
	public static final String SELECT_COUNT_UID = "SELECT COUNT(*) FROM `User` WHERE `uid`=?";
	public static final String SELECT_COUNT_NICKNAME = "SELECT COUNT(*) FROM `User` WHERE `nickname`=?";
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(*) FROM `User` WHERE `email`=?";
	public static final String SELECT_COUNT_HP = "SELECT COUNT(*) FROM `User` WHERE `hp`=?";
}
