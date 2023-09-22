package com.icia.sweethome.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.icia.sweethome.util.FileUtil;
import com.icia.sweethome.util.StringUtil;
import com.icia.sweethome.dao.CommunityDao;
import com.icia.sweethome.model.Comment;
import com.icia.sweethome.model.Community;

@Service("communityService")
public class CommunityService 
{
	private static Logger logger = LoggerFactory.getLogger(CommunityService.class);
	   
   @Autowired
   private CommunityDao communityDao;	
   
   //파일 저장 경로
   @Value("#{env['upload.save.dir.community']}")
   private String UPLOAD_SAVE_DIR_COMMUNITY;      //커뮤니티 저장 경로  
   
   	
   //높은 좋아요 순으로 게시물 조회
   public List<Community> boardListByLikes(String commuTab)
   {	
	   List<Community> list = null;
	   
	   try
	   {
		   list = communityDao.boardListByLikes(commuTab);
	   }
	   catch(Exception e)
	   {
		   logger.error("[communityService] boardListByLikes Exception", e);
	   }
	   
	   return list;
   }
   
   //높은 조회수 순으로 게시물 조회
   public List<Community> boardListByViews(String commuTab)
   {	
	   List<Community> list = null;
	   
	   try
	   {
		   list = communityDao.boardListByViews(commuTab);
	   }
	   catch(Exception e)
	   {
		   logger.error("[communityService] boardListByViews Exception", e);
	   }
	   
	   return list;
   }
   
   
   //월간 높은 좋아요 순으로 게시물 조회
   public List<Community> boardListByMonth(String commuTab)
   {	
	   List<Community> list = null;
	   
	   try
	   {
		   list = communityDao.boardListByMonth(commuTab);
	   }
	   catch(Exception e)
	   {
		   logger.error("[communityService] boardListByMonth Exception", e);
	   }
	   
	   return list;
   }
   

   //총 게시물 수 조회
   public int boardListCount(Community comuuBoard)
   {
	   int count = 0;
	   	   
	   try
	   {
		   count = communityDao.boardListCount(comuuBoard);
	   }
	   catch(Exception e)
	   {
		   logger.error("[communityService] boardListCount Exception", e);
	   }
	   
	   return count;
   }
   
   
   //게시판 조회
   public List<Community> boardList(Community comuuBoard)
   {
	   List<Community> list = null;
	   	   
	   try
	   {
		   list = communityDao.boardList(comuuBoard);
	   }
	   catch(Exception e)
	   {
		   logger.error("[communityService] boardList Exception", e);
	   }
	   
	   return list;
   }
   
   //게시물 보기(첨부파일 포함, 조회수 증가 포함)
   public Community boardView(int commuIdk)
   {
	   Community community = null;
      
      try
      {
    	  community = communityDao.boardSelect(commuIdk);
         
         if(community != null)
         {
            //조회수 증가
            communityDao.boardReadCntPlus(commuIdk);
         }
      }
      catch(Exception e)
      {
         logger.error("[CommunityService] boardView Exception", e);
      }
      
      return community;
   }
   
   //댓글 조회
   public List<Comment> commentList(int commuIdk)
   {
	   List<Comment> list = null;
	   	   
	   try
	   {
		   list = communityDao.commentList(commuIdk);
		   
	   }
	   catch(Exception e)
	   {
          logger.error("[CommunityService] commentView Exception", e);
		   
	   }
	   
	   return list;
   }
   
   //댓글 등록
   public int commentInsert(Comment comment)
   {  
      
      int count = 0;
      
      try
      {
      
    	  count = communityDao.commentInsert(comment); 
      }
      catch(Exception e)
      {
         logger.error("[CommunityService] commentInsert Exception", e);
      }
      
      return count;
   }    
   
   
   //게시물 조회
   public Community boardSelect(int commuIdk)
   {
      Community community = null;
      
      try
      {
         community = communityDao.boardSelect(commuIdk);
      }
      catch(Exception e)
      {
         logger.error("[CommunityService] boardSelect Exception", e);
      }
   
      return community;
   }
   
   
   
