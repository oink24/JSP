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
	
	public ArticleDTO selectArticle(int no) {
		return null;
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
	
	public void updateArticle(ArticleDTO vo) {
		
	}
	
	public void deleteArticle(int no) {
		
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
}