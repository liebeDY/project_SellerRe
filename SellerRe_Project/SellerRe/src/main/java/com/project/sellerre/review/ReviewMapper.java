package com.project.sellerre.review;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {

	void insertReview(Review r);
	
	List selectAllReview();
	
	List selectReviewByProductNum(int product_num);
	
	void updateReview(Review r);
	
	void deleteReview(int review_num);
	
	int countReviewUserIdByProductNum(int product_num);
	
}