   //게시물 삭제(댓글이 있으면 함께 삭제)
   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
   public int boardDelete(int commuIdk) throws Exception
   {
	   int count = 0;
	   
	   Community community = communityDao.boardSelect(commuIdk);
	   
	   if(community != null)
	   {
		   try
		   {
			   count = communityDao.boardDelete(commuIdk);
			   
			   //댓글 삭제
			   communityDao.commentDeleteWhenBoardDelete(commuIdk);
			   
			   //좋아요 테이블에서 삭제
			   communityDao.likesDeleteWhenBoardDelete(commuIdk);
			   
			   //스크랩 테이블에서 삭제
			   communityDao.scrapDeleteWhenBoardDelete(commuIdk);
			   
		   }
		   
		   catch(Exception e)
		   {
			   
		       logger.error("[CommunityService] boardDelete Exception", e);

		   }
	   }
	   
	   
	   if(StringUtil.equals(community.getFileCheck(), "Y"))
	   {
		   try
		   {
			   FileUtil.deleteFile(UPLOAD_SAVE_DIR_COMMUNITY + community.getCommuIdk() + "." + community.getFileExt());
		   }
		   catch(Exception e)
		   {
		       logger.error("[FileUtil] deleteFile Exception", e);
		   }
		   
	   }
	   
	   return count;
   }
   
   //게시판 등록
   public int boardInsert(Community community) throws Exception   
   {  
      int count = 0;
      
      try
      {
          count = communityDao.boardInsert(community); 
      }
      catch(Exception e)
      {
          logger.error("[CommunityService] boardInsert Exception", e);      
      }
      
      
      return count;
   }   
   
   //글 시퀀스 가져오기
   public int communitySeq()
   {
      int count = 0;
      
      try
      {
         count = communityDao.communitySeq();
      }
      catch(Exception e)
      {
         logger.error("[CommunityService] communitySeq Exception", e);      

      }
      
      return count;
   }
   
   //댓글 시퀀스 가져오기
   public int commentSeq()
   {
	   int count = 0;
	   try
	   {
		   count = communityDao.commentSeq();
	   }
	   catch(Exception e)
	   {
	         logger.error("[CommunityService] commentSeq Exception", e);      
	   }
	   
	   return count;
   }
   
   //게시물 수정
   public int boardUpdate(Community community)
   {
      int count = 0;
      
      try
      {
         count = communityDao.boardUpdate(community);
      }
      catch(Exception e)
      {
         logger.error("[CommunityService] boardUpdate Exception", e);      

      }
      
      return count;
   }  
   
   //댓글 삭제
   public int commentDelete(Comment deleteComment)
   {
	   int count = 0;
	   	   
       try
       {
    	   count = communityDao.commentDelete(deleteComment);
       }
       catch(Exception e)
       {
          logger.error("[CommunityService] commentDelete Exception", e);      
       }	   
	   

	   
	   return count;
   }     
   
   
   //댓글 조회
   public Comment commentSelect(int commentIdk)
   {
	   Comment comment = null;
	   
	   try
	   {
		   comment = communityDao.commentSelect(commentIdk);
		   
	   }
	   catch(Exception e)
	   {
	          logger.error("[CommunityService] commentSelect Exception", e);      
	   }
	   
	   return comment;
   }   
   
   //댓글 수정
   public int commentUpdate(Comment comment)
   {	   
	   int count = 0;
	   
	   try
	   {
		   count = communityDao.commentUpdate(comment);
	   }
	   catch(Exception e)
	   {
	          logger.error("[CommunityService] commentUpdate Exception", e);      
	   }
	   
	   return count;
   }
   
   //상세 게시물 조회 시 나의 좋아요 여부
   public int boardViewMyLikes(Community community)
   {
	   int count = 0;
	   
	   try
	   {
		   count = communityDao.boardViewMyLikes(community);
		   
	   }
	   catch(Exception e)
	   {
	          logger.error("[CommunityService] boardViewMyLikes Exception", e);      
	   }
	   
	   return count;
   }
   
   //상세 게시물 조회 시 나의 스크랩 여부
   public int boardViewMyScrap(Community community)
   {
	   int count = 0;
	   
	   try
	   {
		   count = communityDao.boardViewMyScrap(community);
	   }
	   catch(Exception e)
	   {
	          logger.error("[CommunityService] boardViewMyScrap Exception", e);      
	   }
	   
	   return count;
   }
   
