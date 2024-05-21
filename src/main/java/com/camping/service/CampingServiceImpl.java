package com.camping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.camping.domain.CampingVO;
import com.camping.domain.Criteria;
import com.camping.mapper.CampingMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class CampingServiceImpl implements CampingService{
	
	private CampingMapper mapper;
	
	@Override
	public void register(CampingVO camping) {
		
		log.info("register......" + camping);
		
		mapper.insertSelectKey(camping);
	}

	@Override
	public CampingVO get(Long board_no) {
		
		log.info("get........." + board_no);
		
		return mapper.read(board_no);
	}
	
	@Override
	public boolean modify(CampingVO camping) {
		
		log.info("modify......" + camping);
		
		return mapper.update(camping) == 1;
	}
	
	@Override
	public boolean remove(Long board_no) {
		
		log.info("remove......." + board_no);
		
		return mapper.delete(board_no) == 1;
	}
	
	//@Override
	//public List<CampingVO> getList() {
		
	//	log.info("getList............");
		
	//	return mapper.getList();
	//}
	
	@Override
	public List<CampingVO> getList(Criteria cri) {
		
		log.info("get List with criteria : " + cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
}
