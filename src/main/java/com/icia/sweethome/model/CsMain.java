package com.icia.sweethome.model;

import java.io.Serializable;

public class CsMain implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private int faqSeq;
	private String faqCategory;
	private String faqTitle;
	private String faqContent;
	private String regDate;
	private String searchType;		//검색타입(1:이름, 2:제목, 3:내용)
	private String searchValue;		//검색값
	
	
	public CsMain()
	{
		faqSeq = 0;
		faqCategory = "";
		faqTitle = "";
		faqContent = "";
		regDate = "";
		searchValue = "";
		searchType = "";
	}

	public int getFaqSeq() {
		return faqSeq;
	}

	public void setFaqSeq(int faqSeq) {
		this.faqSeq = faqSeq;
	}

	public String getFaqCategory() {
		return faqCategory;
	}

	public void setFaqCategory(String faqCategory) {
		this.faqCategory = faqCategory;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
