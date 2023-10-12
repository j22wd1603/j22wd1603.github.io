package com.icia.sweethome.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.icia.sweethome.model.Admin;
import com.icia.sweethome.model.Answer;
import com.icia.sweethome.model.Comment;
import com.icia.sweethome.model.Community;
import com.icia.sweethome.model.Cs;
import com.icia.sweethome.model.Paging;
import com.icia.sweethome.model.Question;
import com.icia.sweethome.model.Response;
import com.icia.sweethome.model.Shop;
import com.icia.sweethome.model.User;
import com.icia.sweethome.service.AdminService;
import com.icia.sweethome.service.CommunityService;
import com.icia.sweethome.service.CsService;
import com.icia.sweethome.service.ShopService;
import com.icia.sweethome.service.UserService;
import com.icia.sweethome.util.CookieUtil;
import com.icia.sweethome.util.HttpUtil;
import com.icia.sweethome.util.JsonUtil;
import com.icia.sweethome.util.StringUtil;

@Controller("adminController")
public class AdminController {
	
	private static Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CsService csService;
    //쿠키명
    @Value("#{env['auth.cookie.name']}")
    private String AUTH_COOKIE_NAME;	 
    
    //어드민쿠키명
    @Value("#{env['auth.cookie.adminName']}")
    private String AUTH_COOKIE_ADMIN_NAME;	   	
    
	@Autowired
	private UserService userService;
	
	
	//관리자 메인페이지
	@GetMapping(value = "/admin/adminIndex")
	public String index()
	{
		return "/admin/adminIndex";
	}        
    
    
	//관리자 로그인 페이지
	@GetMapping(value = "/admin/main")
	public String main() {
		return "/admin/main";
	}
	
