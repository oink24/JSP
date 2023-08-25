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
	public static final String SELECT_ARTICLE = "SELECT * FROM `Article` WHERE `no`=?";
	public static final String SELECT_ARTICLES = "SELECT a.*, b.`nickname` FROM `Article` AS a "
											+ "JOIN `User` AS b ON a.writer = b.uid "
											+ "WHERE `parent`=0 AND `category`=? "
											+ "ORDER BY `no` DESC "
											+ "LIMIT ?, 10";
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM `Article` WHERE `parent`=0 AND `category`=?";
	public static final String SELECT_LATESTS = "SELECT `no`, `title`, `rdate` FROM `Article` "
											+ "WHERE `parent`=0 AND `category`=? "
											+ "Order By `no` DESC LIMIT ?";
	public static final String UPDATE_ARTICLE = "UPDATE `Article` SET `title`=?, `content`=? WHERE `no`=? AND `category`=?";
	public static final String DELETE_ARTICLE = "DELETE FROM `Article` WHERE `no`=? OR `parent`=?";
	
	// comment
	public static final String INSERT_COMMENT = "INSERT INTO `Article` SET "
											+ "`parent`=?, "
											+ "`content`=?, "
											+ "`writer`=?, "
											+ "`regip`=?, "
											+ "`rdate`=NOW()";
	public static final String UPDATE_ARTICLE_FOR_COMMENT_PLUS = "UPDATE `Article` SET `comment` = `comment` + 1 WHERE `no`=?";
	public static final String SELECT_COMMENTS = "SELECT a.*, b.`nickname` FROM `Article` AS a "
											+ "JOIN `User` AS b ON a.writer = b.uid "
											+ "WHERE `parent`=?";
	public static final String UPDATE_COMMENT = "UPDATE `Article` SET `content`=? WHERE `no`=?";
	public static final String DELETE_COMMENT = "DELETE FROM `Article` WHERE `no`=?";
	public static final String UPDATE_ARTICLE_FOR_COMMENT_MINUS = "UPDATE `Article` SET `comment` = `comment` - 1 WHERE `no`=?";
	
	// product
	public final static String INSERT_PRODUCT = "INSERT INTO `Product` SET "
											+ "`type`=?,"
											+ "`pName`=?,"
											+ "`price`=?,"
											+ "`delivery`=?,"
											+ "`stock`=?,"
											+ "`thumb1`=?,"
											+ "`thumb2`=?,"
											+ "`thumb3`=?,"
											+ "`seller`=?,"
											+ "`etc`=?,"
											+ "`rdate`=NOW()";
	public final static String SELECT_PRODUCT = "SELECT * FROM `Product` WHERE `pNo`=?";
	public final static String SELECT_PRODUCTS_ALL = "SELECT * FROM `Product` WHERE `stock` > 0 LIMIT ?, 10";
	public final static String SELECT_PRODUCTS_TYPE = "SELECT * FROM `Product` WHERE `stock` > 0 AND `type`=? LIMIT ?, 10";
	public final static String SELECT_COUNT_PRODUCTS_ALL = "SELECT COUNT(*) FROM `Product` WHERE `stock` > 0";
	public final static String SELECT_COUNT_PRODUCTS_TYPE = "SELECT COUNT(*) FROM `Product` WHERE `stock` > 0 AND `type`=?";
	
	// order
	public static final String INSERT_ORDER = "INSERT INTO `Order` SET "
											+ "`orderProduct`=?,"
											+ "`orderCount`=?,"
											+ "`orderDelivery`=?,"
											+ "`orderPrice`=?,"
											+ "`orderTotal`=?,"
											+ "`receiver`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`orderEtc`=?,"
											+ "`orderUser`=?,"
											+ "`orderDate`=NOW()";
	public static final String SELECT_ORDERS = "SELECT "
											+ "a.*,"
											+ "b.`pName`,"
											+ "b.`thumb1` "
											+ "FROM `Order` AS a "
											+ "JOIN `Product` AS b "
											+ "ON a.orderProduct = b.pNo "
											+ "LIMIT ?, 10";
	public static final String SELECT_COUNT_ORDERS = "SELECT COUNT(*) FROM `Order`";
}