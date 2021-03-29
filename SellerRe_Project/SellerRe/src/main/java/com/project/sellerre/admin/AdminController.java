package com.project.sellerre.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.sellerre.product.ProductService;
import com.project.sellerre.user.User;
import com.project.sellerre.user.UserService;
import com.project.sellerre.wish.WishService;

@Controller
public class AdminController {

   @Autowired
   private AdminService admin_Service;

   @Autowired
   private UserService user_Service;
   
   @Autowired
   private ProductService product_Service;
   
   @Autowired
   private WishService wish_Service;

   // ==================== ▼ Page Control ▼ ====================

   // 로그인 후 관리자 메인페이지로 이동
   @RequestMapping("/admin/adminMain")
   public void adminMain() {

   }
   

   // 관리자 홈페이지 정보로 이동
   @RequestMapping("/admin/adminHomePage")
   public ModelAndView adminHomePage() {
      ModelAndView mav = new ModelAndView("/admin/adminHomePage");
      
      int totalUserNum = user_Service.getTotalUserNum();
      mav.addObject("totalUserNum", totalUserNum);
      
      int todayUserNum = user_Service.getTodayUserNum();
      mav.addObject("todayUserNum", todayUserNum);
      
      int totalProductNum = product_Service.getTotalProductNum();
      mav.addObject("totalProductNum", totalProductNum);
      
      int todayProductNum = product_Service.getTodayProductNum();
      mav.addObject("todayProductNum", todayProductNum);
      
      return mav;
   }


   // 관리자 카테고리로 이동
   @GetMapping("admin/adminCategory")
   public void adminCategory() {

   }

   // 관리자 회원관리로 이동
   @GetMapping("admin/adminUser")
   public void adminUser() {

   }

   // 관리자 상품관리로 이동
   @GetMapping("admin/adminProduct")
   public void adminProduct() {

   }



   @RequestMapping("admin/selectAdminPage")
   public ModelAndView selectAdminPage(@RequestParam(value = "adminPageType") String adminPageType) {

      ModelAndView mav = new ModelAndView("admin/adminMain");

      int type = 0;
      switch (adminPageType) {
      case "홈페이지정보":
         type = 1;
         break;

      case "회원관리":
         type = 2;
         break;

      case "상품관리":
         type = 3;
         break;

      case "카테고리관리":
         type = 4;
         break;

      case "공지사항":
         type = 5;
         break;

      case "QnA":
         type = 6;
         break;

      case "신고게시판":
         type = 7;
         break;

      }
      mav.addObject("type", type);
      return mav;

   }

   // ==================== ▲ Page Control ▲ ====================

   // 로그아웃 후 메인페이지로 이동
   @RequestMapping(value = "/admin/logout")
   public String logout(HttpServletRequest request) {

      HttpSession session = request.getSession(false);
      session.removeAttribute("user_Id");
      session.invalidate();

      return "redirect:/index";
   }

   // ==================== Category ====================

   // DB에 카테고리 추가 (페이지X)
   // adminCategory 페이지에서 추가 버튼 눌렀을 때
   @RequestMapping(value = "/admin/addCategory")
   public ModelAndView addCategory(@RequestParam(value = "category_name") String category_name,
         @RequestParam(value = "parent_category_num") int parent_category_num,
         @RequestParam(value = "category_type") int category_type) {
      int category_num;
      Category c = null;
      ModelAndView mav = new ModelAndView("/admin/categoryJSON");

      if (category_type == 1) {
         category_num = admin_Service.getNum(category_type);
         c = new Category(category_num, category_name);
      } else if (category_type == 2) {
         category_num = admin_Service.getNum(category_type);
         c = new Category(category_num, category_name, parent_category_num);
      } else if (category_type == 3) {
         category_num = admin_Service.getNum(category_type);
         c = new Category(category_num, category_name, parent_category_num);
      }

      System.out.println(c);
      System.out.println(category_type);
      admin_Service.insertCategory(c, category_type);

      ArrayList<Category> category_list = null;

      switch (category_type) {
      case 1:
         category_list = (ArrayList<Category>) admin_Service.selectAllCategory(0, 1);
         break;
      case 2:
         category_list = (ArrayList<Category>) admin_Service.selectAllCategory(parent_category_num, 2);
         break;
      case 3:
         category_list = (ArrayList<Category>) admin_Service.selectAllCategory(parent_category_num, 3);
         break;
      }
      mav.addObject("category_list", category_list);

      return mav;
   }

   // 화면에 출력
   @RequestMapping(value = "/admin/getCategory")
   public ModelAndView getCategory(@RequestParam(value = "parent_category_num") int parent_category_num,
         @RequestParam(value = "category_type") int category_type) {

      System.out.println("출력 parent_category_num : " + parent_category_num);
      System.out.println("출력 category_type : " + category_type);

      ModelAndView mav = new ModelAndView("/admin/categoryJSON");
      ArrayList<Category> category_list = null;

      switch (category_type) {
      case 1:
         category_list = (ArrayList<Category>) admin_Service.selectAllCategory(0, 1);
         break;
      case 2:
         category_list = (ArrayList<Category>) admin_Service.selectAllCategory(parent_category_num, 2);
         break;
      case 3:
         category_list = (ArrayList<Category>) admin_Service.selectAllCategory(parent_category_num, 3);
         break;
      }
      mav.addObject("category_list", category_list);

      return mav;
   }