   //좋아요 테이블에 인서트 및 좋아요 증가
   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
   public int likesInsert(Community community)
   {
	   int count = 0;
	   
	   int likesCntPlus = community.getCommuIdk();
	   
	   try
	   {
		   count = communityDao.likesInsert(community);
		   
		   if(count > 0)
		   {
			   communityDao.boardLikesCntPlus(likesCntPlus);
		   }
		   
		   
	   }
	   catch(Exception e)
	   {
	          logger.error("[CommunityService] likesInsert Exception", e);      
	   }
	   
	   return count;	   
   }
   
   //스크랩 테이블에 인서트
   public int scrapInsert(Community community)
   {
	   int count = 0;
	   
	   try
	   {
		   count = communityDao.scrapInsert(community);
	   }
	   catch(Exception e)
	   {
	          logger.error("[CommunityService] scrapInsert Exception", e);      
	   }
	   
	   return count;	   
   }   
   
   //좋아요 테이블에서 딜리트 및 좋아요 감소
   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
   public int likesDelete(Community community)
   {
	   int count = 0;
	   
	   int likesCntDelete = community.getCommuIdk();

	   
	   try
	   {
		   count = communityDao.likesDelete(community);
		   
		   if(count > 0)
		   {
			   communityDao.boardLikesCntMinus(likesCntDelete);
		   }
		   
	   }
	   catch(Exception e)
	   {
	          logger.error("[CommunityService] likesDelete Exception", e);      
	   }
	   
	   return count;	   
	   
   }   
   
   //스크랩 테이블에서 딜리트
   public int scrapDelete(Community community)
   {
	   int count = 0;
	   
	   try
	   {
		   count = communityDao.scrapDelete(community);
	   }
	   catch(Exception e)
	   {
	          logger.error("[CommunityService] ScrapDelete Exception", e);      
	   }
	   
	   return count;	   
   }   
   
   //임시 저장 테이블에서 조회
   public Community saveSelect(String userId)
   {
	   Community community = null;
	   
	   try
	   {
		   community = communityDao.saveSelect(userId);
	   }
	   catch(Exception e)
	   {
	          logger.error("[CommunityService] saveSelect Exception", e);      
	   }
	   
	   return community;
   }
   
   //임시 저장 테이블에 인서트
   public int saveInsert(Community community)
   {
	   int count = 0;
	   
	   try
	   {
		   count = communityDao.saveInsert(community);
	   }
	   catch(Exception e)
	   {
	          logger.error("[CommunityService] saveInsert Exception", e);      
	   }	 
	   
	   return count;
   }
   
   //임시 저장 테이블에서 딜리트
   public int saveDelete(String userId)
   {
	   int count = 0;
	   
	   try
	   {
		   count = communityDao.saveDelete(userId);
	   }
	   catch(Exception e)
	   {
	          logger.error("[CommunityService] saveDelete Exception", e);      
	   }
	   
	   return count;
   }
   

   
   
   
   
   
   
   // 위 인호 아래 하나
   
   //마이페이지의 내 게시물 
   public List<Community> boardMyList(Community comuuBoard)
   {
	   List<Community> list = null;
	   	   
	   try
	   {
		   list = communityDao.boardMyList(comuuBoard);
	   }
	   catch(Exception e)
	   {
		   logger.error("[communityService] boardMyList Exception", e);
	   }
	   
	   return list;
   }   
   
	public int boardMyListCount(Community community)
	{
		int count = 0;
		
		try
		{
			count = communityDao.boardMyListCount(community);
		}
		catch(Exception e)
		{
			logger.error("[communityService] boardMyListCount Exception", e);
		}
		
		return count;
	}
   
   //마이페이지의 내 스크랩
	public List<Community> boardMyScrap(Community comuuBoard)
	{
		List<Community> list = null;
		   	   
		try
		{
			list = communityDao.boardMyScrap(comuuBoard);
		}
		catch(Exception e)
		{
			logger.error("[communityService] boardMyScrap Exception", e);
		}
		   
		return list;
	}  
   
