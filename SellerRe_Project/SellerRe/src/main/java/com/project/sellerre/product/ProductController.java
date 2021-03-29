package com.project.sellerre.product;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.sellerre.admin.AdminService;
import com.project.sellerre.admin.Category;
import com.project.sellerre.review.Review;
import com.project.sellerre.review.ReviewService;
import com.project.sellerre.user.User;
import com.project.sellerre.user.UserService;
import com.project.sellerre.wish.Wish;
import com.project.sellerre.wish.WishService;


@Controller
public class ProductController {

	@Autowired
	private ProductService product_Service;
	
	@Autowired
	private AdminService admin_Service;
	
	@Autowired
	private UserService user_Service;
	
	@Autowired
	private WishService wish_Service;
	
	@Autowired
	private ReviewService review_Service;
	
	public static String basePath = "C:\\SellerReImg\\";
	
	
	// ==================== ▼ Page Control ▼ ====================
	
	/**
	 * 상품등록 창으로 이동
	 */
	@GetMapping(value = "/product/product_add")
	public void productAddForm() {
		
	}
	
	// ==================== ▲ Page Control ▲ ====================
	
	

	
	
	/**
	 * 상품등록 후 유저프로필(내가 등록한 상품) 창으로 이동
	 */
	@RequestMapping(value = "/product/product_add")
	public String productAdd(Product p, RedirectAttributes redirect) {
		
		int num = product_Service.getNum();
		p.setProduct_num(num);
		
		product_Service.insertProduct(p);
		
		saveImg(num, p.getProduct_img1());
		saveImg(num, p.getProduct_img2());
		saveImg(num, p.getProduct_img3());
		
		redirect.addAttribute("user_id", p.getUser_id());
		
		return "redirect:/user/userProfile";
	}
	
	
	@RequestMapping(value = "/product/productDetail")
	   public ModelAndView productDetail(@RequestParam(value = "user_id") String user_id, @RequestParam(value = "product_num")int product_num) {
	      System.out.println("productDetail 컨트롤러 : " + product_num + " " + user_id );
	      ModelAndView mav = new ModelAndView("/product/product_detail");
	      
	      Product p = product_Service.selectProductByNum(product_num);
	      
	      // u 는 상품 등록한 사람
	      User u = user_Service.checkUserId(p.getUser_id());
	      
	      int wishCount = wish_Service.countUserIdByProductNum(product_num);
	      Wish w = new Wish();
	      
	      // 현재 로그인 된 id
	      String login_user_id = user_id;
	      
	      // 찜하기 체크
	      int wishResultType = 0;

ArrayList<Review> reviewList = (ArrayList<Review>) review_Service.selectReviewByProductNum(product_num);
	float avg = 0;
	      
	      // 로그인 안됐을 때
	      if (user_id == "" || user_id == null) {
	         wishResultType = 0;
	         System.out.println("productDetail 컨트롤러 로그인 x : " + wishResultType);
	      } else {
	      // 로그인 했을 때
	         w = wish_Service.selectByUserIdProductNum(product_num, login_user_id);
	         System.out.println("productDetail 컨트롤러 : " + w);
	         // 현재 상품이 찜 목록이 아니라면
	         if (w == null) {
	            wishResultType = 0;
	            System.out.println("productDetail 컨트롤러 로그인 o / 찜 x : " + wishResultType);
	         } else if (w != null) {
	            wishResultType = 1;
	            System.out.println("productDetail 컨트롤러 로그인 o / 찜 o : " + wishResultType);
	         }
	      }
	      
		if (u.getUser_scorecount() == 0) {
			avg = 0;
		} else {
			avg = (float)u.getUser_score() / (float)u.getUser_scorecount();
		}
		String user_avg = String.format("%.1f", avg);


//	      user_Service.checkNickName(u.getUser_nickname());
	      String path = basePath + p.getProduct_num() + "\\";
	      File imgDir = new File(path);
	      
	      
	      
	      if (imgDir.exists()) {
	         String[] files = imgDir.list();
	         for (int j = 0; j < files.length; j++) {
	            mav.addObject("productImg" + j, files[j]);
	         }
	         mav.addObject("files", files);
	      }
	      
	      Category c1 = admin_Service.selectCategory(p.getCategory1_num(), 1);
	      Category c2 = admin_Service.selectCategory(p.getCategory2_num(), 2);
	      Category c3 = admin_Service.selectCategory(p.getCategory3_num(), 3);
	      
	      product_Service.productHit(product_num);
	      mav.addObject("p", p);
	      mav.addObject("u", u);
	      mav.addObject("c1", c1);
	      mav.addObject("c2", c2);
	      mav.addObject("c3", c3);
	      mav.addObject("wishCount", wishCount);
	      System.out.println("productDetail 컨트롤러 넣기직전 " + wishResultType);
	      mav.addObject("wishResultType", wishResultType);
		mav.addObject("user_avg", user_avg);
		mav.addObject("reviewList", reviewList);
	      
	      return mav;
	   }
	
	
	
