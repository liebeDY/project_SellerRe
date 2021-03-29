package com.project.sellerre.wish;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.sellerre.admin.AdminService;
import com.project.sellerre.admin.Category;
import com.project.sellerre.product.Product;
import com.project.sellerre.product.ProductService;
import com.project.sellerre.review.ReviewService;

@Controller
public class WishController {

   public static String basePath = "C:\\SellerReImg\\";

   @Autowired
   private WishService wish_service;

   @Autowired
   private ProductService product_service;

   @Autowired
   private AdminService admin_Service;
   
   @Autowired
   private ReviewService review_service;
   
   // 찜하기
   @RequestMapping(value = "/wish/wishInsert")
   public ModelAndView wishInsert(@RequestParam(value = "user_id") String user_id,
         @RequestParam(value = "product_num") int product_num) {
      System.out.println("wishInsert : " + user_id + " " + product_num);
      ModelAndView mav = new ModelAndView("/wish/wishJSON");
      Wish w = new Wish();

      int resultType = 0;

      w.setWish_num(wish_service.getNum());
      w.setUser_id(user_id);
      w.setProduct_num(product_num);

      System.out.println("wishInsert w: " + w);
      wish_service.insertWish(w);

      try {
         if (w != null) {
            resultType = 1;
            mav.addObject("resultType", resultType);
         } 
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      return mav;
   }
   
   // 찜리스트에 상품 삭제
   @RequestMapping("/wish/wishDel")
   public ModelAndView wishDel(@RequestParam(value = "user_id") String user_id, @RequestParam(value = "product_num") int product_num){
      ModelAndView mav = new ModelAndView("/wish/wishJSON");
      wish_service.delwish(user_id,product_num);
      
      int resultType = 0;
      mav.addObject("resultType", resultType);
      
      return mav;
   }
   
   
   
   // 위시리스트에 출력
   @RequestMapping(value = "/wish/wishList")
   public ModelAndView wish(@RequestParam(value = "user_id") String user_id) {
      ModelAndView mav = new ModelAndView("wish/wishList");
      System.out.println("wishList 컨트롤러 : " + user_id);

      // 세션 아이디를 가져와서 프로덕트 넘버를 호출하고 호출한 프로덕트 넘버로 P서비스에서 불러온다
      ArrayList<Product> wishList = (ArrayList<Product>) wish_service.selectByUserId(user_id);
      Product p = null;
      
      // 찜회수 리스트 가져오기
      ArrayList<Integer> wishCountList	= new ArrayList<Integer>();
      int wishCount = 0;
    		  
      /* 카테고리 가져오기 */
      ArrayList<Category> c1 = new ArrayList<Category>(); 
      ArrayList<Category> c2 = new ArrayList<Category>(); 
      ArrayList<Category> c3 = new ArrayList<Category>();
  
      // 사진 가져오기
      ArrayList<String> fileList = new ArrayList<String>();
      String path = "";
      
      // 댓글 숫자 가져오기
      ArrayList<Integer> reviewCountList = new ArrayList<Integer>();
      int reviewCount = 0;
      
      try {
    	  
    	  for (int i = 0; i < wishList.size(); i++) {
    		  p = wishList.get(i);
    		  System.out.println("위시출력 컨트롤 / p / get(i) : " + p);
    		  
    		  // 찜회수 가져오기
    		  wishCount = wish_service.countUserIdByProductNum(p.getProduct_num());
    		  wishCountList.add(wishCount);
    		  System.out.println("위시출력 컨트롤 / wishCount : " + wishCount);
    		  
    		  // 댓글 가져오기
    		  reviewCount = review_service.countReviewUserIdByProductNum(p.getProduct_num());
    		  reviewCountList.add(reviewCount);
    		  System.out.println("위시출력 컨트롤 / reviewCount : " + reviewCount);
    		  
    		  // 사진 가져오기
    		  path = basePath + p.getProduct_num() + "\\";
    		  File imgDir = new File(path);
    		  mav.addObject("path" + i, path);
    		  
    		  if (imgDir.exists()) {
    			  String[] files = imgDir.list();
    			  fileList.add(files[0]);
    		  }
    		  
    		  // 카테고리 가져오기
    		  Category category1 = admin_Service.selectCategory(p.getCategory1_num(), 1);
    		  c1.add(category1);
    		  
    		  Category category2 = admin_Service.selectCategory(p.getCategory2_num(), 2);
    		  c2.add(category2);
    		  
    		  Category category3 = admin_Service.selectCategory(p.getCategory3_num(), 3);
    		  c3.add(category3);
    	  }
      } catch (Exception e) {
    	  e.printStackTrace();
    	  
      }
      
      
      // 사진, 위시상품, 카테고리1/2/3, wishCount
      System.out.println("wishList 컨트롤러, wishList : " + wishList);
      System.out.println("wishList 컨트롤러, reviewCountList : " + reviewCountList);
      System.out.println("wishList 컨트롤러, wishCountList : " + wishCountList);
      mav.addObject("wishList", wishList);
      mav.addObject("c1", c1);
	  mav.addObject("c2", c2);
	  mav.addObject("c3", c3);
	  mav.addObject("fileList", fileList);
	  mav.addObject("wishCountList", wishCountList);
	  mav.addObject("reviewCountList", reviewCountList);
	  
	  return mav;
   }

   

   // 찜리스트 전체 삭제
   @RequestMapping("/wish/wishDelAll")
   public String delAll(@RequestParam(value = "user_id") String user_id) {

      wish_service.delwishAll(user_id);

      return "redirect:/order/wish";
   }
}