   // 카테고리 수정
   @RequestMapping(value = "/admin/updateCategory")
   public ModelAndView updateCategory(@RequestParam(value = "category_type") int category_type,
         @RequestParam(value = "category_num") int category_num,
         @RequestParam(value = "category_name") String category_name) {
      System.out.println("수정 category_num : " + category_num);
      System.out.println("수정 category_type : " + category_type);
      System.out.println("수정 category_name : " + category_name);

      // 수정 전 카테고리
      Category c1 = admin_Service.selectCategory(category_num, category_type);
      // 수정 후 카테고리
      Category c2 = new Category(category_num, category_name, c1.getParent_category_num());
      admin_Service.updateCategory(c2, category_type);

      ModelAndView mav = new ModelAndView("/admin/categoryJSON");
      ArrayList<Category> category_list = null;

      switch (category_type) {
      case 1:
         category_list = (ArrayList<Category>) admin_Service.selectAllCategory(0, 1);
         break;
      case 2:
         category_list = (ArrayList<Category>) admin_Service.selectAllCategory(c2.getParent_category_num(), 2);
         break;
      case 3:
         category_list = (ArrayList<Category>) admin_Service.selectAllCategory(c2.getParent_category_num(), 3);
         break;
      }
      mav.addObject("category_list", category_list);

      return mav;
   }

   // 카테고리 삭제
   @RequestMapping(value = "/admin/deleteCategory")
   public ModelAndView updateCategory(@RequestParam(value = "category_type") int category_type,
         @RequestParam(value = "category_num") int category_num) {
      System.out.println("삭제용 category_num : " + category_num);
      System.out.println("삭제용 category_type : " + category_type);

      Category c1 = admin_Service.selectCategory(category_num, category_type);
      admin_Service.deleteCategory(category_num, category_type);

      ModelAndView mav = new ModelAndView("/admin/categoryJSON");
      ArrayList<Category> category_list = null;

      switch (category_type) {
      case 1:
         category_list = (ArrayList<Category>) admin_Service.selectAllCategory(0, 1);
         break;
      case 2:
         category_list = (ArrayList<Category>) admin_Service.selectAllCategory(c1.getParent_category_num(), 2);
         break;
      case 3:
         category_list = (ArrayList<Category>) admin_Service.selectAllCategory(c1.getParent_category_num(), 3);
         break;
      }
      mav.addObject("category_list", category_list);

      return mav;
   }

   // ==================== User ====================

   // 회원 검색
   @RequestMapping(value = "/admin/selectUser")
   public ModelAndView selectUser(@RequestParam(value = "user_id") String user_id) {

      ModelAndView mav = new ModelAndView("/admin/userJSON");

      // user_id로 DB에서 User 정보 가져오기
      User u = user_Service.checkUserId(user_id);

      // 회원이 존재하지 않을 때
      if (u == null) {
         mav.addObject("user_id", "");
         mav.addObject("user_name", "");
         mav.addObject("user_nickname", "");
         mav.addObject("user_type", 3);
      } else {
         mav.addObject("user_id", u.getUser_id());
         mav.addObject("user_name", u.getUser_name());
         mav.addObject("user_nickname", u.getUser_nickname());
         mav.addObject("user_type", u.getUser_type());
      }

      return mav;
   }

   // 회원 삭제
   @RequestMapping(value = "/admin/deleteUser")
   public ModelAndView deleteUser(@RequestParam("user_id") String user_id) {

      System.out.println("관리자 회원 삭제 controller"+user_id);
      ModelAndView mav = new ModelAndView("/admin/userJSON");

      User u = user_Service.checkUserId(user_id);
      System.out.println(u);
      if (u == null) {
         System.out.println("관리자 회원 삭제 controller : 존재하지 않는 회원");
         mav.addObject("user_id", "");
         mav.addObject("user_name", "");
         mav.addObject("user_nickname", "");
         mav.addObject("user_type", 3);
      } else {
         System.out.println("관리자 회원 삭제 controller : 관리자 or 회원");
         mav.addObject("user_id", u.getUser_id());
         mav.addObject("user_name", u.getUser_name());
         mav.addObject("user_nickname", u.getUser_nickname());
         mav.addObject("user_type", u.getUser_type());
         
         if (u.getUser_type() == 1) {
        	 wish_Service.delwishAll(user_id);
        	 user_Service.deleteUser(user_id);
            System.out.println("관리자 회원 삭제 controller : 회원 → 삭제완료");
         } 
      }

      return mav;
   }

}