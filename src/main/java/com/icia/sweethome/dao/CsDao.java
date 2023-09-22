package com.icia.sweethome.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.sweethome.model.Question;
import com.icia.sweethome.model.Answer;
import com.icia.sweethome.model.Cs;
import com.icia.sweethome.model.CsMain;


@Repository("csDao")
public interface CsDao {
		//공지사항 리스트
		public List<Cs> boardList(Cs cs);
		
		//공지사항 총 게시물 수
		public int boardListCount(Cs cs);
		

		//고객센테 메인 faq
		public List<CsMain> csMainList(CsMain cs);
		
		//1:1질문 글쓰기
		public int boardInsert(Question question);
		
		//마이페이지 내 질문 개수
		public int boardListCount2(Question question);
		
		//마이페이지 내가 쓴글 리스트
		public List<Question> boardList2(Question question);
		
		//공지사항 게시물 조회
		public Cs boardSelect(int noticeIdk);
		
		//게시물 조회
		public Question boardSelect2(int questionIdk);
		
		//시퀀스 조회
		public int questionSeq();
		
		//1:1게시물 업데이트
		public int boardUpdate(Question question);
		
		//1:1게시물 삭제
		public int boardDelete(int hiBbsSeq);

		//게시물 답글 등록
		public int boardReplyInsert(Answer answer);
		
		//Qeustion 답변 업데이트
		public int statusUpdate(Question question);
		
		//답변 조회
		public Answer answerSelect(int questionIdk);
}
