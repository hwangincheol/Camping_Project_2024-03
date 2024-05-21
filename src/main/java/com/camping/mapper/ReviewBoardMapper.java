package com.camping.mapper;

import java.util.List;

import com.camping.domain.BoardVO;
import com.camping.domain.Criteria;

public interface ReviewBoardMapper {
	
	public List<BoardVO> getList();
	
	public void insert(BoardVO board); 
	
	public void insertSelectKey(BoardVO board); 
	
	public BoardVO read(int board_no); 
	
	public int delete(int board_no); 
	
	public int update(BoardVO board); 
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void increaseViewCount(int board_no);
}
