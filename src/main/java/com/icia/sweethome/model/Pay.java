package com.icia.sweethome.model;

import java.io.Serializable;
import java.util.Date;

public class Pay implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int payIdk;
	String aid;
	String tid;
	String cid;
	int orderIdk;
	String userId;
	String payMethodType;
	Date approvedDate;
	String cardBin;
	String cardType;
	
	public Pay() {
		payIdk = 0;
		aid = "";
		tid = "";
		cid = "";
		orderIdk = 0;
		userId = "";
		payMethodType = "";
		approvedDate = null;
		cardBin = "";
		cardType = "";
	}

	public int getPayIdk() {
		return payIdk;
	}

	public void setPayIdk(int payIdk) {
		this.payIdk = payIdk;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public int getOrderIdk() {
		return orderIdk;
	}

	public void setOrderIdk(int orderIdk) {
		this.orderIdk = orderIdk;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPayMethodType() {
		return payMethodType;
	}

	public void setPayMethodType(String payMethodType) {
		this.payMethodType = payMethodType;
	}

	public Date getApprovedDate() {
		return approvedDate;
	}

	public void setApprovedDate(Date approvedDate) {
		this.approvedDate = approvedDate;
	}
}
