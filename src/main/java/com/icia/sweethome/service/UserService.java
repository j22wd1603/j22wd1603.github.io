/**
 * <pre>
 * 프로젝트명 : HiBoard
 * 패키지명   : com.icia.web.service
 * 파일명     : UserService.java
 * 작성일     : 2021. 1. 20.
 * 작성자     : daekk
 * </pre>
 */
package com.icia.sweethome.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.sweethome.dao.UserDao;
import com.icia.sweethome.model.User;

/**
 * <pre>
 * 패키지명   : com.icia.web.service
 * 파일명     : UserService.java
 * 작성일     : 2021. 1. 20.
 * 작성자     : daekk
 * 설명       : 사용자 서비스
 * </pre>
 */
@Service("userService")
public class UserService
{
   private static Logger logger = LoggerFactory.getLogger(UserService.class);
   
   /**
    * @Autowired : IoC컨테이너 안에 존재하는 Bean을 자동으로 주입한다.
    */
   @Autowired
   private UserDao userDao;
   
   /**
    * <pre>
    * 메소드명   : userSelect
    * 작성일     : 2021. 1. 20.
    * 작성자     : daekk
    * 설명       : 사용자 조회
    * </pre>
    * @param userId 사용자 아이디
    * @return User
    */
   public User userSelect(String userId)
   {
      User user = null;
      
      try
      {
         user = userDao.userSelect(userId);
      }
      catch(Exception e)
      {
         logger.error("[UserService] userSelect Exception", e);
      }
      
      return user;
   }
   
   //사용자 등록
   public int userInsert(User user)
   {
      int count = 0;
      
      try
      {
         count = userDao.userInsert(user);
      }
      catch(Exception e)
      {
         logger.error("[UserService]userInsert Exception", e);
      }
      
      return count;
   }
   
   //회원정보 수정
   public int userUpdate(User user)
   {
      int count = 0;
      
      try
      {
         count = userDao.userUpdate(user);
      }
      catch(Exception e)
      {
         logger.error("[UserService]userUpdate Exception", e);
      }
      
      return count;
   }
   
   // 마이페이지 좋아요 쿠폰 스크랩 건수
   public User myCountList(String userId)
   {
      User user = null;
      
      try
      {
         user = userDao.myCountList(userId);
      }
      catch(Exception e)
      {
         logger.error("[UserService] myCountList Exception", e);
      }
      
      return user;
   }
   
   public String get_searchId(String userName, String userPhone) {
	      String result = "";

	      try {
	         result = userDao.searchId(userName, userPhone);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      return result;
	   }
	   
	   public String get_searchPwd(String userId, String userEmail) {
	      String result = "";

	      try {
	         result = userDao.searchPwd(userId, userEmail);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      return result;
	   }

   
}