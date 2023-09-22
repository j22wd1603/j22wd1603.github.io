package com.icia.sweethome.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.icia.sweethome.dao.CsDao;
import com.icia.sweethome.model.Question;
import com.icia.sweethome.util.FileUtil;
import com.icia.sweethome.model.Answer;
import com.icia.sweethome.model.Cs;
import com.icia.sweethome.model.CsMain;

@Service("csService")
public class CsService {
	//파일 저장 경로
	@Value("#{env['upload.save.dir']}")
	private String UPLOAD_SAVE_DIR;
	
	@Autowired
	private CsDao csDao;
	private static Logger logger = LoggerFactory.getLogger(CsService.class);
	//announce list
	public List<Cs> boardList(Cs cs)
	{
		List<Cs> list = null;
		
		try
		{
			list = csDao.boardList(cs);
		}
		catch(Exception e)
		{
			logger.error("[HiBoardService] boardList Exception", e);
		}
		
		return list;
	}
	//inquirylist
	public List<Question> boardList2(Question question)
	{
		List<Question> list = null;
		
		try
		{
			list = csDao.boardList2(question);
		}
		catch(Exception e)
		{
			logger.error("[HiBoardService] boardList Exception", e);
		}
		
		return list;
	}
	
	//총 게시물 수
	public int boardListCount(Cs cs)
	{
		int count = 0;
		
		try
		{
			count = csDao.boardListCount(cs);
		}
		catch(Exception e)
		{
			logger.error("[HiBoardService] boardListCount Exception", e);
		}
		
		return count;
	}
	public int boardListCount2(Question question)
	{
		int count = 0;
		
		try
		{
			count = csDao.boardListCount2(question);
		}
		catch(Exception e)
		{
			logger.error("[HiBoardService] boardListCount Exception", e);
		}
		
		return count;
	}
	
	public List<CsMain> csMainList(CsMain cs)
	{
		List<CsMain> list = null;
		
		try
		{
			list = csDao.csMainList(cs);
		}
		catch(Exception e)
		{
			logger.error("[HiBoardService] boardList Exception", e);
		}
		
		return list;
	}
	
	public int questionSeq()
	{
		int count = 0;
		try
		{
			count = csDao.questionSeq();
		}
		catch(Exception e)
		{
			logger.error("[HiBoardService] questionSeq Exception", e);		

		}
		
		return count;
	}
	
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public int boardInsert(Question question) throws Exception
	{	//Propagation.REQUIRED : 트랜젝션이 있으면 그 트랜젝선에서 실행,
		//없으면 새로운 트랜젝션을 실행(기본설정)
		int count = 0;
		count = csDao.boardInsert(question);
		

		return count;
	}
	//공지사항 게시물 보기(첨부파일 포함, 조회수 증가포함)
		public Cs boardView(int noticeIdk)
		{
			Cs cs = null;
			
			try
			{
				cs = csDao.boardSelect(noticeIdk);
				
			}
			catch(Exception e)
			{
				logger.error("[HiBoardService] boardView Exception", e);		
			}
			return cs;
		}
		//1:1질문 게시물 보기(첨부파일 포함, 조회수 증가포함)
		public Question inquirylistView(int questionIdk)
			{
				Question question = null;
					
			try
			{
				question = csDao.boardSelect2(questionIdk);
			}
			catch(Exception e)
			{
				logger.error("[HiBoardService] boardView Exception", e);		
			}
					return question;
			}
		//게시물 수정 폼 조회(첨부파일 포함)
		public Question boardViewUpdate(int questionIdk)
		{
			Question question = null;
			
			try
			{
				question = csDao.boardSelect2(questionIdk);
				
				
			}
			catch(Exception e)
			{
				logger.error("[HiBoardService] boardViewUpdate Exception", e);		
			}
			
			return question;
		}
		//게시물 수정
		@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
		public int boardUpdate(Question question) throws Exception
		{
			int count = csDao.boardUpdate(question);
			

			return count;
		}
		
		//게시물 삭제(첨부파일이 있으면 함께 삭제)
		@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
		public int boardDelete(int questionIdk) throws Exception
		{
			int count = 0;
			Question question = boardViewUpdate(questionIdk);
			
			if(question != null)
			{
				count = csDao.boardDelete(questionIdk);
				
				if(count > 0)
				{
					
					
					
					if ("Y".equals(question.getFileCheck()))
					{
						
					FileUtil.deleteFile(UPLOAD_SAVE_DIR +"\\question\\"+ question.getQuestionIdk()+ "." + question.getFileExt());
							
						
					}
				}
			}
			
			return count;
		}
		
		//게시물 답글 등록
		@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
		public int boardReplyInsert(Answer answer) throws Exception
		{
			int count = 0;
			
			count = csDao.boardReplyInsert(answer);
			
			return count;	
			
		
		}

		@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
		public int statusUpdate(Question question) throws Exception
		{
			int count = csDao.statusUpdate(question);
			

			return count;
		}
		//답변 게시물 보기(첨부파일 포함, 조회수 증가포함)
		public Answer answerSelect(int questionIdk)
		{
			Answer answer = null;
					
			try
			{
				answer = csDao.answerSelect(questionIdk);
						
			}
			catch(Exception e)
			{
				logger.error("[HiBoardService] boardView Exception", e);		
			}
					return answer;
			}
}
