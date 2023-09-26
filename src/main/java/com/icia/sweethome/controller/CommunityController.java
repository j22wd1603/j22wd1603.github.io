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

import com.icia.sweethome.model.Comment;
import com.icia.sweethome.model.Community;
import com.icia.sweethome.model.Paging;
import com.icia.sweethome.model.Response;
import com.icia.sweethome.model.User;
import com.icia.sweethome.service.CommunityService;
import com.icia.sweethome.service.UserService;
import com.icia.sweethome.util.CookieUtil;
import com.icia.sweethome.util.FileData;
import com.icia.sweethome.util.FileUtil;
import com.icia.sweethome.util.HttpUtil;
import com.icia.sweethome.util.JsonUtil;
import com.icia.sweethome.util.StringUtil;


@Controller("communityController")
public class CommunityController {
	private static Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Autowired
	private CommunityService communityService;
	
    @Autowired
    private UserService userService;	
    
   
    //파일 저장 경로 ㅎㅎ
    @Value("#{env['upload.save.dir.community']}")
    private String UPLOAD_SAVE_DIR_COMMUNITY;      //커뮤니티 저장 경로
    
    
    private static final int LIST_COUNT = 12;   //한 페이지의 게시물 수
    private static final int PAGE_COUNT = 5;   //페이징 수	
    
    //쿠키명
    @Value("#{env['auth.cookie.name']}")
    private String AUTH_COOKIE_NAME;	   
	
	//메인 커뮤니티 페이지
	@RequestMapping(value = "/community/blog")
	public String blog(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		
	    //쿠키 값
	    String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
	    
	    
		List<Community> list1 = null; 	// 마이룸 조회
		List<Community> list2 = null; 	// 자유게시판 조회
		List<Community> list3 = null;	// 질문게시판 조회
		
		list1 = communityService.boardListByLikes("1");	//1.마이룸 2.자유게시판 3.질문게시판
		list2 = communityService.boardListByLikes("2");	//1.마이룸 2.자유게시판 3.질문게시판
		list3 = communityService.boardListByViews("3");	//1.마이룸 2.자유게시판 3.질문게시판
		
		
		for(int i = 0; i < list1.size(); i++)
		{
			logger.debug("list getCommuTitle [" + i + "] : " + list1.get(i).getCommuTitle());
			logger.debug("list regDate [" + i + "] : " + list1.get(i).getRegDate());
			logger.debug("list userId [" + i + "] : " + list1.get(i).getUserId());
		}
        
		model.addAttribute("cookieUserId", cookieUserId);
        model.addAttribute("list1", list1);
        model.addAttribute("list2", list2);
        model.addAttribute("list3", list3);
		
        
		return "/community/blog";
	}
	
	//마이룸 커뮤니티 페이지
	@RequestMapping(value = "/community/myroom")
	public String myroom(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		
	    //쿠키 값
	    String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);		
		//조회항목(1.작성자, 2.제목, 3.내용)
	    String searchType = HttpUtil.get(request, "searchType", "");
	    //조회값
	    String searchValue = HttpUtil.get(request, "searchValue", "");
		//정렬항목(1.최신순, 2.과거순, 3.인기순)
	    String sortType = HttpUtil.get(request, "sortType", "");	 
	    //게시물 리스트
	    List<Community> list = null;
	    //월간 베스트 리스트
		List<Community> listByMonthlyLikes = null;
	    //조회 객체
	    Community search = new Community();
	    //총 게시물 수
        int totalCount = 0;
	    //커뮤탭(1.마이룸, 2.자유게시판, 3.질문게시판)
        search.setCommuTab("1");
        //커뮤탭 가져오기
        String commuTab = search.getCommuTab();
        //현재 페이지
        int curPage = HttpUtil.get(request, "curPage", 1);
        //페이징 객체
        Paging paging = null; 

	    if(!StringUtil.isEmpty(searchType) && !StringUtil.isEmpty(searchValue))
	    {
	       search.setSearchType(searchType);
	       search.setSearchValue(searchValue);
	    }
	    
	    if(!StringUtil.isEmpty(sortType))
	    {
	    	search.setSortType(sortType);
	    }
	       
	    totalCount = communityService.boardListCount(search);
	       
	    if(totalCount > 0)
	    {
            paging = new Paging("/board/community", (int)totalCount, LIST_COUNT, PAGE_COUNT, (int)curPage, "curPage");
            search.setStartRow(paging.getStartRow());
            search.setEndRow(paging.getEndRow());
	    	
	    	list = communityService.boardList(search);
	    }
	    			
	    listByMonthlyLikes = communityService.boardListByMonth("1");	// 1. 마이룸
        
	    model.addAttribute("commuTab", commuTab);
        model.addAttribute("list", list);        
        model.addAttribute("listByMonthlyLikes", listByMonthlyLikes);
        model.addAttribute("sortType", sortType);        
        model.addAttribute("searchType", searchType);        
        model.addAttribute("searchValue", searchValue);    
        model.addAttribute("curPage", curPage);        
        model.addAttribute("paging", paging);        
        model.addAttribute("cookieUserId", cookieUserId);

