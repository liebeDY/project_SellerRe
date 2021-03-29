package com.project.sellerre.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

	@Autowired
	private CategoryMapper mapper;

	// 카테고리 추가(등록)
	public void insertCategory(Category c, int type) {
		switch (type) {
		case 1:
			mapper.insertCategory1(c);
			break;
		case 2:
			mapper.insertCategory2(c);
			break;
		case 3:
			mapper.insertCategory3(c);
			break;
		}
	}

	public Category selectCategory(int category_num, int type) {
		Category c = null;
		switch (type) {
		case 1:
			c = mapper.selectCategory1(category_num);
			break;
		case 2:
			c = mapper.selectCategory2(category_num);
			break;
		case 3:
			c = mapper.selectCategory3(category_num);
			break;
		}
		return c;
	}

	// 카테고리 전체선택
	public List selectAllCategory(int parent_category_num, int type) {
		List list = null;
		switch (type) {
		case 1:
			list = mapper.selectAllCategory1();
			break;
		case 2:
			list = mapper.selectAllCategory2(parent_category_num);
			break;
		case 3:
			list = mapper.selectAllCategory3(parent_category_num);
			break;
		}
		return list;
	}

	// 카테고리 수정
	public void updateCategory(Category c, int type) {
		switch (type) {
		case 1:
			mapper.updateCategory1(c);
			break;
		case 2:
			mapper.updateCategory2(c);
			break;
		case 3:
			mapper.updateCategory3(c);
			break;
		}
	}

	// 카테고리 삭제
	public void deleteCategory(int num, int type) {
		switch (type) {
		case 1:
			mapper.deleteCategory1(num);
			break;
		case 2:
			mapper.deleteCategory2(num);
			break;
		case 3:
			mapper.deleteCategory3(num);
			break;
		}
	}
	
	public int getNum(int type) {
		int category_num = 0;
		switch(type) {
		case 1:
			category_num = mapper.getNum1();
			break;
		case 2:
			category_num = mapper.getNum2();
			break;
		case 3:
			category_num = mapper.getNum3();
			break;
		}
		return category_num;
	}

}
