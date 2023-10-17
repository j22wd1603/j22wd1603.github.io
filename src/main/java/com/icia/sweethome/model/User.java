/**
 * <pre>
 * 프로젝트명 : BasicBoard
 * 패키지명   : com.icia.web.model
 * 파일명     : User.java
 * 작성일     : 2021. 1. 12.
 * 작성자     : daekk
 * </pre>
 */
package com.icia.sweethome.model;

import java.io.Serializable;

/**
 * <pre>
 * 패키지명   : com.icia.web.model
 * 파일명     : User.java
 * 작성일     : 2021. 1. 12.
 * 작성자     : daekk
 * 설명       : 사용자 모델
 * </pre>
 */
public class User implements Serializable
{
	private static final long serialVersionUID = 8638989512396268543L;


	private String userId;
	private String userPwd;
	private String userNickname;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userAddress;
	private String userStatus;
	private String regDate;
	private String deleteDate;
	private String profilePicture;
	private String imageFileExists;
	private String imageFileExt;
	
	//마이페이지 좋아요 스크랩 쿠폰 건수
	private int scrapCnt;
	private int likesCnt;
	private int couponCnt;
	private int questionCnt;
	
	
	/**
	 * 생성자 
	 */
	public User()
	{

		userId = "";
		userPwd = "";
		userNickname = "";
		userName = "";
		userEmail = "";
		userPhone = "";
		userAddress = "";
		userStatus = "";
		regDate = "";
		deleteDate = "";
		profilePicture = "";
		imageFileExists = "";
		imageFileExt = "";
		scrapCnt = 0; 
		likesCnt = 0; 
		couponCnt = 0; 
		questionCnt = 0;
	}
	
	


	public int getQuestionCnt() {
		return questionCnt;
	}




	public void setQuestionCnt(int questionCnt) {
		this.questionCnt = questionCnt;
	}




	public int getScrapCnt() {
		return scrapCnt;
	}




	public void setScrapCnt(int scrapCnt) {
		this.scrapCnt = scrapCnt;
	}




	public int getLikesCnt() {
		return likesCnt;
	}




	public void setLikesCnt(int likesCnt) {
		this.likesCnt = likesCnt;
	}




	public int getCouponCnt() {
		return couponCnt;
	}




	public void setCouponCnt(int couponCnt) {
		this.couponCnt = couponCnt;
	}




	public String getImageFileExt() {
		return imageFileExt;
	}


	public void setImageFileExt(String imageFileExt) {
		this.imageFileExt = imageFileExt;
	}


	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}
	public String getProfilePicture() {
		return profilePicture;
	}
	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}
	public String getImageFileExists() {
		return imageFileExists;
	}
	public void setImageFileExists(String imageFileExists) {
		this.imageFileExists = imageFileExists;
	}


}

