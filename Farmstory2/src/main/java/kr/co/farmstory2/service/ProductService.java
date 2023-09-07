package kr.co.farmstory2.service;

import java.util.List;

import kr.co.farmstory2.dao.ProductDAO;
import kr.co.farmstory2.dto.ProductDTO;

public enum ProductService {

	INSTANCE;
	private ProductDAO dao = new ProductDAO();
	
	public void insertProduct(ProductDTO dto) {
		dao.insertProduct(dto);
	}
	public ProductDTO selectProduct(String pNo) {
		return dao.selectProduct(pNo);
	}
	public List<ProductDTO> selectProducts(int start) { // 관리자페이지 상품목록
		return dao.selectProducts(start);
	}
	public List<ProductDTO> selectProducts(String type, int start) { // 장보기페이지 상품목록(list)
		return dao.selectProducts(type, start);
	}
	public int selectCountProductsTotal() { // 관리자페이지 상품목록 전체 갯수 조회
		return dao.selectCountProductsTotal();
	}
	public int selectCountProductsTotal(String type) { // 장보기페이지 상품목록 전체 갯수 조회
		return dao.selectCountProductsTotal(type);
	}
	public void updateProduct(ProductDTO dto) {
		dao.updateProduct(dto);
	}
	public void deleteProduct(int pNo) {
		dao.deleteProduct(pNo);
	}
}