	@RequestMapping(value = "/user/userProfile")
	public ModelAndView userProductList(@RequestParam(value="user_id") String user_id) {
		
		ModelAndView mav = new ModelAndView("/user/userProfile");
		
		User u = user_Service.checkUserId(user_id);
		
		float avg = 0;
		
		
		/* 유저 ID로 상품가져오기 */
		ArrayList<Product> myProductList = (ArrayList<Product>) product_Service.selectProductByUserId(user_id);
		
		/* 카테고리 가져오기 */
		ArrayList<Category> c1 = new ArrayList<Category>(); 
		ArrayList<Category> c2 = new ArrayList<Category>(); 
		ArrayList<Category> c3 = new ArrayList<Category>();
		
		
		/* 등록된 이미지 가져오기 */
		ArrayList<String> fileList = new ArrayList<String>();
		String path = "";
		
		for (int i = 0; i < myProductList.size(); i++) {
			Product p = myProductList.get(i);
			path = basePath + p.getProduct_num() + "\\";
			File imgDir = new File(path);
			mav.addObject("path" + i, path);
			
			if (imgDir.exists()) {
				String[] files = imgDir.list();
				fileList.add(files[0]);
			}
			
			Category category1 = admin_Service.selectCategory(myProductList.get(i).getCategory1_num(), 1);
			c1.add(category1);
			
			Category category2 = admin_Service.selectCategory(myProductList.get(i).getCategory2_num(), 2);
			c2.add(category2);
			
			Category category3 = admin_Service.selectCategory(myProductList.get(i).getCategory3_num(), 3);
			c3.add(category3);
		}
		
		
		if (u.getUser_scorecount() == 0) {
			avg = 0;
		} else {
			avg = (float)u.getUser_score() / (float)u.getUser_scorecount();
		}
		String user_avg = String.format("%.1f", avg);
		
		mav.addObject("fileList", fileList);
		mav.addObject("myProductList", myProductList);
		mav.addObject("c1", c1);
		mav.addObject("c2", c2);
		mav.addObject("c3", c3);
		mav.addObject("u", u);
		mav.addObject("user_avg", user_avg);
		
		return mav;
		
	}
	
	
	@RequestMapping(value = "/product/productDelete")
	public String productDelete(RedirectAttributes redirect, @RequestParam(value = "product_num") int product_num, @RequestParam(value = "user_id") String user_id) {
		
		wish_Service.deleteProductAndWish(product_num);
		product_Service.deleteProduct(product_num);
		
		String path = basePath + product_num + "\\";
		File imgDir = new File(path);
		
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			
			for (int j = 0; j < files.length; j++) {
				File f = new File(path + files[j]);
				f.delete();
			}
		}
		imgDir.delete();
		redirect.addAttribute("user_id", user_id);
		
