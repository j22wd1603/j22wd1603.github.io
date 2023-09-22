package com.icia.sweethome.model;

import java.io.Serializable;

public class Answer implements Serializable
{
	private static final long serialVersionUID = 1L;

	private String adminId;
	private int questionIdk;
	private String ansTitle;
	private String ansContent;
	private String ansDate;
	
	public Answer()
	{
		adminId = "admin";
		questionIdk= 0;
		ansTitle= "";
		ansContent= "";
		ansDate= "";
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public int getQuestionIdk() {
		return questionIdk;
	}

	public void setQuestionIdk(int questionIdk) {
		this.questionIdk = questionIdk;
	}

	public String getAnsTitle() {
		return ansTitle;
	}

	public void setAnsTitle(String ansTitle) {
		this.ansTitle = ansTitle;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public String getAnsDate() {
		return ansDate;
	}

	public void setAnsDate(String ansDate) {
		this.ansDate = ansDate;
	}
	
}
