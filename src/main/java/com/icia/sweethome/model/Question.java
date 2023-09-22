package com.icia.sweethome.model;

import java.io.Serializable;

public class Question implements Serializable
{
	private static final long serialVersionUID = 1L;
	private int questionIdk;
    private String questionCategory;
    private String questionTitle;
    private String userId;
    private String questionContent; 
    private String ansStatus;
    private String regDate;
    private String fileCheck;
    private String fileExt;
    private int startRow;			//시작 rownum
	private int endRow;
	private String profilePicture;

    public Question()
    {
    	questionIdk = 0;
        questionCategory  = "";
        questionTitle = "";
        userId  = "";
        questionContent  = "";
        ansStatus = "N";
        regDate  = "";
        fileCheck  = "";
        fileExt = "";
        startRow = 0;
        endRow = 0;
        profilePicture ="";
    }

	public int getQuestionIdk() {
		return questionIdk;
	}

	public void setQuestionIdk(int questionIdk) {
		this.questionIdk = questionIdk;
	}

	public String getQuestionCategory() {
		return questionCategory;
	}

	public void setQuestionCategory(String questionCategory) {
		this.questionCategory = questionCategory;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
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

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getAnsStatus() {
		return ansStatus;
	}

	public void setAnsStatus(String ansStatus) {
		this.ansStatus = ansStatus;
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

	public String getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}
	


}
