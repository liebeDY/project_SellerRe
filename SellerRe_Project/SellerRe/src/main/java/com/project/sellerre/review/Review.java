package com.project.sellerre.review;

import java.sql.Date;

public class Review {
	private int review_num;
	private String writer_id;
	private String review_content;
	private Date review_date;
	private int product_num;

	public Review() {
		super();
	}

	public Review(int review_num, String writer_id, String review_content, int product_num, Date review_date) {
		super();
		this.review_num = review_num;
		this.writer_id = writer_id;
		this.review_content = review_content;
		this.product_num = product_num;
		this.review_date = review_date;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	@Override
	public String toString() {
		return "Review [review_num=" + review_num + ", writer_id=" + writer_id + ", review_content=" + review_content
				+ ", product_num=" + product_num + "]";
	}

}
