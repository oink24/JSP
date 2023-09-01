package ko.co.Jboard2.service;

import java.util.List;

import ko.co.Jboard2.dao.FileDAO;
import ko.co.Jboard2.dto.FileDTO;

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
