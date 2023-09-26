package com.icia.sweethome.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.icia.sweethome.model.Admin;
import com.icia.sweethome.model.Comment;
import com.icia.sweethome.model.Community;

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

//커뮤니티
//=========================================================================================
	
    //게시글 조회
    public List<Community> adminBoardSelect(Community community);	
   
    //댓글 조회
    public List<Community> adminCommentSelect(Comment comment);		
	
//고객센터
//=========================================================================================
	

	

}