	@RequestMapping(value="/admin/login", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> login(HttpServletRequest request, HttpServletResponse response)
	{
		String adminId = HttpUtil.get(request, "adminId");
		String adminPwd = HttpUtil.get(request, "adminPwd");
		Response<Object> ajaxResponse = new Response<Object>();

		if(!StringUtil.isEmpty(adminId) && !StringUtil.isEmpty(adminPwd))
		{
			Admin admin = adminService.adminSelect(adminId);
			
			if(admin != null)
			{
				
				if(StringUtil.equals(admin.getAdminPwd(), adminPwd))
				{
					CookieUtil.addCookie(response, "/", -1, AUTH_COOKIE_ADMIN_NAME, CookieUtil.stringToHex(adminId));
					
					ajaxResponse.setResponse(0, "Success"); // 로그인 성공
				}
				else
				{
					ajaxResponse.setResponse(-1, "Passwords do not match"); // 비밀번호 불일치
				}
			}
			else
			{
				
				ajaxResponse.setResponse(404, "Not Found"); // 사용자 정보 없음 (Not Found)
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request"); // 파라미터가 올바르지 않음 (Bad Request)
		}
		
		if(logger.isDebugEnabled())
		{
			logger.debug("[AdminController] /admin/login response\n" + JsonUtil.toJsonPretty(ajaxResponse));
		}
		
		return ajaxResponse;
	}
	
	//로그아웃
	@RequestMapping(value="/admin/loginOut", method=RequestMethod.GET)
	public String loginOut(HttpServletRequest request, HttpServletResponse response)
	{
		if(com.icia.sweethome.util.CookieUtil.getCookie(request,AUTH_COOKIE_ADMIN_NAME) != null)
		{
			CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_ADMIN_NAME);
		}
			
		return "/admin/main";		//재접속하라는 명령(URL을 다시 가리킴)
	}		
	
//판매자
//=====================================================================================================================
		
		@RequestMapping(value = "/admin/adminDash")
		public String adminSeller(Model model) {
			
			System.out.println(adminService.monthTotals());
			
			model.addAttribute("monthTotals", adminService.monthTotals());
			model.addAttribute("total", adminService.totalplace());
			
			return "/admin/adminDash";
		}
	
//커뮤니티
//=====================================================================================================================
		
		@RequestMapping(value = "/admin/adminCommunity")
		public String communityList(Model model, HttpServletRequest request, HttpServletResponse response) {
			
			List<Community> boardList = null; 	// 게시글 리스트 객체
			List<Comment> commentList = null; 	// 댓글 리스트 객체
			
			Community boardSearch = new Community();
			Comment commentSearch = new Comment();
			
		    String searchType = HttpUtil.get(request, "searchType", "");
		    String searchValue = HttpUtil.get(request, "searchValue", "");
		    String userValue = HttpUtil.get(request, "userValue", "");
		    String status = HttpUtil.get(request, "status", "");
		    
		    //1이면 제목으로 게시글 조회
		    if(StringUtil.equals(searchType, "1"))
		    {
		    	boardSearch.setSearchType(searchType);
			    boardSearch.setCommuTitle(searchValue);
			    boardSearch.setUserId(userValue);	
			    boardSearch.setCommuStatus(status);		
			    
	    		boardList = adminService.adminBoardSelect(boardSearch);
	    		
			    model.addAttribute("boardList", boardList);
			    
		    }
		    //2이면 내용으로 댓글 조회
		    else if(StringUtil.equals(searchType, "2"))
		    {
		    	commentSearch.setSearchType(searchType);
	    		commentSearch.setCommentContent(searchValue);
	    		commentSearch.setUserId(userValue);
	    		commentSearch.setCommentStatus(status);		
	    		
	    		commentList = adminService.adminCommentSelect(commentSearch);
	    		
			    model.addAttribute("commentList", commentList);
		    }
		    //회원아이디와 상태를 이용하여 조회 할 때
		    else
		    {
		    	boardSearch.setUserId(userValue);
			    boardSearch.setCommuStatus(status);		
	    		commentSearch.setUserId(userValue);
	    		commentSearch.setCommentStatus(status);		
	    		
	    		boardList = adminService.adminBoardSelect(boardSearch);
	    		commentList = adminService.adminCommentSelect(commentSearch);	
	    		
	    		
			    model.addAttribute("boardList", boardList);
			    model.addAttribute("commentList", commentList);	    		
		    }


			
			return "/admin/adminCommunity";
		}
		
		//게시글 상태 업데이트
		@RequestMapping(value = "/admin/boardUpdate", method = RequestMethod.POST)//회원정지
		@ResponseBody
		public Response<Object> boardUpdate(HttpServletRequest request, HttpServletResponse response) {
		    Response<Object> ajaxResponse = new Response<Object>();
		    
        	
		    int commuIdk = HttpUtil.get(request, "commuIdk", 0);
		    String commuStatus = HttpUtil.get(request, "commuStatus", "");
		    
		    if(commuIdk != 0 && "Y".equals(commuStatus) || "N".equals(commuStatus))
		    {
		    	adminService.boardStatusUpdate(commuIdk);
		    	
		        ajaxResponse.setCode(0); // 성공

		    }
		    else
		    {
		        ajaxResponse.setCode(400); // 실패
		    }
		    

		    return ajaxResponse;
		}
		
		//게시글 상태 업데이트
		@RequestMapping(value = "/admin/commentUpdate", method = RequestMethod.POST)//회원정지
		@ResponseBody
		public Response<Object> commentUpdate(HttpServletRequest request, HttpServletResponse response) {
		    Response<Object> ajaxResponse = new Response<Object>();
		    
        	
		    int commentIdk = HttpUtil.get(request, "commentIdk", 0);
		    String commentStatus = HttpUtil.get(request, "commentStatus", "");
		    
		    
		    if(commentIdk != 0 && "Y".equals(commentStatus) || "N".equals(commentStatus))
		    {
		    	adminService.commentStatusUpdate(commentIdk);
		    	
		        ajaxResponse.setCode(0); // 성공

		    }
		    else
		    {
		        ajaxResponse.setCode(400); // 실패
		    }
		    

		    return ajaxResponse;
		}	
		

		
		
		

	
	
//고객센터
//=====================================================================================================================
	
		@RequestMapping(value = "/admin/adminUser")
		public String adminCs(Model model, HttpServletRequest request, HttpServletResponse response) {

			List<User> list = null;
			User user = new User();

			List<Cs> list2 = null;
			Cs search = new Cs();
			search.setStartRow(1);
			search.setEndRow(100);
			list2 = csService.boardList(search);
			list = adminService.userList(user);


			model.addAttribute("list2", list2);
			model.addAttribute("list",list);
			return "/admin/adminUser";
		}
		
		@RequestMapping(value = "/admin/userStatus", method = RequestMethod.POST)//회원정지
		@ResponseBody
		public Response<Object> status(HttpServletRequest request, HttpServletResponse response) {
		    Response<Object> ajaxResponse = new Response<Object>();

		    String userId = HttpUtil.get(request, "userId", "");
		    String userStatus = HttpUtil.get(request, "userStatus", "");
		    User user = userService.userSelect(userId);
		    if ("Y".equals(userStatus) || "D".equals(userStatus) ||"N".equals(userStatus)) {
		        adminService.userStatusUpdate(user);
		        ajaxResponse.setCode(0); // 성공 코드
		    } else {
		        ajaxResponse.setCode(400); // 파라미터 값이 올바르지 않음을 나타내는 코드
		    }

		    return ajaxResponse;
		}
		@RequestMapping(value = "/admin/adminCs")
		public String adminUser(ModelMap model, HttpServletRequest request, HttpServletResponse response)
		{
			
			Question question = new Question();
			String userId = HttpUtil.get(request, "userId", "");
			question.setUserId(userId);
			
			List<Question> list = null;
			list = adminService.userQuestion(question);
		    if (list != null) {
		        System.out.println("Received list with " + list.size() + " items.");
		    } else {
		        System.out.println("Received an empty list.");
		    }
			
			model.addAttribute("list", list);
			return "/admin/adminCs";
		}
		
	
		//1:1질문 게시물 조회
				@RequestMapping(value="/admin/adminAnswer")
				public String inquirylistDetail(ModelMap model, HttpServletRequest request, HttpServletResponse response)throws IOException
				{
					//게시물 번호
					int questionIdk = HttpUtil.get(request, "questionIdk", (int)0);
								//본인글 여부


					Question question = null;
					Answer answer = null;
					if(questionIdk > 0)
					{
						question = csService.inquirylistView(questionIdk);


						if(question.getAnsStatus().equals("Y"))
						{
							answer = csService.answerSelect(questionIdk);
						}

					}



					model.addAttribute("questionIdk", questionIdk);
					model.addAttribute("counsel", question);

					model.addAttribute("answer", answer);

					return "/admin/adminAnswer";
				}



				//1:1질문 게시물 답변
				@RequestMapping(value="/admin/adminReply")
				public String updateForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
				{
					//쿠키 값
					String adminId = CookieUtil.getHexValue(request, AUTH_COOKIE_ADMIN_NAME);
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
							
								Admin admin = adminService.adminSelect(adminId);
						}
							else
							{
								question = null;
							}
						
					}
					model.addAttribute("searchType",searchType);
					model.addAttribute("searchValue",searchValue);
					model.addAttribute("curPage", curPage);
					model.addAttribute("question", question);
					model.addAttribute("user", user);
					return "/admin/adminReply";
				}

				
				//게시물 답변
				@RequestMapping(value="/admin/replyProc", method=RequestMethod.POST)
				@ResponseBody
				public Response<Object> replyProc(MultipartHttpServletRequest request, HttpServletResponse response)
				{

					Response<Object> ajaxResponse = new Response<Object>();
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
				//공지사항 등록 폼
				@RequestMapping(value="/admin/noticeWrite")
				public String writeForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
				{
								
					return "/admin/noticeWrite";
				}

				//게시물 등록(aJax)
				@RequestMapping(value="/admin/noticeProc", method=RequestMethod.POST)
				@ResponseBody
				public Response<Object> noticeProc(MultipartHttpServletRequest request, HttpServletResponse response)
				{
					Response<Object> ajaxResponse = new Response<Object>();
					String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_ADMIN_NAME);
					String noticeTitle = HttpUtil.get(request, "noticeTitle", "");
					String noticeContent = HttpUtil.get(request, "noticeContent", "");
					
					if(!StringUtil.isEmpty(noticeTitle) && !StringUtil.isEmpty(noticeContent))
					{
						Cs cs = new Cs();
						
						cs.setAdminId(cookieUserId);
						cs.setNoticeTitle(noticeTitle);
						cs.setNoticeContent(noticeContent);
						
						
						//서비스 호출
						try
						{
							if(adminService.noticeInsert(cs) > 0)
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

				
				 @GetMapping("/admin/getNoticeDetail")
				    @ResponseBody
				    public ResponseEntity<Map<String, Object>> getNotice(@RequestParam("noticeIdk") int noticeIdk) {
				        Map<String, Object> response = new HashMap<>();

				        try {
				            // noticeIdk를 사용하여 공지사항 데이터를 가져옴
				            Cs cs = csService.boardView(noticeIdk);

				            if (cs != null) {
				                // 공지사항 데이터를 성공적으로 가져온 경우
				                response.put("success", true);
				                response.put("noticeTitle", cs.getNoticeTitle());
				                response.put("noticeContent", cs.getNoticeContent());
				            } else {
				                // 공지사항 데이터가 없는 경우
				                response.put("success", false);
				                response.put("message", "해당하는 공지사항이 없습니다.");
				            }
				        } catch (Exception e) {
				            // 에러가 발생한 경우
				            response.put("success", false);
				            response.put("message", "공지사항을 가져오는 중에 오류가 발생했습니다.");
				        }

				        return ResponseEntity.ok(response);
				    }
				 
				 
				 @RequestMapping(value = "/admin/noticeDelete", method = RequestMethod.POST)
					@ResponseBody
					public Response<Object> noticeDelete(HttpServletRequest request) {
					    Response<Object> ajaxResponse = new Response<Object>();
					   	
					    String noticeIdkList = HttpUtil.get(request, "noticeIdk", "");
					    String userId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
					    User user = userService.userSelect(userId);
					    Cs cs = null;
					    
					    int noticeIdk = 0;
					    int deleteCount = 0;

					    if (user != null) {
					    	String[] noticeList = noticeIdkList.split(",");   //코드가 ,로 잘려서 (선택하게 한개 이상이면 473,250이런식으로 되니까
					    	cs = new Cs();
					    	
					    	
					    	for(int i = 0; i < noticeList.length; i++)
					    	{
					    		noticeIdk = Integer.parseInt(noticeList[i]);
					    		cs.setNoticeIdk(noticeIdk);
					    		deleteCount += adminService.noticeDelete(cs);
					    	}
					    	
				            if (deleteCount == noticeList.length) {
				                ajaxResponse.setResponse(0, "상품이 삭제되었습니다.");
				            } 
				            else 
				            {
				                ajaxResponse.setResponse(500, "상품 삭제 중 오류가 발생했습니다.");
				            }
				            
					    } else {
					        ajaxResponse.setResponse(404, "사용자를 찾을 수 없음");
					    }

					    if (logger.isDebugEnabled()) {
					        logger.debug("[ShopController]/user/cartDelete response\n" + JsonUtil.toJsonPretty(ajaxResponse));
					    }

					    return ajaxResponse;
					}
				 
	}


