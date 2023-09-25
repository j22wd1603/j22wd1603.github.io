
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

public class Admin implements Serializable{
	
	private static final long serialVersionUID = 8638989512396268543L;

	private String adminId;
	private String adminPwd;
	private String adminName;
	private String adminPhone;
	private String adminEmail;

	

	/**
	 * 생성자 
	 */
	public Admin()
	{

		adminId = "";
		adminPwd = "";
		adminName = "";
		adminPhone = "";
		adminEmail = "";
		
	}



	public String getAdminId() {
		return adminId;
	}



	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}



	public String getAdminPwd() {
		return adminPwd;
	}



	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}



	public String getAdminName() {
		return adminName;
	}



	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}



	public String getAdminPhone() {
		return adminPhone;
	}



	public void setAdminPhone(String adminPhone) {
		this.adminPhone = adminPhone;
	}



	public String getAdminEmail() {
		return adminEmail;
	}



	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	
	

}
