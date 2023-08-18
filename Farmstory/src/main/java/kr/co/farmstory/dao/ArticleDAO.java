package kr.co.farmstory.dao;

import java.util.ArrayList;
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
		ArticleDTO dto = new ArticleDTO();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
			psmt.setString(1, no);
			
			rs = psmt.executeQuery();
			
			if (rs.next())
			{
				dto.setNo(rs.getInt("no"));
				dto.setParent(rs.getInt("parent"));
				dto.setComment(rs.getInt("comment"));
				dto.setCategory(rs.getString("category"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setFile(rs.getInt("file"));
				dto.setHit(rs.getInt("hit"));
				dto.setWriter(rs.getString("writer"));
				dto.setRegip(rs.getString("regip"));
				dto.setRdate(rs.getString("rdate"));
			}
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public List<ArticleDTO> selectArticles(String cate, int start) {
		
		List<ArticleDTO> articles = new ArrayList<ArticleDTO>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLES);
			psmt.setString(1, cate);
			psmt.setInt(2, start);
			
			rs = psmt.executeQuery();
			
			while(rs.next())
			{
				ArticleDTO dto = new ArticleDTO();
				dto.setNo(rs.getInt(1));
				dto.setParent(rs.getInt(2));
				dto.setComment(rs.getInt(3));
				dto.setCategory(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setFile(rs.getInt(7));
				dto.setHit(rs.getInt(8));
				dto.setWriter(rs.getString(9));
				dto.setRegip(rs.getString(10));
				dto.setRdate(rs.getString(11));
				dto.setNickname(rs.getString(12));
				
				articles.add(dto);
			}
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return articles;
	}
	public int selectCountTotal(String cate) { // 전체 게시글 갯수 조회
		int total = 0;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_TOTAL);
			psmt.setString(1, cate);
			
			rs = psmt.executeQuery();
			
			if (rs.next())
				total = rs.getInt(1);
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	public void updateArticle(ArticleDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getNo());
			psmt.setString(4, dto.getCategory());
			
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteArticle(String no, String cate) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_ARTICLE);
			psmt.setString(1, no);
			psmt.setString(2, no);
			psmt.setString(3, cate);
			
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
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