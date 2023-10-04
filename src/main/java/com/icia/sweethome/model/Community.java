package com.icia.sweethome.model;

import java.io.Serializable;


public class Community implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private int commuIdk;		//게시글 번호(시퀀스)
	private String commuTab;					//게시글 탭
	private String userId;						//작성자
	private String commuTitle;					//제목
	private String commuContent;				//내용
	private int commuViews;					//조회수
	private int commuLikes;					//좋아요수
	private String commuStatus;				//상태
	private String regDate;					//등록일자
	private String modDate;					//수정일자
	private String deleteDate;					//삭제일자
	private String fileCheck;				//첨부파일존재유무(Y:있음,N:없음)
	private String fileExt;					//첨부파일확장자(COMMU_IDK.확장자)
	private String searchType;			//검색타입(1:이름, 2:제목, 3:내용) 관리자에서는 (1:게시글, 2:댓글)
	private String searchValue;			//검색값
	private String sortType;			//정렬타입(1.최신순 2.과거순 3.인기순)
	private int startRow;			//시작 rownum
	private int endRow;			//끝 rownum
	
	

	public Community()
	{
		commuIdk = 0;
		commuTab = "";
		userId = "";
		commuTitle = "";
		commuContent = "";
		commuViews = 0;
		commuLikes = 0;
		commuStatus = "";
		regDate = "";
		modDate = "";
		deleteDate = "";
		fileCheck = "N";
		fileExt = "";
		searchType = "";
		searchValue = "";
		sortType = "";
		startRow = 0;
		endRow = 0;		
	}

	public int getCommuIdk() {
		return commuIdk;
	}

	public void setCommuIdk(int commuIdk) {
		this.commuIdk = commuIdk;
	}

	public String getCommuTab() {
		return commuTab;
	}

	public void setCommuTab(String commuTab) {
		this.commuTab = commuTab;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCommuTitle() {
		return commuTitle;
	}

	public void setCommuTitle(String commuTitle) {
		this.commuTitle = commuTitle;
	}

	public String getCommuContent() {
		return commuContent;
	}

	public void setCommuContent(String commuContent) {
		this.commuContent = commuContent;
	}

	public int getCommuViews() {
		return commuViews;
	}

	public void setCommuViews(int commuViews) {
		this.commuViews = commuViews;
	}

	public int getCommuLikes() {
		return commuLikes;
	}

	public void setCommuLikes(int commuLikes) {
		this.commuLikes = commuLikes;
	}

	public String getCommuStatus() {
		return commuStatus;
	}

	public void setCommuStatus(String commuStatus) {
		this.commuStatus = commuStatus;
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

	public String getFileCheck() {
		return fileCheck;
	}

	public void setFileCheck(String fileCheck) {
		this.fileCheck = fileCheck;
	}

	public String getFileExt() {
		return fileExt;
	}

	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
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

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

}


