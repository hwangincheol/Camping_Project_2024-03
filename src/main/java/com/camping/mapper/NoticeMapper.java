package com.camping.mapper;

import java.util.List;

import com.camping.domain.NoticeVO;

public interface NoticeMapper {
	
	public List<NoticeVO> getList();
	
	public void insert(NoticeVO notice);
	
	public void insertSelectKey(NoticeVO notice);
	
	public NoticeVO read(int board_no);
	
	public int delete(int board_no);
	
	public int update(NoticeVO notice);
	
	public boolean plusCnt(int board_no);

}
