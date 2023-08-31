package ko.co.Jboard2.dao;

import java.util.List;

import ko.co.Jboard2.db.DBHelper;
import ko.co.Jboard2.db.SQL;
import ko.co.Jboard2.dto.ArticleDTO;

public class ArticleDAO extends DBHelper {

	public int insertArticle(ArticleDTO dto) {
		
		int no = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false); // Transaction 시작
			
			stmt = conn.createStatement();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getFile());
			psmt.setString(4, dto.getWriter());
			psmt.setString(5, dto.getRegip());
			
			psmt.executeUpdate();
			rs = stmt.executeQuery(SQL.SELECT_MAX_NO);
			conn.commit(); // 작업확정
			
			if (rs.next())
				no = rs.getInt(1);
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return no;
	}
	
	public ArticleDTO selectArticle(int no) {
		return null;
	}
	
	public List<ArticleDTO> selectArticles() {
		return null;
	}
	
	public void updateArticle(ArticleDTO dto) {
		
	}
	
	public void deleteArticle(int no) {
		
	}
}
