package kr.co.jboard.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.jboard.db.DBHelper;
import kr.co.jboard.db.SQL;
import kr.co.jboard.dto.ArticleDTO;

public class ArticleDAO extends DBHelper {
	
	public void insertArticle(ArticleDTO vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setString(3, vo.getWriter());
			psmt.setString(4, vo.getRegip());
			
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e){
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
	
	public List<ArticleDTO> selectArticles(int start) {
		
		List<ArticleDTO> articles = new ArrayList<>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLES);
			psmt.setInt(1, start);
			
			rs = psmt.executeQuery();
			
			while(rs.next())
			{
				ArticleDTO vo = new ArticleDTO();
				vo.setNo(rs.getInt(1));
				vo.setParent(rs.getInt(2));
				vo.setComment(rs.getInt(3));
				vo.setCategory(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setFile(rs.getInt(7));
				vo.setHit(rs.getInt(8));
				vo.setWriter(rs.getString(9));
				vo.setRegip(rs.getString(10));
				vo.setRdate(rs.getString(11));
				vo.setNickname(rs.getString(12));
				
				articles.add(vo);
			}
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return articles;
	}
	
	public void updateArticle(ArticleDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getNo());
			
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteArticle(String no) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_ARTICLE);
			psmt.setString(1, no);
			psmt.setString(2, no);
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 전체 게시글 갯수 조회
	public int selectCountTotal() {
		int total = 0;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_TOTAL);
			rs = psmt.executeQuery();
			
			if (rs.next())
				total = rs.getInt(1);
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	// 댓글 작성
	public void insertComment(ArticleDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
			psmt.setInt(1, dto.getParent());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getWriter());
			psmt.setString(4, dto.getRegip());
			
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void updateArticleForCommentPlus(String no) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE_FOR_COMMENT_PLUS);
			psmt.setString(1, no);
			
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 댓글 조회
	public List<ArticleDTO> selectComments(String parent) {
		List<ArticleDTO> comments = new ArrayList<>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COMMENTS);
			psmt.setString(1, parent);
			
			rs = psmt.executeQuery();
			
			while (rs.next())
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
				
				comments.add(dto);
			}
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return comments;
	}
	
	// 댓글 수정
	public void updateComment(ArticleDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_COMMENT);
			psmt.setString(1, dto.getContent());
			psmt.setInt(2, dto.getNo());
			
			psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 댓글 삭제
	public void deleteComment(String no) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_COMMENT);
			psmt.setString(1, no);
			
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void updateArticleForCommentMinus(String no) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE_FOR_COMMENT_MINUS);
			psmt.setString(1, no);
			
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}