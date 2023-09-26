package com.icia.sweethome.service;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.sweethome.dao.ShopDao;
import com.icia.sweethome.model.Cart;
import com.icia.sweethome.model.Review;
import com.icia.sweethome.model.Shop;

@Service ("shopService")
public class ShopService 
{
	private static Logger logger = LoggerFactory.getLogger(ShopService.class);
	
	@Autowired
	private ShopDao shopDao;

	//---------------------------------------------------------------------------
	//샵 리스트 
	public List<Shop> shopList(Shop shop) {
	    List<Shop> list = null;
	    
	    try {
	        list = shopDao.shopList(shop);
	        
	    }
	    catch (Exception e) {
	        logger.error("[ShopService] shopList Exception", e);
	    }
	    
	    return list;
	}
	
	
	//샵 리스트 조회수 많은애 
		public List<Shop> shopListView(Shop shop)
		{
			List<Shop> listView = null;
				
			try
			{
				listView = shopDao.shopListView(shop);
			}
			catch(Exception  e)
			{
				logger.error("[ShopService] shopListView Exception" , e);
			}
			return listView;
		}
		
		
		
	
	public Shop productSelect(int productIdk)
	{
		Shop shop = null;
		int productCnt = 0;
		
		try
		{
			shop = shopDao.productSelect(productIdk);
			productCnt=shopDao.shopListViewCntPlus(productIdk);
		}
		catch(Exception  e)
		{
			logger.error("[ShopService] productSelect Exception" , e);
		}
		return shop;
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
			logger.error("[ShopService] shopListCount Exception" , e);
		}
		return count;
	}
	
	public int shopListViewCount(Shop shop)
	{
		int count = 0;
		
		try
		{
			count = shopDao.shopListViewCount(shop);
		}
		catch(Exception  e)
		{
			logger.error("[ShopService] shopListViewCount Exception" , e);
		}
		return count;
	}
	
//리뷰
	
	public List<Review> reviewList(int productIdk)
	{
		List<Review> review = null;

		try
		{
			review = shopDao.reviewList(productIdk);	
		}
		catch(Exception  e)
		{
			logger.error("[ShopService] reviewList Exception" , e);
		}
		return review;
	}
	
	
	 public int reviewInsert(Review review)
	   {
	      int count = 0;
	      
	      try
	      {
	         count =  shopDao.reviewInsert(review);
	      }
	      catch(Exception e)
	      {
	         logger.error("[ShopService]reviewInsert Exception", e);
	      }
	      
	      return count;
	      
	   }

	public List<Cart> cartSelect(Cart cart)
	   {
		List<Cart>  cartSelect = null;
		try
		{
			cartSelect = shopDao.cartSelect(cart);
		}
		catch(Exception e)
		{
			logger.error("[shopService] cartSelect Exception", e);
		}
		   
		return cartSelect;
	}

	 
	 public int cartInsert(Cart cart)
	   {
	      int count = 0;
	      
	      try
	      {
	         count =  shopDao.cartInsert(cart);
	      }
	      catch(Exception e)
	      {
	         logger.error("[ShopService]cartInsert Exception", e);
	      }
	      
	      return count;
	      
	   }
	
	 public int cartUpdate(Cart cart)
	   {
	      int count = 0;
	      
	      try
	      {
	         count =  shopDao.cartUpdate(cart);
	      }
	      catch(Exception e)
	      {
	         logger.error("[ShopService]cartUpdate Exception", e);
	      }
	      
	      return count;
	      
	   }
	
	 
	 public List<Cart> cartList(Cart cart)
		{
		 	List<Cart>  cartList = null;
			  	   
			try
			{
				cartList = shopDao.cartList(cart);
			}
			catch(Exception e)
			{
				logger.error("[shopService] cartList Exception", e);
			}
			   
			return cartList;
		}
	 
	 
	 public int cartListCount(Cart cart)
		{
			 int count = 0;
				
				try
				{
					count = shopDao.cartListCount(cart);
				}
				catch(Exception e)
				{
					logger.error("[shopService] boardMyReviewCount Exception", e);
				}
				
				return count;
			}
	 
	 
	 public int cartDelete(Cart cart)
		{  
			int count = 0;
	      
	      try
	      {
	         count =  shopDao.cartDelete(cart);
	      }
	      catch(Exception e)
	      {
	         logger.error("[ShopService]cartDelete Exception", e);
	      }
	      
	      return count;
	      
	   }
	 
	
	 //마이페이지의 내 리뷰 0918 윤하나
		public List<Review> boardMyReview(Review review)
		{
			List<Review> list = null;
			   	   
			try
			{
				list = shopDao.boardMyReview(review);
			}
			catch(Exception e)
			{
				logger.error("[shopService] boardMyReview Exception", e);
			}
			   
			return list;
		}
		

		
		
		//마이페이지의 리뷰 건수 조회 0919 윤하나
		public int boardMyReviewCount(Review review)
		{
			int count = 0;
			
			try
			{
				count = shopDao.boardMyReviewCount(review);
			}
			catch(Exception e)
			{
				logger.error("[shopService] boardMyReviewCount Exception", e);
			}
			
			return count;
		}
		
		
		
		// 마이페이지에서 내 좋아요 존재 여부 확인 0918 윤하나 
		public int boardMyReviewSearch(int productIdk)
		{
			int count = 0;
				
			try
			{
				count = shopDao.boardMyReviewSearch(productIdk);
			}
			catch(Exception e)
			{
				logger.error("[shopService] boardMyReviewSearch Exception", e);
			}
				
			return count;
		}
		
		// 마이페이지에서 내 스크랩 삭제 0913 윤하나 
		public int boardMyReviewDelete(int productIdk)
		{
			int count = 0;
					
			try
			{
				count = shopDao.boardMyReviewDelete(productIdk);
			}
			catch(Exception e)
			{
				logger.error("[shopService] boardMyReviewDelete Exception", e);
			}
				
			return count;
		}   
}



