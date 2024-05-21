package com.camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.camping.domain.NoticeVO;
import com.camping.domain.Notice_AttachVO;
import com.camping.mapper.NoticeMapper;
import com.camping.mapper.Notice_AttachMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	@Setter(onMethod_ = @Autowired )
	private NoticeMapper mapper;
	
	@Setter(onMethod_ = @Autowired )
	private Notice_AttachMapper attachMapper;
	
	@Transactional
	@Override
	public void noticeregister(NoticeVO notice) {

		log.info("NoticeRegister......" + notice);
		
		mapper.insertSelectKey(notice);
		
		if(notice.getAttachList() == null || notice.getAttachList().size() <= 0) {
			return;
		}
		
		notice.getAttachList().forEach(attach -> {
			
			attach.setBoard_no(notice.getBoard_no());
			attachMapper.insert(attach);
		});
	}

	@Override
	public NoticeVO noticeget(int board_no) {

		log.info("get.........." + board_no);
		
		return mapper.read(board_no);
	}

	@Override
	public boolean noticemodify(NoticeVO notice) {

		log.info("Modify....." + notice);
		
		return mapper.update(notice) == 1;
	}

	@Transactional
	@Override
	public boolean noticeremove(int board_no) {

		log.info("Remove...." + board_no);
		
		attachMapper.deleteAll(board_no);
		
		return mapper.delete(board_no) == 1;
	}

	@Override
	public List<NoticeVO> getNoticeList(int board_no) {

		log.info("getList.........");
		
		return mapper.getList();
	}

	@Override
	public boolean plusCnt(int board_no) {

		log.info("plusCnt......");
		
		return mapper.plusCnt(board_no);
	}


	@Override
	public List<Notice_AttachVO> getAttachList(int board_no) {

		log.info("get Attach list by board_no" + board_no);
		
		return attachMapper.findByBno(board_no);
	}

	@Override
	public List<Notice_AttachVO> getAttachList() {
		// TODO Auto-generated method stub
		return null;
	}




	

}
