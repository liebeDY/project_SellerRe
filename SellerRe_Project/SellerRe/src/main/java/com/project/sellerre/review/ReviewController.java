package com.project.sellerre.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService review_Service;
	
	
	// 리뷰 작성
	@RequestMapping(value = "/review/insertReview")
	public String insertReview(RedirectAttributes redirect, Review r) {
		System.out.println("리뷰 컨트롤러 ============== " + r.toString());
		review_Service.insertReview(r);
		
		redirect.addAttribute("product_num", r.getProduct_num());
		redirect.addAttribute("user_id", r.getWriter_id());
		
		return "redirect:/product/productDetail";
	}
	
	// 리뷰 수정
	@RequestMapping(value = "/review/updateReview")
	public String updateReview(RedirectAttributes redirect ,Review r) {
		
		
		review_Service.updateReview(r);
		
		redirect.addAttribute("product_num", r.getProduct_num());
		redirect.addAttribute("user_id", r.getWriter_id());
		
		return "redirect:/product/productDetail";
	}
	
	// 리뷰 삭제
	@RequestMapping(value = "/review/deleteReview")
	public String deleteReview(RedirectAttributes redirect, Review r) {
	
		review_Service.deleteReview(r.getReview_num());
		
		redirect.addAttribute("product_num", r.getProduct_num());
		redirect.addAttribute("user_id", r.getWriter_id());
		
		return "redirect:/product/productDetail";
		
	}
	
//	 리뷰 출력
//	@RequestMapping(value = "/reivew/")
}
