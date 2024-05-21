package com.camping.mapper;

import java.util.List;

import com.camping.domain.Notice_AttachVO;

public interface Notice_AttachMapper {
	
	public void insert(Notice_AttachVO vo);
	
	public void delete(String attach_uuid); 
	
	public List<Notice_AttachVO> findByBno(int board_no);
	
	public void deleteAll(int board_no);

}
