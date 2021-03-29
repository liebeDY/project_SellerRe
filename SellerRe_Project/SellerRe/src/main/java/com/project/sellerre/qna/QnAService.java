package com.project.sellerre.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnAService {

	@Autowired
	private QnAMapper mapper;
	
	public void addQnA(QnA q) {
		mapper.insertQnA(q);
	}
	
	public QnA getQnAByNum(int qna_num) {
		return mapper.selectQnAByNum(qna_num);
		
	}
	
	public List getQnAType(int qna_type) {
		return mapper.selectQnAType(qna_type);
	}
	
	public List getAllQnA() {
		return mapper.selectAllQnA();
	}
	
	public void editQnA(QnA q) {
		mapper.editQnA(q);
	}
	
	public void deleteQnA(int qna_num) {
		mapper.deleteQnA(qna_num);
	}
}