		return "redirect:/user/userProfile";
	}
	
	
	
	@RequestMapping(value = "/product/mav_productEdit")
	public ModelAndView productEditMav(@RequestParam(value = "product_num") int product_num) {
		
		ModelAndView mav = new ModelAndView("/product/product_edit");
		
		Product p = product_Service.selectProductByNum(product_num);
		
		mav.addObject("p", p);

		
		return mav;
	}
	
	
	@RequestMapping(value = "/product/productEdit")
	public String productEdit(RedirectAttributes redirect, Product p, @RequestParam(value = "product_num") int product_num, @RequestParam(value="user_type") int user_type) {
		
		// 게시글에 등록된 이미지 삭제
		String path = basePath + product_num + "\\";
		File imgDir = new File(path);
		
		if (imgDir.exists()) {
			String[] files = imgDir.list();

			for (int j = 0; j < files.length; j++) {
				File f = new File(path + files[j]);
				f.delete();
			}
		}
		
		saveImg(product_num, p.getProduct_img1());
		saveImg(product_num, p.getProduct_img2());
		saveImg(product_num, p.getProduct_img3());
		
		product_Service.updateProduct(p);
		
		redirect.addAttribute("user_id", p.getUser_id());
		String return_path ="redirect:/user/userProfile";
		
		if(user_type==2) {
			redirect.addAttribute("product_num", product_num);
			return_path ="redirect:/product/productDetail"; 
		}
		return return_path;
		
	}
	

	
	/**
	    * 가격으로 상품 검색하기
	    * @param min - 최소가격
	    * @param max - 최대가격
	    * @return - ModelAndView
	    */
	   @RequestMapping(value = "product/selectProductByPrice")
	   public ModelAndView selectProductByPrice(@RequestParam(value = "user_id") String user_id, @RequestParam(value = "searchKeyword")String searchKeyword, @RequestParam(value = "categoryName")String categoryName, @RequestParam(value = "min") String min, @RequestParam(value = "max") String max) {
	      ModelAndView mav = new ModelAndView("/product/product_list");
	      Product p = null;
	      int count = 0;
	       ArrayList<Integer> wishCount = new ArrayList<Integer>();
	       ArrayList<Product> allProdList = new ArrayList<Product>();
	       int minNumber;
	       int maxNumber;
	       if (min == null || min == "") {
	    	  min = "0";
	    	  minNumber = Integer.parseInt(min);
	    	  System.out.println("if minNumber : " + minNumber);
	       }
	       
	       if (max == null || max == "") {
	    	  max = "2147483647";
	    	  maxNumber = Integer.parseInt(max);
	    	  System.out.println("if maxNumber : " + maxNumber);
	       }
	       minNumber = Integer.parseInt(min);
	       maxNumber = Integer.parseInt(max);
	       System.out.println("minNumber : " + minNumber);
	       System.out.println("maxNumber : " + maxNumber);
	       
	        if(categoryName != "") {
	           allProdList = (ArrayList<Product>) product_Service.selectProductByPriceAndCategoryName(categoryName, minNumber, maxNumber);
	           for (int i = 0; i < allProdList.size(); i++) {
	              p = allProdList.get(i);
	              count = wish_Service.countUserIdByProductNum(p.getProduct_num());
	              wishCount.add(count); 
	           }
	           
	        }else{
	           allProdList = (ArrayList<Product>) product_Service.selectProductByPriceAndName(searchKeyword, minNumber, maxNumber);
	           for (int i = 0; i < allProdList.size(); i++) {
	              p = allProdList.get(i);
	              count = wish_Service.countUserIdByProductNum(p.getProduct_num());
	              wishCount.add(count); 
	           }
	        }
	       
	       /* 카테고리 가져오기 */
	         ArrayList<Category> c1 = new ArrayList<Category>(); 
	         ArrayList<Category> c2 = new ArrayList<Category>(); 
	         ArrayList<Category> c3 = new ArrayList<Category>();
	         
	         if (user_id != "") {
	            User u = user_Service.checkUserId(user_id);
	         
	             if (u.getUser_type() == 2) {
	               if(allProdList.isEmpty()) {
	                  System.out.println("list 비었음");
	                  allProdList.add(new Product(0, "", 0, "", 0, 0, 0, "", null, 0, 0));
	               }
	               System.out.println("서치키워드 컨트롤러3333333" + allProdList);
	               mav.setViewName("/admin/productJSON");
	               mav.addObject("allProdList", allProdList);
	            }
	         }
	         /* 등록된 이미지 가져오기 */
	           ArrayList<String> fileList = new ArrayList<String>();
	           String path = "";
	        
	           for (int i = 0; i < allProdList.size(); i++) {
	              p = allProdList.get(i);
	              path = basePath + p.getProduct_num() + "\\";
	              File imgDir = new File(path);
	              mav.addObject("path" + i, path);
	              
	              if (imgDir.exists()) {
	                 String[] files = imgDir.list();
	                 fileList.add(files[0]);
	           }
	           
	           Category category1 = admin_Service.selectCategory(allProdList.get(i).getCategory1_num(), 1);
	           c1.add(category1);
	           
	           Category category2 = admin_Service.selectCategory(allProdList.get(i).getCategory2_num(), 2);
	           c2.add(category2);
	           
	           Category category3 = admin_Service.selectCategory(allProdList.get(i).getCategory3_num(), 3);
	           c3.add(category3);
	        }
	       
	      mav.addObject("allProdList", allProdList);
	      mav.addObject("wishCount",wishCount);
	      mav.addObject("fileList", fileList);
	      mav.addObject("c1", c1);
	      mav.addObject("c2", c2);
	      mav.addObject("c3", c3);
	      return mav;
	   }
	
	
	
	@RequestMapping("productImg")
	public ResponseEntity<byte[]> getImg(String fname, int product_num) {
		
		String path = basePath + product_num + "\\" + fname;
		File f = new File(path);
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;
		
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/product/product_list")
	public ModelAndView productAllList(Product p) {
		
		ModelAndView mav = new ModelAndView("/product/product_list");
		
		ArrayList<Product> allProdList = (ArrayList<Product>) product_Service.selectProductAll();
		
		/* 카테고리 가져오기 */
		ArrayList<Category> c1 = new ArrayList<Category>(); 
		ArrayList<Category> c2 = new ArrayList<Category>(); 
		ArrayList<Category> c3 = new ArrayList<Category>();
		
		
		/* 등록된 이미지 가져오기 */
		ArrayList<String> fileList = new ArrayList<String>();
		String path = "";
		
		for (int i = 0; i < allProdList.size(); i++) {
			p = allProdList.get(i);
			path = basePath + p.getProduct_num() + "\\";
			File imgDir = new File(path);
			mav.addObject("path" + i, path);
			
			if (imgDir.exists()) {
				String[] files = imgDir.list();
				fileList.add(files[0]);
			}
			
			Category category1 = admin_Service.selectCategory(allProdList.get(i).getCategory1_num(), 1);
			c1.add(category1);
			
			Category category2 = admin_Service.selectCategory(allProdList.get(i).getCategory2_num(), 2);
			c2.add(category2);
			
			Category category3 = admin_Service.selectCategory(allProdList.get(i).getCategory3_num(), 3);
			c3.add(category3);
		}
		
		mav.addObject("allProdList", allProdList);
		mav.addObject("fileList", fileList);
		mav.addObject("c1", c1);
		mav.addObject("c2", c2);
		mav.addObject("c3", c3);
		
		return mav;
	}
	
	
	/**
	 * 이미지를 저장하기 위한 메소드
	 * @param num
	 * @param file
	 */
	public void saveImg(int num, MultipartFile file) {
		String fileName = file.getOriginalFilename();
		if (fileName != null && !fileName.equals("")) {
			File dir = new File(basePath + num);
			File f = null;

			if (!dir.exists()) {
				dir.mkdir(); // 폴더 이름을 시퀀스 번호로 생성하고, 그 폴더 안에 이미지가 들어간다.
				
				fileName = "0" + fileName;
				f = new File(basePath + num + "\\" + fileName);
			}
			f = new File(basePath + num + "\\" + fileName);

			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				// TODO: handle exception
				e.printStackTrace();
			} catch (IOException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	// 검색어로 검색
    @RequestMapping(value= "/product/searchKeyword")
    public ModelAndView searchKeywordResult(@RequestParam(value = "user_id") String user_id, 
    										@RequestParam(value = "searchKeyword") String searchKeyword) {
      
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/product/product_list");
      Product p = null;
      ArrayList<Integer> wishCount = new ArrayList<Integer>();
      ArrayList<Product> allProdList = (ArrayList<Product>) product_Service.selectProductByName(searchKeyword);
      /* 카테고리 가져오기 */
      ArrayList<Category> c1 = new ArrayList<Category>(); 
      ArrayList<Category> c2 = new ArrayList<Category>(); 
	  ArrayList<Category> c3 = new ArrayList<Category>();
      
      
      if (user_id != "") {
    	  User u = user_Service.checkUserId(user_id);
      
	       if (u.getUser_type() == 2) {
	    	  if(allProdList.isEmpty()) {
	    		  allProdList.add(new Product(0, "", 0, "", 0, 0, 0, "", null, 0, 0));
	    	  }
	    	  mav.setViewName("/admin/productJSON");
	    	  mav.addObject("allProdList", allProdList);
	      }
      }
      /* 등록된 이미지 가져오기 */
  		ArrayList<String> fileList = new ArrayList<String>();
  		String path = "";
  	
	  	for (int i = 0; i < allProdList.size(); i++) {
	  		p = allProdList.get(i);
	  		path = basePath + p.getProduct_num() + "\\";
	  		File imgDir = new File(path);
	  		mav.addObject("path" + i, path);
	  		
	  		if (imgDir.exists()) {
	  			String[] files = imgDir.list();
	  			fileList.add(files[0]);
  		}
  		
  		Category category1 = admin_Service.selectCategory(allProdList.get(i).getCategory1_num(), 1);
  		c1.add(category1);
  		
  		Category category2 = admin_Service.selectCategory(allProdList.get(i).getCategory2_num(), 2);
  		c2.add(category2);
  		
  		Category category3 = admin_Service.selectCategory(allProdList.get(i).getCategory3_num(), 3);
  		c3.add(category3);
  	}
      
      
      for (int i = 0; i < allProdList.size(); i++) {
         p = allProdList.get(i);
         System.out.println("검색어로 검색 p : " + p);
         int count = wish_Service.countUserIdByProductNum(p.getProduct_num());
      
         System.out.println("검색어로 검색 count : " + count);
          wishCount.add(count); 
          System.out.println();
      }
      
      mav.addObject("allProdList", allProdList);
      mav.addObject("searchKeyword", searchKeyword);
      mav.addObject("wishCount",wishCount);
      mav.addObject("fileList", fileList);
      mav.addObject("c1", c1);
      mav.addObject("c2", c2);
      mav.addObject("c3", c3);
      
      return mav;
    }

	
	
	
	


    	// 카테고리로 검색
	   @RequestMapping(value= "/product/searchCategoryName")
	   public ModelAndView searchCategoryNameResult(@RequestParam(value = "user_id") String user_id, 
			   										@RequestParam(value = "categoryName") String categoryName) {
		   
	      ModelAndView mav = new ModelAndView("/product/product_list");
	      Product p = null;
	      ArrayList<Integer> wishCount = new ArrayList<Integer>();
	      ArrayList<Product> allProdList = (ArrayList<Product>) product_Service.selectProductByCategoryName(categoryName);
	      /* 카테고리 가져오기 */
	      ArrayList<Category> c1 = new ArrayList<Category>(); 
	      ArrayList<Category> c2 = new ArrayList<Category>(); 
	      ArrayList<Category> c3 = new ArrayList<Category>();
	      
	      if (user_id != "") {
	    	  User u = user_Service.checkUserId(user_id);
	      
		       if (u.getUser_type() == 2) {
		    	  if(allProdList.isEmpty()) {
		    		  allProdList.add(new Product(0, "", 0, "", 0, 0, 0, "", null, 0, 0));
		    	  }
		    	  mav.setViewName("/admin/productJSON");
		    	  mav.addObject("allProdList", allProdList);
		      }
	      }
	      
	      /* 등록된 이미지 가져오기 */
	  		ArrayList<String> fileList = new ArrayList<String>();
	  		String path = "";
	  	
		  	for (int i = 0; i < allProdList.size(); i++) {
		  		p = allProdList.get(i);
		  		path = basePath + p.getProduct_num() + "\\";
		  		File imgDir = new File(path);
		  		mav.addObject("path" + i, path);
		  		
		  		if (imgDir.exists()) {
		  			String[] files = imgDir.list();
		  			fileList.add(files[0]);
	  		}
	  		
	  		Category category1 = admin_Service.selectCategory(allProdList.get(i).getCategory1_num(), 1);
	  		c1.add(category1);
	  		
	  		Category category2 = admin_Service.selectCategory(allProdList.get(i).getCategory2_num(), 2);
	  		c2.add(category2);
	  		
	  		Category category3 = admin_Service.selectCategory(allProdList.get(i).getCategory3_num(), 3);
	  		c3.add(category3);
	  	}
	      for (int i = 0; i < allProdList.size(); i++) {
			 p = allProdList.get(i);
			 int count = wish_Service.countUserIdByProductNum(p.getProduct_num());
			 wishCount.add(count); 
	      }
	      
	      mav.addObject("categoryName", categoryName);
	      mav.addObject("allProdList", allProdList);
	      mav.addObject("wishCount",wishCount);
	      mav.addObject("fileList", fileList);
	      mav.addObject("c1", c1);
	      mav.addObject("c2", c2);
	      mav.addObject("c3", c3);
	      
	      return mav;
	   }
	
	
	
		// 거래완료
		@RequestMapping(value="/product/updateResult")
		public String updateResult(RedirectAttributes redirect, @RequestParam(value="product_num") int product_num) {
			
			System.out.println("거래완료 controller==== 상품번호 :" + product_num);
			
			Product p  = product_Service.selectProductByNum(product_num);
			p.setResult(2);
			
			product_Service.updateProduct(p);
			redirect.addAttribute("user_id", p.getUser_id());
			System.out.println("거래완료 controller==== 회원아이디 :" + p.getUser_id());
			
			return "redirect:/user/userProfile";
		}
	
	
	
	

	
}
