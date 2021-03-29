package com.project.sellerre.notice;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	// 공지사항 작성 폼으로 이동
	@GetMapping(value = "/notice/notice_writing")
	public void noticeForm() {

	}

	// 공지사항 작성
	@RequestMapping(value = "/notice/notice_writing")
	public String insert(Notice n) {
		
		noticeService.addNotice(n);
		
		return "redirect:/notice/notice_board";
	}
	
	// 컨텐츠로 이동
	@RequestMapping(value = "/notice/notice_contentView")
	public ModelAndView content(@RequestParam(value = "notice_num") int notice_num) {
		ModelAndView mav = new ModelAndView("/notice/notice_contentView");
		Notice n = noticeService.selectNoticeByNum(notice_num);
		mav.addObject("n", n);
		noticeService.noticeHits(notice_num);
			
		return mav;
	}
	
	// 공지사항 전체 출력
	@RequestMapping(value = "/notice/notice_board")
	public ModelAndView list() {

		ModelAndView mav = new ModelAndView("/notice/notice_board");
		ArrayList<Notice> list = (ArrayList<Notice>) noticeService.selectAllNotice();
		mav.addObject("list", list);

		return mav;
	}

	// 공지사항 수정
	@RequestMapping(value = "/notice/notice_edit")
	public String edit(Notice n) {

		noticeService.editNotice(n);

		return "redirect:/notice/notice_board";
	}

	// 공지사항 삭제
	@RequestMapping(value = "/notice/notice_delete")
	public String delete(@RequestParam(value = "notice_num") int notice_num) {

		noticeService.delete(notice_num);

		return "redirect:/notice/notice_board";
	}
}
