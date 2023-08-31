package ko.co.Jboard2.dao;

import java.util.List;

import ko.co.Jboard2.db.DBHelper;
import ko.co.Jboard2.db.SQL;
import ko.co.Jboard2.dto.ArticleDTO;

public class ArticleDAO extends DBHelper {

	public void insertArticle(ArticleDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getWriter());
			psmt.setString(4, dto.getRegip());
			
			psmt.executeUpdate();
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
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
