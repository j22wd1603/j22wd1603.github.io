package com.icia.sweethome.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.sweethome.model.Shop;
import com.icia.sweethome.model.Cart;
import com.icia.sweethome.model.Review;
@Repository("shopDao")
public interface ShopDao {
	
	public List<Shop> shopList(Shop shop);
	public List<Shop> shopListView(Shop shop);
	public Shop productSelect (int productIdk);

	public int shopListCount(Shop shop);
	public int shopListViewCount(Shop shop);
	

	//조회수 증가
	public int shopListViewCntPlus(int productIdk);
	
	//카트등록
	 public int cartInsert(Cart cart);
	 
	 public int  cartUpdate(Cart cart);

	 
	 //cartPage에 리스트
	 public List<Cart> cartList (Cart cart);
	 
	 public List<Cart> cartSelect (Cart cart);
	 
	 public int cartListCount (Cart cart);
	 
	 public int cartDelete(Cart cart);
	 
	 
	 //리뷰 
	 public List<Review> reviewList (int productIdk);
	 
	 public int reviewInsert(Review review);
	 
	//마이페이지의 내 리뷰 0913 윤하나
	public List<Review> boardMyReview(Review review);
	   
	// 마이페이지에서 내 리뷰 존재 여부 확인 0913 윤하나 
	public int boardMyReviewSearch(int productIdk);
	   
	//마이페이지에서 내 리뷰 삭제
	public int boardMyReviewDelete(int productIdk);
	
	public int boardMyReviewCount(Review review);
		
}





