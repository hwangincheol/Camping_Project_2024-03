package com.camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.camping.domain.BoardVO;
import com.camping.domain.Criteria;
import com.camping.mapper.FreeBoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class FreeBoardServiceImpl implements FreeBoardService {

	@Setter(onMethod_ = @Autowired)
	private FreeBoardMapper mapper;

	@Override
	public void register(BoardVO board) { // 등록

		log.info("register......" + board);

		mapper.insertSelectKey(board);
	}

	@Override
	public BoardVO get(int board_no) { // 읽기

		log.info("get......" + board_no);

		return mapper.read(board_no);

	}

	@Override
	public boolean modify(BoardVO board) { // 수정

		log.info("modify......" + board);

		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(int board_no) { // 삭제

		log.info("remove...." + board_no);

		return mapper.delete(board_no) == 1;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) { // 글목록

		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) { // 페이징

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

    @Override
    public void increaseViewCount(int board_no) { // 조회수 증가
	    log.info("Increase view count for board: " + board_no);
	     mapper.increaseViewCount(board_no);
	    }
	

}