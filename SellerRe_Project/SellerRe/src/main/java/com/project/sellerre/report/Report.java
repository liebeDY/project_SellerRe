package com.project.sellerre.report;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Report {

	private int report_num;
	private String report_reason;
	private String report_title;
	private String report_content;
	private Date report_date;
	private int report_hits;
	private String report_writer_id;
	private MultipartFile report_img1;
	private MultipartFile report_img2;
	private MultipartFile report_img3;

	public Report() {
		super();
	}

	public Report(int report_num, String report_reason, String report_title, String report_content, Date report_date,
			int report_hits, String report_writer_id) {
		super();
		this.report_num = report_num;
		this.report_reason = report_reason;
		this.report_title = report_title;
		this.report_content = report_content;
		this.report_date = report_date;
		this.report_hits = report_hits;
		this.report_writer_id = report_writer_id;
	}

	public Report(int report_num, String report_reason, String report_title, String report_content, Date report_date,
			int report_hits, String report_writer_id, MultipartFile report_img1, MultipartFile report_img2,
			MultipartFile report_img3) {
		super();
		this.report_num = report_num;
		this.report_reason = report_reason;
		this.report_title = report_title;
		this.report_content = report_content;
		this.report_date = report_date;
		this.report_hits = report_hits;
		this.report_writer_id = report_writer_id;
		this.report_img1 = report_img1;
		this.report_img2 = report_img2;
		this.report_img3 = report_img3;
	}

	public int getReport_num() {
		return report_num;
	}

	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}

	public String getReport_reason() {
		return report_reason;
	}

	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}

	public String getReport_title() {
		return report_title;
	}

	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public int getReport_hits() {
		return report_hits;
	}

	public void setReport_hits(int report_hits) {
		this.report_hits = report_hits;
	}

	public String getReport_writer_id() {
		return report_writer_id;
	}

	public void setReport_writer_id(String report_writer_id) {
		this.report_writer_id = report_writer_id;
	}

	public MultipartFile getReport_img1() {
		return report_img1;
	}

	public void setReport_img1(MultipartFile report_img1) {
		this.report_img1 = report_img1;
	}

	public MultipartFile getReport_img2() {
		return report_img2;
	}

	public void setReport_img2(MultipartFile report_img2) {
		this.report_img2 = report_img2;
	}

	public MultipartFile getReport_img3() {
		return report_img3;
	}

	public void setReport_img3(MultipartFile report_img3) {
		this.report_img3 = report_img3;
	}

	@Override
	public String toString() {
		return "Report [report_num=" + report_num + ", report_reason=" + report_reason + ", report_title="
				+ report_title + ", report_content=" + report_content + ", report_date=" + report_date
				+ ", report_hits=" + report_hits + ", report_writer_id=" + report_writer_id + ", report_img1="
				+ report_img1 + ", report_img2=" + report_img2 + ", report_img3=" + report_img3 + "]";
	}

}
