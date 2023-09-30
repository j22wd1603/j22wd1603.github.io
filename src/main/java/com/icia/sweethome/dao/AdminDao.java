package com.icia.sweethome.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.icia.sweethome.model.Admin;
import com.icia.sweethome.model.Comment;
import com.icia.sweethome.model.Community;
import com.icia.sweethome.model.Cs;
import com.icia.sweethome.model.Question;
import com.icia.sweethome.model.User;

@Repository("adminDao")
public interface AdminDao {
	
	//관리자 조회
	public Admin adminSelect(String userId);
	
	
//유저
//=========================================================================================
	
//쇼핑몰
//=========================================================================================

//판매자
//=========================================================================================

//커뮤니티(0927)
//=========================================================================================
	
    //게시글 조회
    public List<Community> adminBoardSelect(Community community);	
   
    //댓글 조회
    public List<Comment> adminCommentSelect(Comment comment);		
    
    //게시글 상태 업데이트
    public int boardStatusUpdate(int commuIdk);
    
    //댓글 상태 업데이트
    public int commentStatusUpdate(int commentIdk);
	
//고객센터
//=========================================================================================
	
    public List<User> userList(User user);
	public int userStatusUpdate(User user);
	public Question questionSelect(String question);
	public List<Question> userQuestion(Question user);
	public int noticeInsert(Cs cs);
	public int noticeDelete(Cs cs);

}

