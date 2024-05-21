package com.camping.service;

import java.util.List;

import com.camping.domain.BoardVO;
import com.camping.domain.Criteria;

public interface FreeBoardService {

	public void register(BoardVO board); // 등록

	public BoardVO get(int board_no); // 읽기

	public boolean modify(BoardVO board); // 수정

	public boolean remove(int board_no); // 삭제

	public List<BoardVO> getList(Criteria cri); // 목록

	public int getTotal(Criteria cri);

	 public void increaseViewCount(int board_no); // 조회수
}