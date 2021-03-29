package com.project.sellerre.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QnAMapper {

	// QnA 등록
	void insertQnA(QnA q);
	
	// QnA 시퀀스 번호로 선택
	QnA selectQnAByNum(int qna_num);
	
	// QnA 타입으로 선택
	List selectQnAType(int qna_type);
	
	// QnA 전체 선택
	List selectAllQnA();
	
	// QnA 수정
	void editQnA(QnA q);
	
	// QnA 삭제
	void deleteQnA(int qna_num);
	
}
