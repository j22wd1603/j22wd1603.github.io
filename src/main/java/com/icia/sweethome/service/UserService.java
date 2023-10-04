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

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
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

		@Autowired
		private JavaMailSenderImpl mailSender;
		private int authNumber; 
		// 난수 발생
		
			public void makeRandomNumber() {
				// 난수의 범위 111111 ~ 999999 (6자리 난수)
				Random r = new Random();
				int checkNum = r.nextInt(888888) + 111111;
				System.out.println("인증번호 : " + checkNum);
				authNumber = checkNum;
			}
			
			
					//이메일 보낼 양식! 
			public String joinEmail(String email) {
				makeRandomNumber();
				String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력 
				String toMail = email;
				String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목 
				String content = 
						"sweethome을 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
		                "<br><br>" + 
					    "인증 번호는 " + authNumber + "입니다." + 
					    "<br>" + 
					    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
				mailSend(setFrom, toMail, title, content);
				return Integer.toString(authNumber);
			}
			
			//이메일 전송 메소드
			public void mailSend(String setFrom, String toMail, String title, String content) { 
				MimeMessage message = mailSender.createMimeMessage();
				// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
				try {
					MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
					helper.setFrom(setFrom);
					helper.setTo(toMail);
					helper.setSubject(title);
					// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
					helper.setText(content,true);
					mailSender.send(message);
				} catch (MessagingException e) {
					e.printStackTrace();
				}
			}
}