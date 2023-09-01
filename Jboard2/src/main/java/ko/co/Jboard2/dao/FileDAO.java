package ko.co.Jboard2.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ko.co.Jboard2.db.DBHelper;
import ko.co.Jboard2.db.SQL;
import ko.co.Jboard2.dto.FileDTO;

public class FileDAO extends DBHelper {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertFile(FileDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_FILE);
			psmt.setInt(1, dto.getAno());
			psmt.setString(2, dto.getOfile());
			psmt.setString(3, dto.getSfile());
			
			psmt.executeUpdate();
			close();
			
		}catch(Exception e) {
			logger.error("insertFile() error : " + e.getMessage());
		}
	}
	
	public FileDTO selecttFile(String fno) {
		
		FileDTO dto = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_FILE);
			psmt.setString(1, fno);
			
			rs = psmt.executeQuery();

			if (rs.next())
			{
				dto = new FileDTO();
				dto.setFno(rs.getInt(1));
				dto.setAno(rs.getInt(2));
				dto.setOfile(rs.getString(3));
				dto.setSfile(rs.getString(4));
				dto.setDownload(rs.getInt(5));
				dto.setRdate(rs.getString(6));
			}
			
			close();
			
		}catch (Exception e) {
			logger.error("selectFile() error : " + e.getMessage());
		}
		
		return dto;
	}
	
	public List<FileDTO> selectFiles() {
		return null;
	}
	
	public void updateFile(FileDTO dto) {
		
	}
	
	public void deleteFile(int fno) {
		
	}
}
