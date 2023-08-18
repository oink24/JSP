package kr.co.farmstory.dao;

import java.util.List;

import kr.co.farmstory.db.DBHelper;
import kr.co.farmstory.db.SQL;
import kr.co.farmstory.dto.ArticleDTO;

public class ArticleDAO extends DBHelper {
	
	// 게시글 관련 CRUD
	public void insertArticle(ArticleDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, dto.getCategory());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getWriter());
			psmt.setString(5, dto.getRegip());
			
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArticleDTO selectArticle(String no) {
		return null;
	}
	
	public List<ArticleDTO> selectArticles(int start) {
		return null;
	}
	
	public void updateArticle(ArticleDTO dto) {
		
	}
	
	public void deleteArticle(String no) {
		
	}
	
	// 댓글 관련 CRUD
	public void insertComment(ArticleDTO dto) {
		
	}
	public void updateArticleForCommentPlus(String no) {}
	
	public List<ArticleDTO> selectComments(String parent) {
		return null;
	}
	
	public void updateComment(ArticleDTO dto) {
		
	}
	
	public void deleteComment(String no) {
		
	}
	public void updateArticleForCommentMinus(String no) {}
}