package com.project.sellerre.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportService {

	@Autowired
	private ReportMapper mapper;
	
	public void addReport(Report r) {
		mapper.insertReport(r);
	}
	
	public Report getReportByNum(int report_num) {
		return mapper.selectReportByNum(report_num);
	}
	
	public List getAllReprotByNum() {
		return mapper.selectAllReprotByNum();
	}
	
	public void editReport(Report r) {
		mapper.editReport(r);
	}
	
	public void deleteReport(int report_num) {
		mapper.deleteReport(report_num);
	}
	
	public void addReportHits(int report_num) {
		mapper.reportHits(report_num);
	}
	
	public int reportSeqNum() {
		return mapper.reportSeqNum();
	}
}
