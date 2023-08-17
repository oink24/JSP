package kr.co.farmstory.db;

public class SQL {
	
	// user
	public static final String SELECT_TERMS = "SELECT * FROM `Terms`";
	public static final String INSERT_USER = "INSERT INTO `User` SET "
											+ "`uid`=?, "
											+ "`pass`=SHA2(?, 256), "
											+ "`name`=?, "
											+ "`nickname`=?, "
											+ "`email`=?, "
											+ "`hp`=?, "
											+ "`zip`=?, "
											+ "`addr1`=?, "
											+ "`addr2`=?, "
											+ "`regip`=?, "
											+ "`regDate`=NOW()";
	public static final String SELECT_USER = "SELECT * FROM `User` WHERE `uid`=? AND `pass`=SHA2(?, 256)";
	
	public static final String SELECT_COUNT_UID = "SELECT COUNT(*) FROM `User` WHERE `uid`=?";
	public static final String SELECT_COUNT_NICKNAME = "SELECT COUNT(*) FROM `User` WHERE `nickname`=?";
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(*) FROM `User` WHERE `email`=?";
	public static final String SELECT_COUNT_HP = "SELECT COUNT(*) FROM `User` WHERE `hp`=?";
	
	// Article
	public static final String INSERT_ARTICLE = "INSERT INTO `Article` SET "
											+ "`category`=?, "
											+ "`title`=?, "
											+ "`content`=?, "
											+ "`writer`=?, "
											+ "`regip`=?, "
											+ "`rdate`=NOW()";
}