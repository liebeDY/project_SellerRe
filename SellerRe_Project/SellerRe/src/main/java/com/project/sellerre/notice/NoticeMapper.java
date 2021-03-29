package com.project.sellerre.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {

	void insertNotice(Notice n);			//공지사항 추가

	List selectAllNotice();					//공지사항 리스트 출력
	
	Notice selectNotice(int notice_num);	//notice_num으로 공지사항 출력
	
	void updateNotice(Notice n);			//공지사항 수정
	
	void noticeHits(int notice_num);		//조회수 증가
	
	void deleteNotice(int notice_num);		//공지사항 삭제
	
}
