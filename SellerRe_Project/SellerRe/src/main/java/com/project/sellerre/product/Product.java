package com.project.sellerre.product;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Product {

	private int product_num;
	private String product_name;
	private int product_price;
	private String product_info;
	private int category1_num;
	private int category2_num;
	private int category3_num;
	private String user_id;
	private MultipartFile product_img1;
	private MultipartFile product_img2;
	private MultipartFile product_img3;
	private Date reg_date;
	private int product_hit;
	private int result;

	public Product() {
	}

	public Product(int product_num, String product_name, int product_price, String product_info, int category1_num,
			int category2_num, int category3_num, String user_id, MultipartFile product_img1,
			MultipartFile product_img2, MultipartFile product_img3, Date reg_date, int product_hit,
			int result) {
		super();
		this.product_num = product_num;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_info = product_info;
		this.category1_num = category1_num;
		this.category2_num = category2_num;
		this.category3_num = category3_num;
		this.user_id = user_id;
		this.product_img1 = product_img1;
		this.product_img2 = product_img2;
		this.product_img3 = product_img3;
		this.reg_date = reg_date;
		this.product_hit = product_hit;
		this.result = result;
	}

	public Product(int product_num, String product_name, int product_price, String product_info, int category1_num,
			int category2_num, int category3_num, String user_id, Date reg_date, int product_hit,
			int result) {
		super();
		this.product_num = product_num;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_info = product_info;
		this.category1_num = category1_num;
		this.category2_num = category2_num;
		this.category3_num = category3_num;
		this.user_id = user_id;
		this.reg_date = reg_date;
		this.product_hit = product_hit;
		this.result = result;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_info() {
		return product_info;
	}

	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}

	public int getCategory1_num() {
		return category1_num;
	}

	public void setCategory1_num(int category1_num) {
		this.category1_num = category1_num;
	}

	public int getCategory2_num() {
		return category2_num;
	}

	public void setCategory2_num(int category2_num) {
		this.category2_num = category2_num;
	}

	public int getCategory3_num() {
		return category3_num;
	}

	public void setCategory3_num(int category3_num) {
		this.category3_num = category3_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public MultipartFile getProduct_img1() {
		return product_img1;
	}

	public void setProduct_img1(MultipartFile product_img1) {
		this.product_img1 = product_img1;
	}

	public MultipartFile getProduct_img2() {
		return product_img2;
	}

	public void setProduct_img2(MultipartFile product_img2) {
		this.product_img2 = product_img2;
	}

	public MultipartFile getProduct_img3() {
		return product_img3;
	}

	public void setProduct_img3(MultipartFile product_img3) {
		this.product_img3 = product_img3;
	}



	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getProduct_hit() {
		return product_hit;
	}

	public void setProduct_hit(int product_hit) {
		this.product_hit = product_hit;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "Product [product_num=" + product_num + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_info=" + product_info + ", category1_num=" + category1_num
				+ ", category2_num=" + category2_num + ", category3_num=" + category3_num + ", user_id=" + user_id
				+ ", product_img1=" + product_img1 + ", product_img2=" + product_img2 + ", product_img3=" + product_img3
				+ ", reg_date=" + reg_date + ", product_hit=" + product_hit + ", result=" + result + "]";
	}


}
