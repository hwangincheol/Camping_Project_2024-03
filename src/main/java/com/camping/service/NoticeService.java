package com.camping.service;

import java.util.List;

import com.camping.domain.NoticeVO;
import com.camping.domain.Notice_AttachVO;
import com.camping.mapper.NoticeMapper;

public interface NoticeService {
	
	public void noticeregister(NoticeVO notice);
	
	public NoticeVO noticeget(int board_no);
	
	public boolean noticemodify(NoticeVO notice);
	
	public boolean noticeremove(int board_no);
	
	public List<NoticeVO> getNoticeList(int board_no);
	
	public boolean plusCnt(int board_no);
	
	public List<Notice_AttachVO> getAttachList();

	List<Notice_AttachVO> getAttachList(int board_no);
	

}
