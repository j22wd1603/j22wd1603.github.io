package com.icia.sweethome.model;

import java.io.Serializable;

public class Comment implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private int commentIdk;				//댓글번호
	private int commuIdk;				//게시글 번호
	private String commentStatus;		//댓글 상태	
	private String regDate;				//등록 일자
	private String modDate;				//수정 일자
	private String deleteDate;			//삭제 일자
	private int parentIdk;				//부모댓글 번호
	private String commentContent;		//댓글 내용
	private String userId;				//사용자 아이디
	private int groupIdk;				//그룹 번호
	private String imageFileExt;		//프로필 이미지 확장자
	private String searchType;			//관리자에서 (1:게시글, 2:댓글)
	private String searchValue;			//검색값	

	public Comment()
	{
		commentIdk = 0;
		commuIdk = 0;
		commentStatus = "";
		regDate = "";
		modDate = "";
		deleteDate = "";
		parentIdk = 0;
		commentContent = "";
		userId = "";
		groupIdk = 0;
		imageFileExt = "";
		searchType = "";
		searchValue = "";
		
	}


	public String getSearchType() {
		return searchType;
	}


	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}


	public String getSearchValue() {
		return searchValue;
	}


	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}


	public String getImageFileExt() {
		return imageFileExt;
	}


	public void setImageFileExt(String imageFileExt) {
		this.imageFileExt = imageFileExt;
	}


	public int getCommentIdk() {
		return commentIdk;
	}


	public void setCommentIdk(int commentIdk) {
		this.commentIdk = commentIdk;
	}


	public int getCommuIdk() {
		return commuIdk;
	}


	public void setCommuIdk(int commuIdk) {
		this.commuIdk = commuIdk;
	}


	public String getCommentStatus() {
		return commentStatus;
	}


	public void setCommentStatus(String commentStatus) {
		this.commentStatus = commentStatus;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public String getModDate() {
		return modDate;
	}


	public void setModDate(String modDate) {
		this.modDate = modDate;
	}


	public String getDeleteDate() {
		return deleteDate;
	}


	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}


	public int getParentIdk() {
		return parentIdk;
	}


	public void setParentIdk(int parentIdk) {
		this.parentIdk = parentIdk;
	}


	public String getCommentContent() {
		return commentContent;
	}


	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getGroupIdk() {
		return groupIdk;
	}


	public void setGroupIdk(int groupIdk) {
		this.groupIdk = groupIdk;
	}
}
