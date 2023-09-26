package com.icia.sweethome.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.sweethome.dao.AdminDao;
import com.icia.sweethome.dao.UserDao;
import com.icia.sweethome.model.Admin;
import com.icia.sweethome.model.User;


@Service("adminService")
public class AdminService
{
   private static Logger logger = LoggerFactory.getLogger(UserService.class);
   
   /**
    * @Autowired : IoC컨테이너 안에 존재하는 Bean을 자동으로 주입한다.
    */
   @Autowired
   private AdminDao adminDao;
   
   public Admin adminSelect(String userId)
   {
      Admin admin = null;
      
      try
      {
         admin = adminDao.adminSelect(userId);
      }
      catch(Exception e)
      {
         logger.error("[AdminService] adminSelect Exception", e);
      }
      
      return admin;
   }
   
}