		return "/community/myroom";
	}		
	
	
	//자유게시판 페이지
	@RequestMapping(value = "/community/free")
	public String free(Model model, HttpServletRequest request, HttpServletResponse response) {
		
	    //쿠키 값
	    String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);		
		//조회항목(1.작성자, 2.제목, 3.내용)
	    String searchType = HttpUtil.get(request, "searchType", "");
	    //조회값
	    String searchValue = HttpUtil.get(request, "searchValue", "");
		//정렬항목(1.최신순, 2.과거순, 3.인기순)
	    String sortType = HttpUtil.get(request, "sortType", "");	 
	    //게시물 리스트
	    List<Community> list = null;
	    //월간 베스트 리스트
		List<Community> listByMonthlyLikes = null;
	    //조회 객체
	    Community search = new Community();
	    //총 게시물 수
        int totalCount = 0;
	    //커뮤탭(1.마이룸, 2.자유게시판, 3.질문게시판)
        search.setCommuTab("2");
        //커뮤탭 가져오기
        String commuTab = search.getCommuTab();
        //현재 페이지
        int curPage = HttpUtil.get(request, "curPage", 1);
        //페이징 객체
        Paging paging = null; 

	    if(!StringUtil.isEmpty(searchType) && !StringUtil.isEmpty(searchValue))
	    {
	       search.setSearchType(searchType);
	       search.setSearchValue(searchValue);
	    }
	    
	    if(!StringUtil.isEmpty(sortType))
	    {
	    	search.setSortType(sortType);
	    }
	       
	    totalCount = communityService.boardListCount(search);
	       
	    if(totalCount > 0)
	    {
            paging = new Paging("/board/community", (int)totalCount, LIST_COUNT, PAGE_COUNT, (int)curPage, "curPage");
            search.setStartRow(paging.getStartRow());
            search.setEndRow(paging.getEndRow());
	    	
	    	list = communityService.boardList(search);
	    }
	    			
	    listByMonthlyLikes = communityService.boardListByMonth("2");	// 2. 자유게시판
        
	    model.addAttribute("commuTab", commuTab);
        model.addAttribute("list", list);        
        model.addAttribute("listByMonthlyLikes", listByMonthlyLikes);
        model.addAttribute("sortType", sortType);        
        model.addAttribute("searchType", searchType);        
        model.addAttribute("searchValue", searchValue);    
        model.addAttribute("curPage", curPage);        
        model.addAttribute("paging", paging);        
        model.addAttribute("cookieUserId", cookieUserId);
          

		return "/community/free";
	}
	
	//질문게시판 페이지
	@RequestMapping(value = "/community/ask")
	public String ask(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		
	    //쿠키 값
	    String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);		
		//조회항목(1.작성자, 2.제목, 3.내용)
	    String searchType = HttpUtil.get(request, "searchType", "");
	    //조회값
	    String searchValue = HttpUtil.get(request, "searchValue", "");
		//정렬항목(1.최신순, 2.과거순, 3.인기순)
	    String sortType = HttpUtil.get(request, "sortType", "");	 
	    //게시물 리스트
	    List<Community> list = null;
	    //가장 많이 본 질문글 리스트
		List<Community> listByMonthlyViews = null;
	    //조회 객체
	    Community search = new Community();
	    //총 게시물 수
        int totalCount = 0;
	    //커뮤탭(1.마이룸, 2.자유게시판, 3.질문게시판)
        search.setCommuTab("3");
        //커뮤탭 가져오기
        String commuTab = search.getCommuTab();
        //현재 페이지
        int curPage = HttpUtil.get(request, "curPage", 1);
        //페이징 객체
        Paging paging = null; 

	    if(!StringUtil.isEmpty(searchType) && !StringUtil.isEmpty(searchValue))
	    {
	       search.setSearchType(searchType);
	       search.setSearchValue(searchValue);
	    }
	    
	    if(!StringUtil.isEmpty(sortType))
	    {
	    	search.setSortType(sortType);
	    }
	       
	    totalCount = communityService.boardListCount(search);
	       
	    if(totalCount > 0)
	    {
            paging = new Paging("/board/community", (int)totalCount, LIST_COUNT, PAGE_COUNT, (int)curPage, "curPage");
            search.setStartRow(paging.getStartRow());
            search.setEndRow(paging.getEndRow());
	    	
	    	list = communityService.boardList(search);
	    }
	    			
	    listByMonthlyViews = communityService.boardListByMonth("3");	// 3. 질문게시판
        
	    model.addAttribute("commuTab", commuTab);
        model.addAttribute("list", list);        
        model.addAttribute("listByMonthlyViews", listByMonthlyViews);
        model.addAttribute("sortType", sortType);        
        model.addAttribute("searchType", searchType);        
        model.addAttribute("searchValue", searchValue);    
        model.addAttribute("curPage", curPage);        
        model.addAttribute("paging", paging);        
        model.addAttribute("cookieUserId", cookieUserId);
          
        
        
		return "/community/ask";
	}
	
	@RequestMapping(value = "/community/writeForm")
	public String writeForm(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException{
		
      //쿠키값
      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);	
      	
		//조회항목(1.작성자, 2.제목, 3.내용)
		String searchType = HttpUtil.get(request, "searchType", "");
		//조회 값
		String searchValue = HttpUtil.get(request, "searchValue", "");
		//현재 페이지
		int curPage = HttpUtil.get(request, "curPage", 1);
		//정렬타입(1.최신순, 2.과거순, 3.인기순)
		String sortType = HttpUtil.get(request, "sortType", "");
		//임시저장 조회 객체
		Community community = new Community();
		//커뮤탭
		String commuTab = HttpUtil.get(request, "commuTab", "");
		


		
      //쿠키값 조회해서 없으면 /user/loginPage로 보내기
      if(cookieUserId == "")
      {
    	  response.setContentType("text/html; charset=UTF-8");
    	  PrintWriter out = response.getWriter();
    	  out.println("<script>alert('로그인이 필요합니다'); location.href='" + "/user/loginPage" + "';</script>");
    	  out.flush();    	  
      }
      
      //사용자 정보 조회
      User user = userService.userSelect(cookieUserId);
      //임시저장 정보 조회
      community = communityService.saveSelect(user.getUserId());

      
      if(community != null)
      {
    	  //기존 임시저장 테이블의 글 삭제
    	  communityService.saveDelete(cookieUserId);
    	  
    	  model.addAttribute("community", community);
      }      
      
      model.addAttribute("commuTab", commuTab);
      model.addAttribute("user", user);
      model.addAttribute("searchType", searchType);
      model.addAttribute("searchValue", searchValue);
      model.addAttribute("curPage", curPage);
      model.addAttribute("sortType", sortType);
      

		return "/community/writeForm";
	}	
	
	//게시물 조회
	@RequestMapping(value = "/community/view")
	public String view(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		
	    //쿠키 값
	    String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);		
		//게시물 번호
		int commuIdk = HttpUtil.get(request, "commuIdk", 0);
		//조회항목(1.작성자, 2.제목, 3.내용)
		String searchType = HttpUtil.get(request, "searchType", "");
		//조회 값
		String searchValue = HttpUtil.get(request, "searchValue", "");
		//현재 페이지
		int curPage = HttpUtil.get(request, "curPage", 1);
		//정렬타입(1.최신순, 2.과거순, 3.인기순)
		String sortType = HttpUtil.get(request, "sortType", "");
		//본인글 여부
		String boardMe = "N";
		//쿠키 유저 아이디로 유저조회
	    User user = userService.userSelect(cookieUserId);
	    //커뮤탭 리다이렉트주소
	    String redirectUrl = "";
		//게시물에 대한 유저 테이블 조회
	    User boardUser = null;


	    if(user != null)
	    {
		    //유저 당 게시물에 대한 좋아요 및 스크랩 조회 객체
		    Community likesOrScrap = new Community();	    
		    
	    	likesOrScrap.setCommuIdk(commuIdk);
	    	likesOrScrap.setUserId(user.getUserId());
	    	
	    	//유저 당 게시물에 대한 좋아요 존재 여부
	    	int userLikes = communityService.boardViewMyLikes(likesOrScrap);
	    	
	    	//유저 당 게시물에 대한 스크랩 존재 여부
	    	int userScrap = communityService.boardViewMyScrap(likesOrScrap);

	    	model.addAttribute("userLikes", userLikes);
	    	
	    	model.addAttribute("userScrap", userScrap);

	    }
	    
		
		Community community = null;
		
	    List<Comment> commentList = null;
		
		if(commuIdk > 0)
		{
			//게시물에 대한 조회
			community = communityService.boardView(commuIdk);
			
			//게시물에 대한 유저 테이블 조회
			boardUser = userService.userSelect(community.getUserId());
			
			//댓글에 대한 조회
			commentList = communityService.commentList(commuIdk);
			
	        if(community != null && StringUtil.equals(community.getUserId(), cookieUserId))
			{
				boardMe = "Y";
			}
		}
		if(StringUtil.equals(community.getCommuTab(), "1"))
		{
			redirectUrl = "/community/myroom";
		}
		else if(StringUtil.equals(community.getCommuTab(), "2"))
		{
			redirectUrl = "/community/free";
		}
		else if(StringUtil.equals(community.getCommuTab(), "3"))
		{
			redirectUrl = "/community/ask";
		}
		
		model.addAttribute("boardUser", boardUser);
		model.addAttribute("redirectUrl", redirectUrl);
		model.addAttribute("cookieUserId", cookieUserId);
		model.addAttribute("commentList", commentList);
		model.addAttribute("commuIdk", commuIdk);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("curPage", curPage);
		model.addAttribute("sortType", sortType);
		model.addAttribute("boardMe", boardMe);
		model.addAttribute("community", community);

		return "/community/view";
	}		
	
	
	   //게시물 삭제
	   @RequestMapping(value="/community/delete", method=RequestMethod.POST)
	   @ResponseBody
	   public Response<Object> delete(HttpServletRequest request, HttpServletResponse response)
	   {
		   Response<Object> ajaxResponse = new Response<Object>();
		   String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		   int commuIdk = HttpUtil.get(request, "commuIdk", 0);
		   
		   if(commuIdk > 0)
		   {
			   Community community = communityService.boardSelect(commuIdk);
			   
			   if(community != null)
			   {
				   if(StringUtil.equals(community.getUserId(), cookieUserId))
				   {
					   try
					   {
							   if(communityService.boardDelete(commuIdk) > 0)
							   {

								   ajaxResponse.setResponse(0, "success");
							   }
							   else
							   {
								   ajaxResponse.setResponse(500, "server error222");
							   }
					   }
					   catch(Exception e)
					   {
						   logger.error("[CommunityController] delete Exception", e);
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
			   ajaxResponse.setResponse(400, "bad Request");
		   }
		   
		   return ajaxResponse;
	   }
	   
	   //게시물 등록(aJax)
	   @RequestMapping(value="/community/writeProc", method=RequestMethod.POST)
	   @ResponseBody
	   public Response<Object> writeProc(MultipartHttpServletRequest request, HttpServletResponse response)
	   {
	      Response<Object> ajaxResponse = new Response<Object>();
	      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
	      String communityTitle = HttpUtil.get(request, "communityTitle", "");
	      String communityContent = HttpUtil.get(request, "communityContent", "");
	      String commuTab = HttpUtil.get(request, "commuTab", "");
	      
          Community community = new Community();
	      
	      int communitySeq = communityService.communitySeq();
	      
	      community.setCommuIdk(communitySeq);

	      FileData communityFile = HttpUtil.getFile(request, "communityFile", UPLOAD_SAVE_DIR_COMMUNITY , String.valueOf(communitySeq));
	            
	      if(!StringUtil.isEmpty(communityTitle) && !StringUtil.isEmpty(communityContent))
	      {	         
	         community.setUserId(cookieUserId);
	         community.setCommuTitle(communityTitle);
	         community.setCommuContent(communityContent);
	         community.setCommuTab(commuTab);
	         
             if(communityFile != null && communityFile.getFileSize() > 0)
             {
            	 community.setFileCheck("Y");
            	 community.setFileExt(communityFile.getFileExt());
             }
             else
             {
            	 community.setFileCheck("N");
             }	         

	         //서비스 호출
	         try
	         {
	            if(communityService.boardInsert(community) > 0)
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
	            logger.error("[CommunityController] writeProc Exception", e);
	            ajaxResponse.setResponse(500, "internal server error");
	         }
	      }
	      else
	      {
	         ajaxResponse.setResponse(400, "Bad Request");
	      }
	      

	      
	      return ajaxResponse;
	   }	
	   
	   
	   //게시물 업데이트
		@RequestMapping(value = "/community/updateForm")
		public String updateForm(Model model, HttpServletRequest request, HttpServletResponse response) {
			
	      //쿠키값
	      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);	
	      	
			//조회항목(1.작성자, 2.제목, 3.내용)
			String searchType = HttpUtil.get(request, "searchType", "");
			//조회 값
			String searchValue = HttpUtil.get(request, "searchValue", "");
			//현재 페이지
			int curPage = HttpUtil.get(request, "curPage", 0);
			//정렬타입(1.최신순, 2.과거순, 3.인기순)
			String sortType = HttpUtil.get(request, "sortType", "");
			//게시글 번호
			int commuIdk = HttpUtil.get(request, "commuIdk", 0);
			

	      //쿠키값 조회해서 없으면 /user/loginPage로 보내기
	      if(cookieUserId == "")
	      {
	    	    return "/user/loginPage";
	      }
	      
	      
	      //사용자 정보 조회
	      User user = userService.userSelect(cookieUserId);
	      //글번호를 통해 게시물 내용 조회
	      Community community = communityService.boardSelect(commuIdk);
	      
	      
		   if(StringUtil.equals(community.getUserId(), cookieUserId))
		   {
			   user = userService.userSelect(cookieUserId);
		   }
		   else
		   {
			   community = null;
		   }	      
	      
	      
	      model.addAttribute("community", community);
	      model.addAttribute("user", user);
	      model.addAttribute("searchType", searchType);
	      model.addAttribute("searchValue", searchValue);
	      model.addAttribute("curPage", curPage);
	      model.addAttribute("sortType", sortType);
	      
			
			return "/community/updateForm";
		}		
		
		//게시물 수정
		   @RequestMapping(value="/community/updateProc", method=RequestMethod.POST)
		   @ResponseBody
		   public Response<Object> updateProc(MultipartHttpServletRequest request, HttpServletResponse response)
		   {
			   Response<Object> ajaxResponse = new Response<Object>();
			   String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		       String communityTitle = HttpUtil.get(request, "communityTitle", "");
		       String communityContent = HttpUtil.get(request, "communityContent", "");
		       String commuTab = HttpUtil.get(request, "commuTab", "");
		       String commuIdk = HttpUtil.get(request, "commuIdk", "");
		       String fileDeleteCheck = HttpUtil.get(request, "fileDeleteCheck", "N");
		       
		       
			   Community community = communityService.boardSelect(Integer.valueOf(commuIdk));
			   
			   if(Integer.valueOf(commuIdk) > 0 && !StringUtil.isEmpty(communityTitle) && !StringUtil.isEmpty(communityContent))
			   {
				   if(StringUtil.equals(community.getFileCheck(), "Y") && StringUtil.equals(fileDeleteCheck, "Y"))
				   {
					   FileUtil.deleteFile(UPLOAD_SAVE_DIR_COMMUNITY + community.getCommuIdk() + "." + community.getFileExt());
				   }
				   
				   
				   FileData communityFile = HttpUtil.getFile(request, "communityFile", UPLOAD_SAVE_DIR_COMMUNITY , String.valueOf(commuIdk));
				   
				   if(community != null)
				   {
					   if(StringUtil.equals(community.getUserId(), cookieUserId))
					   {
						   community.setUserId(cookieUserId);
						   community.setCommuTab(commuTab);
						   community.setCommuTitle(communityTitle);
						   community.setCommuContent(communityContent);
						      
						   //수정하여 업로드하는 파일이 있는지 확인

						   if(communityFile != null && communityFile.getFileSize() > 0)
						   {
							   community.setFileCheck("Y");
							   community.setFileExt(communityFile.getFileExt());

						   }
						   else
						   {
							   if(!(StringUtil.equals(community.getFileCheck(), "Y") && StringUtil.equals(fileDeleteCheck, "N")))
							   {
								   community.setFileCheck("N");
								   community.setFileExt("");
							   }
						   }
						   

						   if(communityService.boardUpdate(community) > 0)
						   {
							   ajaxResponse.setResponse(0, "success");
						   }
						   else
						   {
							   ajaxResponse.setResponse(500, "internal server error222");
						   }

					   }
					   else
					   {
						   ajaxResponse.setResponse(403, "server error");
					   }
					   
				   }
			   }
			   else
			   {
				   ajaxResponse.setResponse(400, "Bad request");
			   }
			   
			   return ajaxResponse;
		   }	
		   
		   
		   
	   //댓글 등록
	   @RequestMapping(value="/community/commentProc", method=RequestMethod.POST)
	   @ResponseBody
	   public Response<Object> commentProc(HttpServletRequest request, HttpServletResponse response)
	   {	   
	      Response<Object> ajaxResponse = new Response<Object>();
	      
	      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
	      int commuIdk = HttpUtil.get(request, "commuIdk", 0);
	      int parentIdk = HttpUtil.get(request, "parentIdk", -1);
	      String commentContent = HttpUtil.get(request, "commentContent", "");
	      int commentIdk = HttpUtil.get(request, "commentIdk", 0);
	      	      
	      //사용자 정보 조회
	      User user = userService.userSelect(cookieUserId);
	      //글번호를 통해 게시물 내용 조회
	      Community community = communityService.boardSelect(commuIdk);
	      //댓글 등록 객체
	      Comment comment = new Comment();	      
	      //댓글 시퀀스 가져오기
	      int commentSeq = communityService.commentSeq();
	      
	      if(commentIdk != -1 && user != null && community != null && commuIdk != 0 && parentIdk != -1 && !StringUtil.isEmpty(commentContent))
	      {
	    	  
		      comment.setCommentIdk(commentSeq);
		      comment.setCommuIdk(commuIdk);
		      comment.setParentIdk(parentIdk);
		      comment.setCommentContent(commentContent);
		      comment.setUserId(cookieUserId);
		      comment.setGroupIdk(commentIdk);	   	
		      
	          if(communityService.commentInsert(comment) > 0)
	          {
	             ajaxResponse.setResponse(0, "success");
	          }
	          else
	          {
	             ajaxResponse.setResponse(500, "Internal server error");
	          }	
	             
	      }
	      else if(commentIdk == -1 && user != null && community != null && commuIdk != 0 && parentIdk != -1 && !StringUtil.isEmpty(commentContent))
	      {
	    	  
		      comment.setCommentIdk(commentSeq);
		      comment.setCommuIdk(commuIdk);
		      comment.setParentIdk(parentIdk);
		      comment.setCommentContent(commentContent);
		      comment.setUserId(cookieUserId);
		      comment.setGroupIdk(comment.getCommentIdk());	  
		      
		      
	          if(communityService.commentInsert(comment) > 0)
	          {
	             ajaxResponse.setResponse(0, "success");
	          }
	          else
	          {
	             ajaxResponse.setResponse(500, "Internal server error");
	          }			      
		    	  
		      }
	      else
	      {
		         ajaxResponse.setResponse(400, "Bad Request");
	      }
	      
	      
	      return ajaxResponse;
	   }
	   
	   
	   //댓글 삭제
	   @RequestMapping(value="/community/commentDelete", method=RequestMethod.POST)
	   @ResponseBody
	   public Response<Object> commentDelete(HttpServletRequest request, HttpServletResponse response)
	   {
		   Response<Object> ajaxResponse = new Response<Object>();
		   
		   String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		    
		   int commuIdk = HttpUtil.get(request, "commuIdk", 0);
		   		   
		   int commentIdk = HttpUtil.get(request, "commentIdk", 0);
		   
		   Comment comment = communityService.commentSelect(commentIdk);
		   
		   Comment deleteComment = new Comment();
		   
		   deleteComment.setParentIdk(comment.getParentIdk());
		   deleteComment.setCommentIdk(commentIdk);

		   int count = 0;

		   if(commentIdk > 0)
		   {
			   count = communityService.commentDelete(deleteComment);
			   
			   try
			   {
				   if(count > 0)
				   {
					   ajaxResponse.setResponse(0, "success");
				   }
				   else
				   {
					   ajaxResponse.setResponse(500, "server error");
				   }				   
			   }
			   catch(Exception e)
			   {
				   logger.error("[CommunityController] commentDelete Exception", e);
				   ajaxResponse.setResponse(500, "server error");				   
			   }
			   
		   }
		   else if(communityService.boardSelect(commuIdk) == null)
		   {
			   ajaxResponse.setResponse(404, "not found");
		   }
		   else if(StringUtil.equals(comment.getUserId(), cookieUserId))
		   {
			   ajaxResponse.setResponse(403, "server error");
		   }
		   else
		   {
			   ajaxResponse.setResponse(400, "bad Request");
		   }
		   
		   return ajaxResponse;
	   }	
	   
	   
	   //댓글 수정
	   @RequestMapping(value="/community/commentUpdate", method=RequestMethod.POST)
	   @ResponseBody
	   public Response<Object> commentUpdate(HttpServletRequest request, HttpServletResponse response)
	   {
		   Response<Object> ajaxResponse = new Response<Object>();
		   
		   String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		    
		   int commuIdk = HttpUtil.get(request, "commuIdk", 0);
		   		   
		   int commentIdk = HttpUtil.get(request, "commentIdk", 0);
		   
		   String commentUpdateContent = HttpUtil.get(request, "commentUpdateContent", "");
		   
		   Comment comment = communityService.commentSelect(commentIdk);
		   
		   Community community = communityService.boardSelect(commuIdk);
		   		   
		   
		   if(commentIdk == comment.getCommentIdk())
		   {
			   int count = 0;
			   
			   comment.setCommentIdk(commentIdk);
			   comment.setCommentContent(commentUpdateContent);
			   
			   count = communityService.commentUpdate(comment);
			   
			   try
			   {
				   if(count > 0)
				   {
					   ajaxResponse.setResponse(0, "success");
				   }
				   else
				   {
					   ajaxResponse.setResponse(500, "server error");
				   }				   
			   }
			   catch(Exception e)
			   {
				   logger.error("[CommunityController] commentUpdate Exception", e);
				   ajaxResponse.setResponse(500, "server error");					   
			   }
			   

		   }
		   else if(StringUtil.equals(comment.getUserId(), cookieUserId))
		   {
			   ajaxResponse.setResponse(403, "server error");
		   }
		   else if(community != null)
		   {
			   ajaxResponse.setResponse(404, "not found");
		   }
		   else
		   {
			   ajaxResponse.setResponse(400, "bad Request");
		   }
		   
		   
		   return ajaxResponse;
	   }		
	   
	   
	   //좋아요 테이블에 인서트 및 좋아요 증가
	   @RequestMapping(value="/community/likesInsert", method=RequestMethod.POST)
	   @ResponseBody
	   public Response<Object> likesInsert(HttpServletRequest request, HttpServletResponse response)
	   {
		   Response<Object> ajaxResponse = new Response<Object>();
		   
		   String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		    
		   int commuIdk = HttpUtil.get(request, "commuIdk", 0);
		   		   
		   //쿠키 유저 아이디로 유저조회
	       User user = userService.userSelect(cookieUserId);
	       
	       //게시글 번호로 게시글 조회
		   Community community = communityService.boardSelect(commuIdk);
		   
	       
	       if(user != null && community != null)
	       {
	    	   int count = 0;
	    	   
			   //인서트 객체
			   Community likesInsert = new Community();
			   
			   likesInsert.setUserId(cookieUserId);
			   likesInsert.setCommuIdk(commuIdk);
			   
			   count = communityService.likesInsert(likesInsert);
			   
			   try
			   {
				   if(count == 1)
				   {
					   ajaxResponse.setResponse(0, "success");
				   }
				   else
				   {
					   ajaxResponse.setResponse(400, "bad Request");
				   }
			   }
			   catch(Exception e)
			   {
				   logger.error("[CommunityController] likesInsert Exception", e);
			   }
	       }
	       else if(user != null)
	       {
			   ajaxResponse.setResponse(404, "not found");
	       }
	       else if(community != null)
	       {
			   ajaxResponse.setResponse(403, "server error");
	       }
	       else
	       {
			   ajaxResponse.setResponse(400, "bad Request");
	       }
		   
		   return ajaxResponse;
	   }
	   
	   //좋아요 테이블에서 딜리트 및 좋아요 감소
	   @RequestMapping(value="/community/likesDelete", method=RequestMethod.POST)
	   @ResponseBody
	   public Response<Object> likesDelete(HttpServletRequest request, HttpServletResponse response)
	   {
		   Response<Object> ajaxResponse = new Response<Object>();
		   
		   String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		    
		   int commuIdk = HttpUtil.get(request, "commuIdk", 0);
		   		   
		   //쿠키 유저 아이디로 유저조회
	       User user = userService.userSelect(cookieUserId);
	       
	       //게시글 번호로 게시글 조회
		   Community community = communityService.boardSelect(commuIdk);
		   
	       
	       if(user != null && community != null)
	       {
	    	   int count = 0;
	    	   
			   //인서트 객체
			   Community likesDelete = new Community();
			   
			   likesDelete.setUserId(cookieUserId);
			   likesDelete.setCommuIdk(commuIdk);
			   
			   count = communityService.likesDelete(likesDelete);
			   
			   try
			   {
				   if(count == 1)
				   {
					   ajaxResponse.setResponse(0, "success");
				   }
				   else
				   {
					   ajaxResponse.setResponse(400, "bad Request");
				   }
			   }
			   catch(Exception e)
			   {
				   logger.error("[CommunityController] likesDelete Exception", e);
			   }
	       }
	       else if(user != null)
	       {
			   ajaxResponse.setResponse(404, "not found");
	       }
	       else if(community != null)
	       {
			   ajaxResponse.setResponse(403, "server error");
	       }
	       else
	       {
			   ajaxResponse.setResponse(400, "bad Request");
	       }
		   
		   return ajaxResponse;
	   }
	   
	   //스크랩 테이블에 인서트
	   @RequestMapping(value="/community/scrapInsert", method=RequestMethod.POST)
	   @ResponseBody
	   public Response<Object> scrapInsert(HttpServletRequest request, HttpServletResponse response)
	   {
		   
		   Response<Object> ajaxResponse = new Response<Object>();
		   
		   String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		    
		   int commuIdk = HttpUtil.get(request, "commuIdk", 0);
		   		   
		   //쿠키 유저 아이디로 유저조회
	       User user = userService.userSelect(cookieUserId);
	       
	       //게시글 번호로 게시글 조회
		   Community community = communityService.boardSelect(commuIdk);
		   
	       
	       if(user != null && community != null)
	       {
	    	   int count = 0;
	    	   
			   //인서트 객체
			   Community scrapInsert = new Community();
			   
			   scrapInsert.setUserId(cookieUserId);
			   scrapInsert.setCommuIdk(commuIdk);
			   
			   
			   count = communityService.scrapInsert(scrapInsert);
			   
			   try
			   {
				   if(count == 1)
				   {
					   ajaxResponse.setResponse(0, "success");
				   }
				   else
				   {
					   ajaxResponse.setResponse(400, "bad Request");
				   }
			   }
			   catch(Exception e)
			   {
				   logger.error("[CommunityController] scrapInsert Exception", e);
			   }
	       }
	       else if(user != null)
	       {
			   ajaxResponse.setResponse(404, "not found");
	       }
	       else if(community != null)
	       {
			   ajaxResponse.setResponse(403, "server error");
	       }
	       else
	       {
			   ajaxResponse.setResponse(400, "bad Request");
	       }
		   
		   return ajaxResponse;		   

	   }	
	   
	   
	   
	   //스크랩 테이블에서 딜리트
	   @RequestMapping(value="/community/scrapDelete", method=RequestMethod.POST)
	   @ResponseBody
	   public Response<Object> scrapDelete(HttpServletRequest request, HttpServletResponse response)
	   {
		   Response<Object> ajaxResponse = new Response<Object>();
		   
		   String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		    
		   int commuIdk = HttpUtil.get(request, "commuIdk", 0);
		   		   
		   //쿠키 유저 아이디로 유저조회
	       User user = userService.userSelect(cookieUserId);
	       
	       //게시글 번호로 게시글 조회
		   Community community = communityService.boardSelect(commuIdk);
		   
	       
	       if(user != null && community != null)
	       {
	    	   int count = 0;
	    	   
			   //인서트 객체
			   Community scrapDelete = new Community();
			   
			   scrapDelete.setUserId(cookieUserId);
			   scrapDelete.setCommuIdk(commuIdk);
			   
			   
			   count = communityService.scrapDelete(scrapDelete);
			   
			   try
			   {
				   if(count == 1)
				   {
					   ajaxResponse.setResponse(0, "success");
				   }
				   else
				   {
					   ajaxResponse.setResponse(400, "bad Request");
				   }
			   }
			   catch(Exception e)
			   {
				   logger.error("[CommunityController] scrapDelete Exception", e);
			   }
	       }
	       else if(user != null)
	       {
			   ajaxResponse.setResponse(404, "not found");
	       }
	       else if(community != null)
	       {
			   ajaxResponse.setResponse(403, "server error");
	       }
	       else
	       {
			   ajaxResponse.setResponse(400, "bad Request");
	       }
		   
		   return ajaxResponse;			   
		   
	   }		 
	   
	   
	   //임시 저장 등록(aJax)
	   @RequestMapping(value="/community/saveProc", method=RequestMethod.POST)
	   @ResponseBody
	   public Response<Object> saveProc(HttpServletRequest request, HttpServletResponse response)
	   {
	      Response<Object> ajaxResponse = new Response<Object>();
	      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
	      String communityTitle = HttpUtil.get(request, "communityTitle", "");
	      String communityContent = HttpUtil.get(request, "communityContent", "");
	      String commuTab = HttpUtil.get(request, "commuTab", "");
	      
	      //임시저장 객체
          Community community = new Community();

          //기존 임시저장 조회
          Community search = communityService.saveSelect(cookieUserId);
          
	      if(search != null)
	      {
	    	  communityService.saveDelete(cookieUserId);
	    	  
	      }
	                
          if(!StringUtil.isEmpty(communityTitle) || !StringUtil.isEmpty(communityContent) || !StringUtil.isEmpty(commuTab))
          {
 	         community.setUserId(cookieUserId);
 	         community.setCommuTitle(communityTitle);
 	         community.setCommuContent(communityContent);
 	         community.setCommuTab(commuTab);    
 	         
 	        //서비스 호출 
        	try
        	{
        		if(communityService.saveInsert(community) > 0)
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
	            logger.error("[CommunityController] saveProc Exception", e);
        	}
          }
          else if(StringUtil.isEmpty(cookieUserId))
          {
              ajaxResponse.setResponse(404, "server error");
          }
          else
          {
 	         ajaxResponse.setResponse(400, "Bad Request");
          }
	      
	      return ajaxResponse;
	   }		   
 	   
	   // ================위 인호 아래 하나=========================
	   
	   
		 //마이페이지에서 내 게시물 선택삭제
		@RequestMapping(value="/community/mySelectDelete", method=RequestMethod.POST)
		@ResponseBody
		public Response<Object> mySelectDelete(HttpServletRequest request) {
			
			//String[] mySelectDelete = request.getParameterValues("valueArr");
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			Response<Object> ajaxResponse = new Response<Object>();
			String mySelectDelete = HttpUtil.get(request, "valueArr", "");
			int count = 0;
			
			Community info = null;
			
			//boardMyCommInfo
			
			if(mySelectDelete != null)
			{
			
//	 			int size = mySelectDelete.length;
//	 			for(int i=0; i<size; i++) {
//	 				communityService.mySelectDelete(mySelectDelete[i]);
//	 			}
	 			
	 			String[] result = mySelectDelete.split(",");
	 			
	 			if(result.length > 0)
	 			{
	 				info = new Community();
	 				
		 			for(int i = 0; i < result.length; i++)
		 			{
		 				logger.debug("i : [" + i + "] -> : " + result[i]);
		 				
		 				info.setUserId(cookieUserId);
		 				info.setCommuIdk(Integer.parseInt(result[i]));
		 				
		 				info = communityService.boardMyCommInfo(info);
		 				
		 				if(StringUtil.equals(info.getFileCheck(), "Y") && !StringUtil.isEmpty(info.getFileExt()))
		 				{
							FileUtil.deleteFile(UPLOAD_SAVE_DIR_COMMUNITY + 
									FileUtil.getFileSeparator() + (info.getCommuIdk() + "." +info.getFileExt()));
		 				}
		 				
		 				communityService.boardMyLikesDelete(info.getCommuIdk());
		 				communityService.myScrapSelectDelete(info.getCommuIdk());
		 				
		 				count = communityService.mySelectDelete(Integer.parseInt(result[i]));
		 			}
		 			
		 			
		 			if(count > 0)
		 			{
		 				ajaxResponse.setResponse(0, "success");
		 			}
		 			else
		 			{
		 				ajaxResponse.setResponse(500, "server error");
		 			}
	 			}
	 			else
	 			{
	 				ajaxResponse.setResponse(403, "bad Request");
	 			}
			
			}
			else
			{
				ajaxResponse.setResponse(400, "bad Request");
			}
			
			return ajaxResponse;
		}	   
	   
	   
	   
		//마이페이지에서 내 게시물 삭제
		@RequestMapping(value="/community/myDelete", method=RequestMethod.POST)
		@ResponseBody
		public Response<Object> myDelete(HttpServletRequest request, HttpServletResponse response)
		{
			Response<Object> ajaxResponse = new Response<Object>();
			int commuIdk = HttpUtil.get(request, "commuIdk", (int)0);
			Community info = null;
			
			logger.debug("=================================");
			logger.debug("board delete -> commuIdk : " + commuIdk);
			logger.debug("=================================");
			
			if(commuIdk > 0)
			{
				Community  comm = communityService.boardSelect(commuIdk);
				info = new Community();
				
				if(comm != null)
				{
					if(communityService.boardMyDelete(commuIdk) > 0)
					{
						if(StringUtil.equals(comm.getFileCheck(), "Y"))
						{
							FileUtil.deleteFile(UPLOAD_SAVE_DIR_COMMUNITY + comm.getCommuIdk() + "." + comm.getFileExt());
						}
						
						communityService.boardMyLikesDelete(info.getCommuIdk());
		 				communityService.myScrapSelectDelete(info.getCommuIdk());

						ajaxResponse.setResponse(0, "success");
					}
					else
					{
						ajaxResponse.setResponse(500, "not found");
					}
				}
				else
				{
					ajaxResponse.setResponse(404, "bad Request");
				}
			}
			else
			{
				ajaxResponse.setResponse(400, "bad Request");
			}
			
			return ajaxResponse;
		}
		
		
		//마이페이지에 있는 내 좋아요 삭제 0913 윤하나 
		@RequestMapping(value="/community/myLikesDelete", method=RequestMethod.POST)
		@ResponseBody
		public Response<Object> myLikesDelete(HttpServletRequest request, HttpServletResponse response)
				{
					int commuIdk = HttpUtil.get(request, "commuIdk", 0);
					Response<Object> ajaxResponse = new Response<Object>();
					Community info = null;
					
					logger.debug("==================================");
					logger.debug("commuIdk : " + commuIdk);
					logger.debug("==================================");
					
					if(!StringUtil.isEmpty(commuIdk))
					{
						int check = communityService.boardMyLikesSearch(commuIdk);
						
						if(check > 0)
						{
							info = new Community();
							
							if(communityService.boardMyLikesDelete(commuIdk) > 0)
							{
								
								communityService.boardMyLikesDelete(info.getCommuIdk());
								
								ajaxResponse.setResponse(0, "Success"); 
							}
							else
							{
								ajaxResponse.setResponse(-1, "Passwords do not match"); 
							}
						}
						else
						{
							logger.debug("해당 스크랩 정보가 존재하지 않음. ");
							ajaxResponse.setResponse(404, "Not Found"); 
						}
					}
					else
					{
						ajaxResponse.setResponse(400, "Bad Request");
						
					
					if(logger.isDebugEnabled())
					{
						logger.debug("[UserController] /user/myScrapDelete response\n" + JsonUtil.toJsonPretty(ajaxResponse));
					}
					
					}
					return ajaxResponse;
				}
		
		
		
		//마이페이지에 있는 내 좋아요 선택 삭제 0920 윤하나 
 		@RequestMapping(value="/community/myLikesSelectDelete", method=RequestMethod.POST)
 		@ResponseBody
 		public Response<Object> myLikesSelectDelete(HttpServletRequest request) {
 			
 			
 			Response<Object> ajaxResponse = new Response<Object>();
 			String myLikesSelectDelete = HttpUtil.get(request, "valueArr", "");
 			int count = 0;
 			
 			if(myLikesSelectDelete != null)
 			{
	 			String[] result = myLikesSelectDelete.split(",");
	 			
	 			if(result.length > 0)
	 			{
		 			for(int i = 0; i < result.length; i++)
		 			{
		 				logger.debug("i : [" + i + "] -> : " + result[i]);
		 				count = communityService.myLikesSelectDelete(Integer.parseInt(result[i]));
		 			}
		 			
		 			if(count > 0)
		 			{
		 				ajaxResponse.setResponse(0, "success");
		 			}
		 			else
		 			{
		 				ajaxResponse.setResponse(500, "server error");
		 			}
	 			}
	 			else
	 			{
	 				ajaxResponse.setResponse(403, "bad Request");
	 			}
 			
 			}
 			else
 			{
 				ajaxResponse.setResponse(400, "bad Request");
 			}
 			
 			return ajaxResponse;
 		}	
}
