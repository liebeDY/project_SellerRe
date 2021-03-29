package com.project.sellerre.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportMapper {

	void insertReport(Report r);
	
	Report selectReportByNum(int report_num);
	
	List selectAllReprotByNum();
	
	void editReport(Report r);
	
	void deleteReport(int report_num);
	
	void reportHits(int report_num);
	
	int reportSeqNum();
}
