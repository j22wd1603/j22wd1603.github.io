
package com.icia.sweethome.dao;

import java.util.List;

import com.icia.sweethome.model.Comment;
import com.icia.sweethome.model.Community;
import org.springframework.stereotype.Repository;



@Repository("communityDao")
public interface CommunityDao 
{
   /////높은 좋아요 순으로 게시물 리스트 
   public List<Community> boardListByLikes(String commuTab);
   
   //높은 조회수 순으로 게시물 리스트 
   public List<Community> boardListByViews(String commuTab);
   
   //월간 게시판 리스트
   public List<Community> boardListByMonth(String commuTab);

   //게시물 조회
   public Community boardSelect(int commuIdk);
   
   //등록일순(겹치면 글자순)으로 게시물 조회
   public List<Community> boardListByRegDateAndCommuTitle(String commuTab);
   
   //총 게시물 수
   public int boardListCount(Community community);
   
   //게시글 조회
   public List<Community> boardList(Community community);
   
   //조회수 증가
   public int boardReadCntPlus(int commuIdk);
   
   //게시물 삭제
   public int boardDelete(int commuIdk);
   
   //게시물 삭제 시 댓글 삭제
   public int commentDeleteWhenBoardDelete(int commuIdk);
   
   //게시물 등록
   public int boardInsert(Community community);
   
   //시퀀스
   public int communitySeq();
   
   //게시물 수정
   public int boardUpdate(Community community);
   
   //댓글 조회
   public List<Comment> commentList(int commuIdk);
   
   //댓글 등록
   public int commentInsert(Comment comment);
   
   //댓글 시퀀스
   public int commentSeq();
   
   //댓글 삭제
   public int commentDelete(Comment deleteComment);
   
   //댓글 조회
   public Comment commentSelect(int commentIdk);
   
   //댓글 수정
   public int commentUpdate(Comment comment);
   
   //상세 게시물 조회 시 나의 좋아요 여부
   public int boardViewMyLikes(Community community);
   
   //상세 게시물 조회 시 나의 스크랩 여부
   public int boardViewMyScrap(Community community);
   
   //상세 게시물 좋아요 증가
   public int boardLikesCntPlus(int commuIdk);
   
   //상세 게시물 좋아요 감소
   public int boardLikesCntMinus(int commuIdk);
   
   //좋아요 테이블에 인서트
   public int likesInsert(Community community);
   
   //스크랩 테이블에 인서트
   public int scrapInsert(Community community);
   
   //좋아요 테이블에서 딜리트
   public int likesDelete(Community community);
   
   //스크랩 테이블에서 딜리트
   public int scrapDelete(Community community);
   
   //게시물 삭제 시 좋아요 테이블에서 딜리트
   public int likesDeleteWhenBoardDelete(int commuIdk);
   
   //게시물 삭제 시 스크랩 테이블에서 딜리트
   public int scrapDeleteWhenBoardDelete(int commuIdk);
   
   //임시 저장 테이블에서 조회
   public Community saveSelect(String userId);
   
   //임시 저장 테이블에서 딜리트
   public int saveDelete(String userId);
   
   //임시 저장 테이블에 인서트
   public int saveInsert(Community community);
   
   
   //----------- 하나 아래 ---- 위 인호
   
   //마이페이지의 내게시글
   public List<Community> boardMyList(Community community);
   
   public int boardMyListCount(Community community);
   
   //마이페이지의 내 스크랩
   public List<Community> boardMyScrap(Community community);
   
   //마이페이지의 내 스크랩 전체건수 조회
   public int boardMyScrapCount(Community community);
   
   //마이페이지에서 게시물 삭제
   public int boardMyDelete(int commuIdk);
	
   //마이페이지에서 게시물 삭제시 답변글 조회
   public int boardMyAnswersCount(int commuIdk);
   
   //마이페이지에서 내 스크랩 삭제
   public int boardMyScrapDelete(int commuIdk);
   
   // 마이페이지에서 내 스크랩 존재 여부 확인 0913 윤하나 
   public int boardMyScrapSearch(int commuIdk);
   
   //마이페이지의 내 좋아요 전체 건수 조회 0913 윤하나 
   public int boardMyLikesCount(Community community);
   
   //마이페이지의 내 좋아요 0913 윤하나
   public List<Community> boardMyLikes(Community community);
   
   // 마이페이지에서 내 스크랩 존재 여부 확인 0913 윤하나 
   public int boardMyLikesSearch(int commuIdk);
   
   //마이페이지에서 내 스크랩 삭제
   public int boardMyLikesDelete(int commuIdk);
   
   //마이페이지에서 좋아요 여러개 삭제 0920
   public int myLikesSelectDelete(int commuIdk);   
   
   //마이페이지에서 게시물 여러개 삭제 0920
   public int mySelectDelete(int commuIdk);   
   
   //마이페이지에서 내 스크랩 선택삭제
   public int myScrapSelectDelete(int commuIdk);
   
   //마이페이지에 내게시글 삭제시 조회
   public Community boardMyCommInfo(Community community);
}

