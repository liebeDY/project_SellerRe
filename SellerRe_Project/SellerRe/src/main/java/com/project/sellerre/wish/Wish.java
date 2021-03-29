package com.project.sellerre.wish;

import java.util.ArrayList;

import com.project.sellerre.product.Product;

public class Wish {
   private int wish_num;
   private String user_id;
   private int product_num;
   private int wish_type;
   private ArrayList<Product> p = new ArrayList<Product>();// 프로덕트 리스트
   private ArrayList<Wish> w = new ArrayList<Wish>();// 위시리스트

   public Wish() {
      super();
   }

   public Wish(int wish_num, String user_id, int product_num, int wish_type, ArrayList<Product> p, ArrayList<Wish> w) {
      super();
      this.wish_num = wish_num;
      this.user_id = user_id;
      this.product_num = product_num;
      this.wish_type = wish_type;
      this.p = p;
      this.w = w;
   }

   public int getWish_num() {
      return wish_num;
   }

   public void setWish_num(int wish_num) {
      this.wish_num = wish_num;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public int getProduct_num() {
      return product_num;
   }

   public void setProduct_num(int product_num) {
      this.product_num = product_num;
   }

   public int getWish_type() {
      return wish_type;
   }

   public void setWish_type(int wish_type) {
      this.wish_type = wish_type;
   }

   public ArrayList<Product> getP() {
      return p;
   }

   public void setP(ArrayList<Product> p) {
      this.p = p;
   }

   public ArrayList<Wish> getW() {
      return w;
   }

   public void setW(ArrayList<Wish> w) {
      this.w = w;
   }

   @Override
   public String toString() {
      return "Wish [wish_num=" + wish_num + ", user_id=" + user_id + ", product_num=" + product_num + ", wish_type="
            + wish_type + ", w=" + w + "]";
   }

}