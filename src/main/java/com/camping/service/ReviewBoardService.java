package com.camping.service;

import java.util.List;

import com.camping.domain.BoardAttachVO;
import com.camping.domain.BoardVO;
import com.camping.domain.Criteria;


public interface ReviewBoardService {
	
public void register(BoardVO board); // 등록
	
	public BoardVO get(int board_no);
	
	public boolean modify(BoardVO board); // 수정
	
	public boolean remove(int board_no); // 삭제
	
	public List<BoardVO> getList(Criteria cri); // 리스트

	public int getTotal(Criteria cri); // 전체
	
	
	
	
}
