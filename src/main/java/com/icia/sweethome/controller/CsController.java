package com.icia.sweethome.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.icia.sweethome.model.Answer;
import com.icia.sweethome.model.Cs;
import com.icia.sweethome.model.CsMain;
import com.icia.sweethome.model.Paging;
import com.icia.sweethome.model.Question;
import com.icia.sweethome.model.Response;
import com.icia.sweethome.model.User;
import com.icia.sweethome.service.CsService;
import com.icia.sweethome.service.UserService;
import com.icia.sweethome.util.CookieUtil;
import com.icia.sweethome.util.FileData;
import com.icia.sweethome.util.FileUtil;
import com.icia.sweethome.util.HttpUtil;
import com.icia.sweethome.util.StringUtil;


@Controller("csController")
public class CsController {
	private static Logger logger = LoggerFactory.getLogger(Cs.class);

	// 쿠키명
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;

	// 파일 저장 경로
	@Value("#{env['upload.save.dir']}")
	private String UPLOAD_SAVE_DIR;

	@Autowired
	private CsService csService;

	@Autowired
	private UserService userService;
	private static final int LIST_COUNT = 5; // 한 페이지의 게시물 수
	private static final int PAGE_COUNT = 5; // 페이징 수
	
	public void loginChack(HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('로그인이 필요합니다');");
        out.println("location.href = '/user/loginPage'; </script>");
        out.flush();
	}
	  @RequestMapping(value = "/cs/customerservice")
	  public String customerservice(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException
	  {
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		User user = userService.userSelect(cookieUserId);
		
		if(cookieUserId == null || user==null) {
			loginChack(response);
			return "redirect:/";
		}
		model.addAttribute("user", user);
	  
		  return "/cs/customerservice"; 
	  }
	  

//공지사항
	@RequestMapping(value = "/cs/announce")
	public String list(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		// 조회항목(1:제목, 2:내용)
		String searchType = HttpUtil.get(request, "searchType", "");
		// 조회값
		String searchValue = HttpUtil.get(request, "searchValue", "");
		// 현재 페이지
		int curPage = HttpUtil.get(request, "curPage", (int) 1); //all int -> int
		// 게시물 리스트
		List<Cs> list = null;
		// 조회 객체
		Cs search = new Cs();
		// 총 게시물 수
		int totalCount = 0;
		// 페이징 객체
		Paging paging = null;

		if (!StringUtil.isEmpty(searchType) && !StringUtil.isEmpty(searchValue)) {
			search.setSearchType(searchType);
			search.setSearchValue(searchValue);
		}

		totalCount = csService.boardListCount(search);

		logger.debug("============================");
		logger.debug("totalCount : " + totalCount);
		logger.debug("============================");

		if (totalCount > 0) {
			paging = new Paging("/cs/announce", (int)totalCount, LIST_COUNT, PAGE_COUNT, (int)curPage, "curPage");

			search.setStartRow(paging.getStartRow());
			search.setEndRow(paging.getEndRow());

			list = csService.boardList(search);
		}

		model.addAttribute("list", list);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("curPage", curPage);
		model.addAttribute("paging", paging);

		return "/cs/announce";
	}

	// 고객센터 메인
	@RequestMapping(value = "/cs/csmain")
	public String csmain(ModelMap model, HttpServletRequest request, HttpServletResponse response) 
	{
		// 게시물 리스트
		List<CsMain> list = null;
		//카테고리
		String faqCategory = HttpUtil.get(request, "faqCategory", "");
		
		
		
		CsMain search = new CsMain();
		search.setFaqCategory(faqCategory);
		
		list = csService.csMainList(search);
		
		model.addAttribute("list", list);
		model.addAttribute("faqCategory", faqCategory);
		return "/cs/csmain";
	}

	

	
	//게시물 등록(aJax)
		@RequestMapping(value="/cs/writeProc", method=RequestMethod.POST)
		@ResponseBody
		public Response<Object> writeProc(MultipartHttpServletRequest request, HttpServletResponse response)
		{
			Response<Object> ajaxResponse = new Response<Object>();
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			String questionTitle = HttpUtil.get(request, "questionTitle", "");
			String questionContent = HttpUtil.get(request, "questionContent", "");
			String questionCategory = HttpUtil.get(request, "questionCategory", "");
			Question question = new Question();

			int questionSeq = csService.questionSeq();
			question.setQuestionIdk(questionSeq);
			 // 예시로 사용한 값
			
		    FileData fileData = HttpUtil.getFile(request, "profilePicture", UPLOAD_SAVE_DIR + "\\question", String.valueOf(questionSeq));

			if(!StringUtil.isEmpty(questionTitle) && !StringUtil.isEmpty(questionContent))
			{
				
				question.setUserId(cookieUserId);
				question.setQuestionTitle(questionTitle);
				question.setQuestionContent(questionContent);
				question.setQuestionCategory(questionCategory);
				
				if(fileData != null && fileData.getFileSize() > 0)
				{
					question.setFileCheck("Y");
					question.setFileExt(fileData.getFileExt());
				}
				else
				{
					question.setFileCheck("N");
				}
				//서비스 호출
				try
				{
					if(csService.boardInsert(question) > 0)
					{
						
						ajaxResponse.setResponse(0, "success");
					}
					else
					{
						ajaxResponse.setResponse(500, "Internal server error");
					}
				}
				catch(Exception e)
				{
					logger.error("[HiBoardController] writeProc Exception", e);
					ajaxResponse.setResponse(500, "internal server error");
				}
			}
			else
			{
				ajaxResponse.setResponse(400, "Bad Request");
			}
			
			return ajaxResponse;
		}
		@RequestMapping(value = "/cs/inquirylist")
		  public String inquirylist(Model model, HttpServletRequest request, HttpServletResponse response) 
		  {
			// 현재 페이지
			int curPage = HttpUtil.get(request, "curPage", (int)1); //all int -> int
			// 게시물 리스트
			List<Question> list = null;
			// 조회 객체
			Question search = new Question();
			// 총 게시물 수
			int totalCount = 0;
			// 페이징 객체
			Paging paging = null;

			totalCount = csService.boardListCount2(search);

			logger.debug("============================");
			logger.debug("totalCount : " + totalCount);
			logger.debug("============================");

			if (totalCount > 0) {
				paging = new Paging("/cs/inquirylist", (int)totalCount, LIST_COUNT, PAGE_COUNT, (int)curPage, "curPage");

				search.setStartRow(paging.getStartRow());
				search.setEndRow(paging.getEndRow());

				list = csService.boardList2(search);
			}
			

			model.addAttribute("list", list);
			model.addAttribute("curPage", curPage);
			model.addAttribute("paging", paging);
		  
		  return "/cs/inquirylist"; 
		  }

		//공지사항 게시물 조회
		@RequestMapping(value="/cs/announceDetail") 
		public String announceDetail(ModelMap model, HttpServletRequest request, HttpServletResponse response)throws IOException
		{
			//쿠키 값
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			User user = userService.userSelect(cookieUserId);

			if(cookieUserId == null || user==null) {
				loginChack(response);
				return "redirect:/";
			}
			//게시물 번호
			int noticeIdk = HttpUtil.get(request, "noticeIdk", (int)0);
			//조회항목(1:작성자, 2:제목, 3:내용)
			String searchType = HttpUtil.get(request, "searchType", "");
			//조회값
			String searchValue = HttpUtil.get(request, "searchValue", "");
			//현재 페이지
			int curPage = HttpUtil.get(request, "curPage", (int)1);
			//본인글 여부
			String boardMe = "N";
			
			Cs cs = null;
			
			if(noticeIdk > 0)
			{
				cs = csService.boardView(noticeIdk);
				
				/*
				 * if(cs != null && StringUtil.equals(cs.getUserId(), cookieUserId)) { boardMe =
				 * "Y"; }
				 */
			}
			//model.addAttribute("boardMe", boardMe);
			model.addAttribute("noticeIdk", noticeIdk);
			model.addAttribute("cs", cs);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchValue", searchValue);
			model.addAttribute("curPage", curPage);
			
			return "/cs/announceDetail";
		}
		//1:1질문 게시물 조회
		@RequestMapping(value="/cs/inquirylistDetail")
		public String inquirylistDetail(ModelMap model, HttpServletRequest request, HttpServletResponse response)throws IOException
		{
			
			//쿠키 값
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			//게시물 번호
			int questionIdk = HttpUtil.get(request, "questionIdk", (int)0);
			//조회항목(1:작성자, 2:제목, 3:내용)
			String searchType = HttpUtil.get(request, "searchType", "");
			//조회값
			String searchValue = HttpUtil.get(request, "searchValue", "");
			//현재 페이지
			int curPage = HttpUtil.get(request, "curPage", (int)1);
			//본인글 여부
			User user = userService.userSelect(cookieUserId);
		
			String boardMe = "N";
			if(cookieUserId == null || user==null) {
				loginChack(response);
				return "redirect:/";
			}
			Question question = null;
			Answer answer = null;
			if(questionIdk > 0)
			{
				question = csService.inquirylistView(questionIdk);
						
				
				 if(question != null && StringUtil.equals(question.getUserId(), cookieUserId)) 
				 { 
					 boardMe = "Y"; 
				 }
				 if(question.getAnsStatus().equals("Y"))
				{
					answer = csService.answerSelect(questionIdk);
				}

				 
			}
			
			
			model.addAttribute("boardMe", boardMe);
			model.addAttribute("questionIdk", questionIdk);
			model.addAttribute("counsel", question);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchValue", searchValue);
			model.addAttribute("curPage", curPage);
			model.addAttribute("answer", answer);
			
			return "/cs/inquirylistDetail";
		    }
		
		//1:1질문 게시물 수정 화면
		@RequestMapping(value="/cs/inquiryUpdate")
		public String updateForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
		{
			//쿠키 값
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			//게시물번호
			int questionIdk = HttpUtil.get(request, "questionIdk", (int)0);
			//조회항목
			String searchType = HttpUtil.get(request, "searchType", "");
			//조회값
			String searchValue = HttpUtil.get(request, "searchValue", "");
			//현재페이지
			int curPage = HttpUtil.get(request, "curPage", (int)1);
			
			Question question = null;
			User user = null;
			
			
			
			 if(questionIdk > 0) 
			 {
				 question = csService.boardViewUpdate(questionIdk);
				 if(question != null)
				 {
					 if(StringUtil.equals(question.getUserId(), cookieUserId))
					 {
						user = userService.userSelect(cookieUserId); 
					 }
					 else
					 {
						 question = null;
					 }
				 }
			 }
			model.addAttribute("searchType",searchType);
			model.addAttribute("searchValue",searchValue);
			model.addAttribute("curPage", curPage);
			model.addAttribute("question", question);
			model.addAttribute("user", user);
			return "/cs/inquiryUpdate";
		}
		
		//게시물 수정
		@RequestMapping(value="/cs/updateProc", method=RequestMethod.POST)
		@ResponseBody
		public Response<Object> updateProc(MultipartHttpServletRequest request, HttpServletResponse response)
		{
			Response<Object> ajaxResponse = new Response<Object>();
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			int questionIdk = HttpUtil.get(request, "questionIdk", (int)0);
			String questionTitle = HttpUtil.get(request, "questionTitle", "");
			String questionContent = HttpUtil.get(request, "questionContent", "");
		    String fileDeleteCheck = HttpUtil.get(request, "fileDeleteCheck", "N");

			 // 예시로 사용한 값
			Question question = csService.inquirylistView(questionIdk);

		   // FileData fileData = HttpUtil.getFile(request, "profilePicture", UPLOAD_SAVE_DIR + "\\question", String.valueOf(questionIdk));
			
			if(questionIdk > 0 && !StringUtil.isEmpty(questionTitle) && !StringUtil.isEmpty(questionContent))
			{
				
				if(StringUtil.equals(question.getFileCheck(), "Y") && StringUtil.equals(fileDeleteCheck, "Y"))
				   {
					   logger.debug("===================================");
					   logger.debug("파일 삭제 여부 확인");
					   logger.debug("===================================");
						FileUtil.deleteFile(UPLOAD_SAVE_DIR +"\\question\\"+ question.getQuestionIdk()+ "." + question.getFileExt());
				   }
				    FileData fileData = HttpUtil.getFile(request, "profilePicture", UPLOAD_SAVE_DIR + "\\question", String.valueOf(questionIdk));

				if(question != null)
				{
					
					if(StringUtil.equals(question.getUserId(), cookieUserId))
					{
						question.setQuestionTitle(questionTitle);
						question.setQuestionContent(questionContent);
						   if(fileData != null && fileData.getFileSize() > 0)
						   {
							   question.setFileCheck("Y");
							   question.setFileExt(fileData.getFileExt());

						   }
						   else
						   {
							   if(!(StringUtil.equals(question.getFileCheck(), "Y") && StringUtil.equals(fileDeleteCheck, "N")))
							   {
								   question.setFileCheck("N");
								   question.setFileExt("");
							   }
						   }
						
						try
						{
							if(csService.boardUpdate(question) > 0)
							{
								ajaxResponse.setResponse(0, "success");	
		
							}
							else
							{
								ajaxResponse.setResponse(500, "internal server error2222");								
							}
						}
						catch(Exception e)
						{
							logger.error("[HiBoardController] updateProc Exception", e);
							ajaxResponse.setResponse(500, "internal server error");	

						}
					}
					else
					{
						ajaxResponse.setResponse(403, "Bad request");	
					}
				}
				else
				{
					ajaxResponse.setResponse(404, "not found");		
				}
			}
			else
			{
				ajaxResponse.setResponse(400, "Bad request");
			}
			return ajaxResponse;
		}
		
		//게시물 삭제
		@RequestMapping(value="/cs/inquirylistdelete", method=RequestMethod.POST)
		@ResponseBody
		public Response<Object> delete(HttpServletRequest request, HttpServletResponse response)
		{
			Response<Object> ajaxResponse = new Response<Object>();
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			int questionIdk = HttpUtil.get(request, "questionIdk", (int)0);
			
			if(questionIdk > 0)
			{
				Question question = csService.inquirylistView(questionIdk);
				
				if(question != null)
				{
					if(StringUtil.equals(question.getUserId(), cookieUserId))
					{
						try
						{
							if(question.getAnsStatus() == "Y")
							{
								//답글이 있으면 삭제 못하도록 
								ajaxResponse.setResponse(-999, "answers exist and cannot be deleted");
							}
							else
							{
								if(csService.boardDelete(questionIdk)> 0)
								{
									ajaxResponse.setResponse(0, "success");
								}
								else
								{
									ajaxResponse.setResponse(500, "server error222");
								}
							}
						}
						catch(Exception e)
						{
							logger.error("[HiBoardController] delete Exception", e);
							ajaxResponse.setResponse(500, "server error");
						}
					}
					else
					{
						//내 게시글이 아닐경우
						ajaxResponse.setResponse(403, "server error");
					}
				}
				else
				{
					ajaxResponse.setResponse(404, "not found");		
				}
			}
			else
			{
				ajaxResponse.setResponse(400, "bad Reqiest");
			}
			
			return ajaxResponse;
		}
		//게시물 답변 화면
		@RequestMapping(value="/cs/inquiryReply", method=RequestMethod.POST)
		public String replyForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
		{
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			int questionIdk = HttpUtil.get(request, "questionIdk", (int)0);
			String searchType = HttpUtil.get(request, "searchType", "");
			String searchValue = HttpUtil.get(request, "searchValue", "");
			int curPage = HttpUtil.get(request, "curPage", (int)1);
			
			Question question = null;
			User user = null;
			
			if(questionIdk > 0)
			{
				question = csService.inquirylistView(questionIdk);
				
				if(question != null)
				{
					user = userService.userSelect(cookieUserId);
				}
			}
			model.addAttribute("searchType",searchType);
			model.addAttribute("searchValue", searchValue);
			model.addAttribute("curPage", curPage);
			model.addAttribute("question",question);
			model.addAttribute("user", user);
			
			return "/cs/inquiryReply";
		}
		
		//게시물 답변
		@RequestMapping(value="/cs/replyProc", method=RequestMethod.POST)
		@ResponseBody
		public Response<Object> replyProc(MultipartHttpServletRequest request, HttpServletResponse response)
		{
			
			Response<Object> ajaxResponse = new Response<Object>();
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			int questionIdk = HttpUtil.get(request, "questionIdk", (int)0);
			String ansTitle = HttpUtil.get(request, "ansTitle","");
			String ansContent = HttpUtil.get(request, "ansContent", "");
			
			
			if(questionIdk > 0 && !StringUtil.isEmpty(ansTitle) && !StringUtil.isEmpty(ansContent))
			{
				Question question = csService.inquirylistView(questionIdk);
				if(question != null)
				{
					Answer answer = new Answer();
					
					
					answer.setAnsTitle(ansTitle);
					answer.setAnsContent(ansContent);
					answer.setQuestionIdk(question.getQuestionIdk());
					
					
					try
					{
						if(csService.boardReplyInsert(answer) > 0)
						{
							ajaxResponse.setResponse(0, "success");
							csService.statusUpdate(question);
						}
						else
						{
							ajaxResponse.setResponse(500, "internal server error2222222");		
						}
					}
					catch(Exception e)
					{
						logger.error("[HiBoardController] replyProc Exception", e);
						ajaxResponse.setResponse(500, "internal server error");
					}
				}
				else
				{
					//부모글이 없을때
					ajaxResponse.setResponse(404, "not found");
				}
			}
			else
			{
				ajaxResponse.setResponse(400, "bad request");
				
			}
			return ajaxResponse;
			
		}

}
