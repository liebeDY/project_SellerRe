package com.project.sellerre.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ProductService {

	@Autowired
	private ProductMapper mapper;
	


	public void insertProduct(Product p) {
		mapper.insertProduct(p);
	}
	
	public Product selectProductByNum(int num) {
		return mapper.selectProductByNum(num);
	}
	
	
	/** 카테고리 Num으로 Name 뽑기 */
	
	public List selectProductByName(String name) {
		return mapper.selectProductByName(name);
	}
	
	public List selectProductByPrice(int min, int max) {
		
		Map map = new HashMap();
		map.put("min", min);
		map.put("max", max);
		
		return mapper.selectProductByPrice(map);
	}
	
public List selectProductByPriceAndName(String name, int min, int max) {
		
		Map map = new HashMap();
		map.put("name", name);
		map.put("min", min);
		map.put("max", max);
		
		return mapper.selectProductByPriceAndName(map);
	}
	
	public List selectProductByPriceAndCategoryName(String category_name, int min, int max) {
		
		Map map = new HashMap();
		map.put("category_name", category_name);
		map.put("min", min);
		map.put("max", max);
		
		return mapper.selectProductByPriceAndCategoryName(map);
	}
	
	public List selectProductByUserId(String user_id) {
		return mapper.selectProductByUserId(user_id);
	}
	
	public List selectProductByCategory1(int category1_num) {
		return mapper.selectProductByCategory1(category1_num);
	}
	
	public List selectProductByCategory2(int category2_num) {
		return mapper.selectProductByCategory2(category2_num);
	}
	
	public List selectProductByCategory3(int category3_num) {
		return mapper.selectProductByCategory3(category3_num);
	}
	
	public List selectProductAll() {
		return mapper.selectProductAll();
	}
	
	public List selectProductByCategoryName(String category_name) {
		return mapper.selectProductByCategoryName(category_name);
	}
	
	public void updateProduct(Product p) {
		mapper.updateProduct(p);
	}
	
	public void deleteProduct(int num) {
		mapper.deleteProduct(num);
	}
	
	public int getNum() {
		return mapper.getNum();
	}
	
	public int getTotalProductNum() {
	     return mapper.getTotalProductNum();
	}
	
	public int getTodayProductNum() {
	     return mapper.getTodayProductNum();
	}
	
	public int productHit(int product_num) {
		return mapper.productHit(product_num);
	}
}
