package ko.co.Jboard2.service;

import ko.co.Jboard2.dao.TermsDAO;
import ko.co.Jboard2.dto.TermsDTO;

public class TermsService {

	TermsDAO dao = new TermsDAO();
	
	public TermsDTO selectTerms() {
		return dao.selectTerms();
	}
}
