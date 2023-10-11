package com.icia.sweethome.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.sweethome.model.Cart;
import com.icia.sweethome.model.Review;
import com.icia.sweethome.model.Shop;
@Repository("shopDao")
public interface ShopDao {
	//샵,페이징
	public List<Shop> shopList(Shop shop);
	public int shopListCount(Shop shop);
		
	//프로덕트 카테고리 
	public List<Shop> productDetailselct(String code);
	public List<String> productBrandSelct(Shop code);

	
	//베스트아이템, 페이징
	public List<Shop> shopListView(Shop shop);
	public int shopListViewCount(Shop shop);
	
	
	//프로덕트디테일, 조회수 증가
	public Shop productSelect (int productIdk);
	public int shopListViewCntPlus(int productIdk);
	
	//카트 조회, 인서트, 업데이트, 델리트, 페이징
	 public List<Cart> cartSelect (Cart cart);	 
	 public int cartInsert(Cart cart);	 
	 public int  cartUpdate(Cart cart);
	 public int cartDelete(Cart cart);
	 public int cartListCount (Cart cart);	 
	 	
	 //cartPage 리스트
	 public List<Cart> cartList (Cart cart);

	 
	//user 마이페이지 리뷰, 리뷰존재여부, 삭제
	public List<Review> boardMyReview(Review review);
	public int boardMyReviewSearch(int productIdk);
	public int boardMyReviewDelete(int productIdk);	
	public int boardMyReviewCount(Review review);
	
	//민기 리뷰
	public int reviewInsert(Review review);
	public int reviewUpdate(int detailIdk);
	public List<Review> reviewList(int productIdk);
	
	public List<Integer> recommend();
	
}





