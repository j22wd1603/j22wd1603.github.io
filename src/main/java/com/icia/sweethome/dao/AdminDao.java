package com.icia.sweethome.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.icia.sweethome.model.Admin;

@Repository("adminDao")
public interface AdminDao {
	
	//관리자 조회
	public Admin adminSelect(String userId);
	

}

