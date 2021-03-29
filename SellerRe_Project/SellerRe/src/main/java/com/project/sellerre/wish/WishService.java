package com.project.sellerre.wish;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class WishService {

   @Autowired
   private WishMapper wishmapper;
   
   /*
    * 찜DB에 찜리스트를 추가한다.
    * wish_num      : 시퀀스 값으로 대체
    * user_id      : 구매자 id(=session.id)
    * product_num   : product의 num (=상품번호)
    */
   public void insertWish(Wish w) {
      wishmapper.insertWish(w);
   }
   
   /*
    * 프로덕트에서 찜의 세션 아이디가 가진 아이디를 가진 프로덕트 넘버를 통해 상품정보를 가져온다
    * user_id      : 구매자 id(=session.id)
    * product_num   : product의 num (=상품번호)
    */
   public List selectByUserId(String user_id) {
      return wishmapper.selectByUserId(user_id);
   }
   
   
   public int countUserIdByProductNum(int product_num) {
      return wishmapper.countUserIdByProductNum(product_num);
   }
   
   
   public Wish selectByUserIdProductNum(int product_num, String user_id) {
     Map map = new HashMap();
     map.put("user_id", user_id);
      map.put("product_num", product_num);
     return wishmapper.selectByUserIdProductNum(map);
   }
   /*
    * 찜리스트에서 삭제
    * wish_num : 위시리스트 시퀀스 넘버
    */
   public void delwish(String user_id,int product_num) {
      Map map = new HashMap();
      map.put("user_id", user_id);
      map.put("product_num", product_num);
      wishmapper.deleteWish(map);
   }
   /*
    * 찜리스트 전체 삭제
    */
   public void delwishAll(String user_id) {
      wishmapper.deleteAllWish(user_id);
   }
   
   public void deleteProductAndWish(int product_num) {
	   wishmapper.deleteProductAndWish(product_num);
   }
   
   public int getNum() {
      return wishmapper.getNum();
   }
}