package com.camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.camping.domain.BoardAttachVO;
import com.camping.domain.BoardVO;
import com.camping.domain.Criteria;
import com.camping.mapper.ReviewBoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2 
@Service 
public class ReviewBoardServiceImpl implements ReviewBoardService {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewBoardMapper mapper;
	
	@Transactional
	@Override
	public void register(BoardVO board) {
		// 게시물 등록
	log.info("등록중" + board);
	
    mapper.insertSelectKey(board);
	
	}

	@Override
	public BoardVO get(int board_no) {
	    // 글을 조회할 때 조회수 증가
	    //mapper.increaseViewCount(board_no);
	    return mapper.read(board_no);
	}
	
//	@Override
//	public BoardVO get(int board_no) {
		// 글 조회
//		return mapper.read(board_no);
//	}

	@Override
	public boolean modify(BoardVO board) {
		// 수정
		log.info("수정중..." + board);
		return mapper.update(board) == 1 ;
	}

	@Override
	public boolean remove(int board_no) {
		// 제거
		log.info("삭제중..." + board_no);
		return mapper.delete(board_no) == 1 ;
	}

	/*
	 * @Override public List<BoardVO> getList() { // 목록 나오기
	 * 
	 * log.info("목록..."); return mapper.getList(); }
	 */

	@Override
	public List<BoardVO> getList(Criteria cri){
		
		log.info("페이지목록" + cri);
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
	
		return mapper.getTotalCount(cri);
	}

	
	
}
