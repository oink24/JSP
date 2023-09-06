package kr.co.farmstory2.service;

import java.util.List;

import kr.co.farmstory2.dao.FileDAO;
import kr.co.farmstory2.dto.FileDTO;

public enum FileService {

	INSTANCE;
	private FileDAO dao = new FileDAO();
	
	public void insertFile(FileDTO dto) {
		dao.insertFile(dto);
	}
	public FileDTO selecttFile(String fno) {
		return dao.selecttFile(fno);
	}
	public List<FileDTO> selectFiles() {
		return dao.selectFiles();
	}
	public void updateFile(FileDTO dto) {
		dao.updateFile(dto);
	}
	public int deleteFile(String ano) {
		return dao.deleteFile(ano);
	}
}
