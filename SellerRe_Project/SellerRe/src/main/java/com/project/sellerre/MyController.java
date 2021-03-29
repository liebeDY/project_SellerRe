package com.project.sellerre;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.sellerre.product.Product;
import com.project.sellerre.product.ProductService;

@Controller
public class MyController {
   
   public static String basePath = "C:\\SellerReImg\\";
   
   @Autowired
   private ProductService product_Service;
   
   
   @RequestMapping(value = "/")
   public ModelAndView index() {
      
      System.out.println("처음 시작 index text");
      ModelAndView mav = new ModelAndView("/index");
      
      
      ArrayList<Product> list = (ArrayList<Product>)product_Service.selectProductAll();
      Product p = new Product();
      ArrayList<Product> indexList = new ArrayList<Product>();
      System.out.println("list = " + list);
      
      ArrayList<String> fileList = new ArrayList<String>();
      String path = "";
      
      try {
         // 첫 메인페이제 상품 4개만 가져온다
         System.out.println("list.size : " + list.size());
         for (int i = 0; i < 4; i++) {
            System.out.println("반복문 i : " + i);
            // 전체 상품수가 4개 미만일 때
            if (list.size() < 4) {
               // 마지막 상품으로 채운다
               if (i < list.size()) {
                  p = list.get(i);
                  System.out.println("반복문 if list.get(i) : " + i + " " + p);
               } else {
                  p = list.get(list.size()-1);
                  System.out.println("반복문 else list.get(i) : " + i + " " + p);
               }
               path = basePath + p.getProduct_num() + "\\";
               File imgDir = new File(path);
               
               if (imgDir.exists()) {
                  String[] files = imgDir.list();
                  fileList.add(files[0]);
               }
               indexList.add(p);
               System.out.println("if문 p = " + p);
            } else {
               p = list.get(i);
               path = basePath + p.getProduct_num() + "\\";
               File imgDir = new File(path);
               
               if (imgDir.exists()) {
                  String[] files = imgDir.list();
                  fileList.add(files[0]);
               }
               System.out.println("p = " + p);
               indexList.add(p);
               System.out.println("indexList에 add 성공" + i + "번쨰");
            }
         }
         System.out.println(indexList);
         System.out.println("fileList : " + fileList);
         mav.addObject("fileList", fileList);
         mav.addObject("indexList", indexList);
         
      } catch (IndexOutOfBoundsException e) {
         e.printStackTrace();
      }
      return mav;
   }
   
}