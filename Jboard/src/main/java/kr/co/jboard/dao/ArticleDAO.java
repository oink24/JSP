package kr.co.jboard.dao;

import java.util.List;

import kr.co.jboard.db.DBHelper;
import kr.co.jboard.db.SQL;
import kr.co.jboard.vo.ArticleVO;

public class ArticleDAO extends DBHelper {
	
	public void insertArticle(ArticleVO vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setString(3, vo.getWriter());
			psmt.setString(4, vo.getRegip());
			
			close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public ArticleVO selectArticle(int no) {
		return null;
	}
	public List<ArticleVO> selectArticles() {
		return null;
	}
	public void updateArticle(ArticleVO vo) {
		
	}
	public void deleteArticle(int no) {
		
	}
}