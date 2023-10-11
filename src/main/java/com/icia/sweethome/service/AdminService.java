package com.icia.sweethome.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.icia.sweethome.dao.AdminDao;
import com.icia.sweethome.dao.UserDao;
import com.icia.sweethome.model.Admin;
import com.icia.sweethome.model.Comment;
import com.icia.sweethome.model.Community;
import com.icia.sweethome.model.Cs;
import com.icia.sweethome.model.Question;
import com.icia.sweethome.model.User;


@Service("adminService")
public class AdminService
{
   private static Logger logger = LoggerFactory.getLogger(UserService.class);
   
   /**
    * @Autowired : IoC컨테이너 안에 존재하는 Bean을 자동으로 주입한다.
    */
   @Autowired
   private AdminDao adminDao;
   
   public Admin adminSelect(String userId)
   {
      Admin admin = null;
      
      try
      {
         admin = adminDao.adminSelect(userId);
      }
      catch(Exception e)
      {
         logger.error("[AdminService] adminSelect Exception", e);
      }
      
      return admin;
   }
   
//관리자 커뮤니티
//======================================================================================
   
   //제목, 회원, 상태로 게시글 조회
   public List<Community> adminBoardSelect(Community community)
   {
     List<Community> list = null;
      
      try
      {
         list = adminDao.adminBoardSelect(community);
      }
      catch(Exception e)
      {
         logger.error("[AdminService] adminBoardSelect Exception", e);
      }
      
      return list;
   }   
   
   //내용, 회원, 상태로 댓글 조회
   public List<Comment> adminCommentSelect(Comment comment)
   {
     List<Comment> list = null;
      
      try
      {
         list = adminDao.adminCommentSelect(comment);
      }
      catch(Exception e)
      {
         logger.error("[AdminService] adminCommentSelect Exception", e);
      }
      
      return list;
   }  
   
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int boardStatusUpdate(int commuIdk) {
		
	    int count = adminDao.boardStatusUpdate(commuIdk);
	    return count;
	}   
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int commentStatusUpdate(int commentIdk) {
		
	    int count = adminDao.commentStatusUpdate(commentIdk);
	    return count;
	}     
   
   

   
   
   
//관리자 고객센터   
//======================================================================================
   public List<User> userList(User user) {
	    List<User> list = null;
	    
	    try {
	        list = adminDao.userList(user);
	        
	    }
	    catch (Exception e) {
	        logger.error("[ShopService] shopList Exception", e);
	    }
	    
	    return list;
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int userStatusUpdate(User user) {
	    int count = adminDao.userStatusUpdate(user);
	    return count;
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int isDeleted(User user) {
	    int count = adminDao.isDeleted(user);
	    return count;
	}
	
	public Question questionSelect(String userId)
	   {
		Question question = null;
	      
	      try
	      {
	    	  question = adminDao.questionSelect(userId);
	      }
	      catch(Exception e)
	      {
	         logger.error("[UserService] userSelect Exception", e);
	      }
	      
	      return question;
	   }
	
	   
	public List<Question> userQuestion(Question userId)
	{
	    List<Question> user = null;
	    
	    try
	    {
	        user = adminDao.userQuestion(userId);
	    }
	    catch(Exception e)
	    {
	        logger.error("[AdminService] adminSelect Exception", e);
	    }
	    
	    return user;
	}
	//게시판 등록
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public int noticeInsert(Cs cs) throws Exception
	{	//Propagation.REQUIRED : 트랜젝션이 있으면 그 트랜젝선에서 실행,
		//없으면 새로운 트랜젝션을 실행(기본설정)
		int count = 0;
		count = adminDao.noticeInsert(cs);

		return count;
	}

	//공지사항 삭제
	public int noticeDelete(Cs cs)
	{  
		int count = 0;

		try
		{
			count =  adminDao.noticeDelete(cs);
		}
		catch(Exception e)
		{
			logger.error("[ShopService]cartDelete Exception", e);
		}

		return count;

	}
	
	public int totalplace() {
		return adminDao.totalplace();
	}
}