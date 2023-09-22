
package com.icia.sweethome.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.icia.sweethome.model.User;

@Repository("userDao")
public interface UserDao
{

	public User userSelect(String userId);
	
	//사용자 등록
	public int userInsert(User user);
	
	//사용자 정보 수정
	public int userUpdate(User user);
	
	//마이페이지 좋아요 스크랩 쿠폰 건수
	public User myCountList(String userId);
	
	public String searchId(@Param("userName")String userName, @Param("userPhone")String userPhone); // 유저 ID 찾기
	   
	public String searchPwd(@Param("userId")String userId, @Param("userEmail")String userEmail); // 유저 PWD 찾기
	
	
	
	
	
}
