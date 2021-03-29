package com.project.sellerre.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ProductMapper {

	void insertProduct(Product p);
	
	Product selectProductByNum(int num);
	
	
	/** 카테고리 Num으로 Name 뽑기 */
	
	List selectProductByName(String name);
	
	List selectProductByPrice(Map map);
	
	List selectProductByUserId(String user_id);
	
	List selectProductByCategory1(int category1_num);
	
	List selectProductByCategory2(int category2_num);
	
	List selectProductByCategory3(int category3_num);
	
	List selectProductByPriceAndCategoryName(Map map);
	
	List selectProductByPriceAndName(Map map);
	
	List selectProductAll();
	
	void updateProduct(Product p);
	
	void deleteProduct(int num);
	
	List selectProductByCategoryName(String category_name);
	
	int getNum();
	
	int getTotalProductNum();
	
	int getTodayProductNum();
	
	int productHit(int product_num);
	
}
