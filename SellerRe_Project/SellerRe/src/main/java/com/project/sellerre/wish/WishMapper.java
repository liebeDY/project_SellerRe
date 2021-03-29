package com.project.sellerre.wish;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WishMapper {

      //현재 아이디와 보고 있는 상품 입력
      void insertWish(Wish w);
      
      //세션아이디의 위시 테이블에 product_num을 비교해서 출력
      List selectWishNum(int wish_num);
      
      //현재 아이디의 찜리스트가 나와야함 id :session_Id, 구매자 id
      List selectByUserId(String user_id);
      
      //찜 횟수 계수
      int countUserIdByProductNum(int product_num);
      
      // 선택 삭제   // 세션아이디를 비교해서 productnum을 삭제
      void deleteWish(Map map);
      
      // 전체 삭제
      void deleteAllWish(String user_id);
      
      Wish selectByUserIdProductNum(Map map);
      
      void deleteProductAndWish(int product_num);
      
      int getNum();
      
}