	//마이페이지의 내 스크랩 전체건수 조회
	public int boardMyScrapCount(Community community)
	{
		int count = 0;
		
		try
		{
			count = communityDao.boardMyScrapCount(community);
		}
		catch(Exception e)
		{
			logger.error("[communityService] boardMyScrapCount Exception", e);
		}
		
		return count;
	}
	
	//게시물 삭제(첨부파일이 있으면 함께 삭제)

	public int boardMyDelete(int commuIdk)
	{
		int count = 0;
			
			
		try
		{
			count = communityDao.boardMyDelete(commuIdk);
		}
		catch(Exception e)
		{
			logger.error("[communityService] boardMyDelete Exception", e);
		}
			
		return count;
	}
	
	
	   
		// 마이페이지에서 내 스크랩 존재 여부 확인 0913 윤하나 
		public int boardMyScrapSearch(int commuIdk)
		{
			int count = 0;
				
				
			try
			{
				count = communityDao.boardMyScrapSearch(commuIdk);
			}
			catch(Exception e)
			{
				logger.error("[communityService] boardMyScrapSearch Exception", e);
			}
				
			return count;
		}
		
		// 마이페이지에서 내 스크랩 삭제 0913 윤하나 
		public int boardMyScrapDelete(int commuIdk)
		{
			int count = 0;
				
				
			try
			{
				count = communityDao.boardMyScrapDelete(commuIdk);
			}
			catch(Exception e)
			{
				logger.error("[communityService] boardMyScrapDelete Exception", e);
			}
				
			return count;
		}
		

		//마이페이지의 라이크 건수 조회 0913 윤하나
			public int boardMyLikesCount(Community community)
			{
				int count = 0;
				
				try
				{
					count = communityDao.boardMyLikesCount(community);
				}
				catch(Exception e)
				{
					logger.error("[communityService] boardMyLikesCount Exception", e);
				}
				
				return count;
			}
			
		 //마이페이지의 내 좋아요 0913 윤하나
			public List<Community> boardMyLikes(Community community)
			{
				List<Community> list = null;
				   	   
				try
				{
					list = communityDao.boardMyLikes(community);
				}
				catch(Exception e)
				{
					logger.error("[communityService] boardMyLikes Exception", e);
				}
				   
				return list;
			}  
			
			// 마이페이지에서 내 좋아요 존재 여부 확인 0913 윤하나 
			public int boardMyLikesSearch(int commuIdk)
			{
				int count = 0;
					
				try
				{
					count = communityDao.boardMyLikesSearch(commuIdk);
				}
				catch(Exception e)
				{
					logger.error("[communityService] boardMyLikesSearch Exception", e);
				}
					
				return count;
			}
			
			// 마이페이지에서 내 스크랩 삭제 0913 윤하나 
			public int boardMyLikesDelete(int commuIdk)
			{
				int count = 0;
						
				try
				{
					count = communityDao.boardMyLikesDelete(commuIdk);
				}
				catch(Exception e)
				{
					logger.error("[communityService] boardMyLikesDelete Exception", e);
				}
					
				return count;
			}   
			
			
			//마이페이지 게시물 선택삭제

			public int mySelectDelete(int commuIdk)
			{
				int count = 0;
					
					
				try
				{
					count = communityDao.mySelectDelete(commuIdk);
				}
				catch(Exception e)
				{
					logger.error("[communityService] mySelectDelete Exception", e);
				}
					
				return count;
			}
			// 마이페이지에서 내 스크랩 선택삭제 0920 윤하나 
			public int myScrapSelectDelete(int commuIdk)
			{
				int count = 0;
						
				try
				{
					count = communityDao.myScrapSelectDelete(commuIdk);
				}
				catch(Exception e)
				{
					logger.error("[communityService] myScrapSelectDelete Exception", e);
				}
					
				return count;
			}   
			
			
			//마이페이지 내 좋아요 선택삭제

			public int myLikesSelectDelete(int commuIdk)
			{
				int count = 0;
					
					
				try
				{
					count = communityDao.myLikesSelectDelete(commuIdk);
				}
				catch(Exception e)
				{
					logger.error("[communityService] myLikesSelectDelete Exception", e);
				}
					
				return count;
			}			
}
   

