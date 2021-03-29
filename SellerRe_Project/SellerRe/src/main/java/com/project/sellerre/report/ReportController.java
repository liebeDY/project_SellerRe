package com.project.sellerre.report;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.sellerre.user.UserService;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	@Autowired
	private UserService user_Service;

	
	// ==================== ▼ Page Control ▼ ====================
	
	//	신고게시판 글 작성폼
	@GetMapping(value = "/report/report_Writing")
	public void reportWiringForm() {
		
	}
	
	//	신고게시판 리스트 폼
//	@RequestMapping(value = "/report/report_List")
//	public void reportListForm() {
//		
//	}
	
	// ==================== ▲ Page Control ▲ ====================
	
	
	
	
	// ==================== ▼ Image Control ▼ ====================

	// 이미지 경로 설정
	public static String basePath = "C:\\SellerReImg\\ReportImg\\";

	// 이미지 처리 기능
	public void saveImg(int report_num, MultipartFile file) {

		String fileName = file.getOriginalFilename();
		File f = null;

		if (fileName != null && !fileName.equals("")) {

			File dir = new File(basePath + report_num);
			dir.mkdir();
			f = new File(basePath + report_num + "\\" + fileName);

			try {
				file.transferTo(f);
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// 등록된 이미지 가져오기
	@RequestMapping("reportImg")
	public ResponseEntity<byte[]> getReportImg(String fname, int report_num) {

		String path = basePath + report_num + "\\" + fname;
		File f = new File(path);
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;

		try {
			header.add("Content-type", Files.probeContentType(f.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	// ==================== ▲ Image Control ▲ ====================

	// 게시글 등록
	@RequestMapping(value = "/report/Writing")
	public String addReport(Report r) {
		
		int seqNum = reportService.reportSeqNum();
		r.setReport_num(seqNum);
		reportService.addReport(r);

		saveImg(seqNum, r.getReport_img1());
		saveImg(seqNum, r.getReport_img2());
		saveImg(seqNum, r.getReport_img3());

		// 작성이 완료되면 신고 게시판 리스트로 돌아간다.
		return "redirect:/report/mav_report_List";
	}

	// DB에 저장된 데이터를 리스트에 출력
	@RequestMapping(value = "/report/mav_report_List")
	public ModelAndView reportList() {

		ModelAndView mav = new ModelAndView("/report/report_List");
		ArrayList<Report> reportList = (ArrayList<Report>) reportService.getAllReprotByNum();
		mav.addObject("reportList", reportList);

		return mav;
	}

	// 작성된 게시글로 이동
	@RequestMapping(value = "/report/mav_Report_Content")
	public ModelAndView content(@RequestParam(value = "report_num") int report_num) {

		ModelAndView mav = new ModelAndView("/report/report_ContentView");
		Report r = reportService.getReportByNum(report_num);

		// 게시글에 등록된 이미지 가져오기
		String path = basePath + r.getReport_num() + "\\";
		File imgDir = new File(path);
		
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				mav.addObject("reportImg" + j, files[j]);
			}
			mav.addObject("files", files);
		}

		mav.addObject("r", r);
		
		// 게시글을 클릭시 조회수 +1
		reportService.addReportHits(report_num);

		return mav;
	}

	// 작성된 데이터를 가지고 게시글 수정 폼으로 이동
	@RequestMapping(value = "/report/mav_Report_Edit")
	public ModelAndView reportEdit(@RequestParam(value = "report_num") int report_num) {

		ModelAndView mav = new ModelAndView("/report/report_Edit");

		Report r = reportService.getReportByNum(report_num);
		
		mav.addObject("r", r);

		return mav;
	}

	// 수정 버튼 클릭 시 실행되는 메소드
	@RequestMapping(value = "/report/report_Edit")
	public String reportContentEdit(Report r, @RequestParam(value = "report_num") int report_num, RedirectAttributes redirect) {
		
		// 게시글에 등록된 이미지 삭제
		String path = basePath + report_num + "\\";
		File imgDir = new File(path);
		if (imgDir.exists()) {
			String[] files = imgDir.list();

			for (int j = 0; j < files.length; j++) {
				File f = new File(path + files[j]);
				f.delete();
			}
		}
		saveImg(report_num, r.getReport_img1());
		saveImg(report_num, r.getReport_img2());
		saveImg(report_num, r.getReport_img3());
		
		
		reportService.editReport(r);
		
		redirect.addAttribute("report_num", report_num);
		
		// 수정이 완료되면 Content Form으로 돌아간다.
		return "redirect:/report/mav_Report_Content";
	}
	
	

	// 게시글 삭제 기능
	@RequestMapping(value = "/report/report_del")
	public String reportDelete(@RequestParam(value = "report_num") int report_num) {

		// 게시글 삭제
		reportService.deleteReport(report_num);

		// 게시글에 등록된 이미지 삭제
		String path = basePath + report_num + "\\";
		File imgDir = new File(path);
		if (imgDir.exists()) {
			String[] files = imgDir.list();

			for (int j = 0; j < files.length; j++) {
				File f = new File(path + files[j]);
				f.delete();
			}
		}

		imgDir.delete();

		// 삭제가 완료되면 신고 게시판 리스트로 이동
		return "redirect:/report/mav_report_List";
	}
	
	//닉네임 중복 검사
	@RequestMapping(value = "/report/Check")
	@ResponseBody
	public String checkName(@RequestParam(value = "user_nickname") String user_nickname) {

		int name_result = user_Service.nicknameCheck(user_nickname);

		if (name_result != 0) {
			return "fail"; 
		} else {
			return "success";
		}
	}

}
