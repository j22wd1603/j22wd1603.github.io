package com.icia.sweethome.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.sweethome.dao.ShopDao;
import com.icia.sweethome.model.Shop;

@Service ("indexService")
public class IndexService 
{
	private static Logger logger = LoggerFactory.getLogger(IndexService.class);
	
	@Autowired
	private ShopDao shopDao;

	//샵 리스트 
	public List<Shop> shopList(Shop shop)
	{
		List <Shop> list = null;
			
		try
		{
			list = shopDao.shopList(shop);
		}
		catch(Exception  e)
		{
			logger.error("[IndexService ] shopList Exception" , e);
		}
		return list;
	}
	
	public int shopListCount(Shop shop)
	{
		int count = 0;
			
		try
		{
			count = shopDao.shopListCount(shop);
		}
		catch(Exception  e)
		{
			logger.error("[IndexService ] shopListCount Exception" , e);
		}
		return count;
	}
}
