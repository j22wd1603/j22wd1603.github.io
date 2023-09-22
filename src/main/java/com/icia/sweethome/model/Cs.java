package com.icia.sweethome.model;

import java.io.Serializable;

public class Cs implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private int noticeIdk;
	private String adminId;
	private String noticeTitle;
	private String noticeContent;
	private String regDate;
	private int startRow;			//시작 rownum
	private int endRow;			//끝 rownum
	private String searchType;		//검색타입(1:이름, 2:제목, 3:내용)
	private String searchValue;		//검색값
	
	public Cs()
	{
		noticeIdk = 0;
		adminId = "";
		noticeTitle = "";
		noticeContent = "";
		regDate = "";
		startRow = 0;
		endRow = 0;
		searchType = "";
		searchValue = "";
		
	}

	public int getNoticeIdk() {
		return noticeIdk;
	}

	public void setNoticeIdk(int noticeIdk) {
		this.noticeIdk = noticeIdk;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
	
	
}
