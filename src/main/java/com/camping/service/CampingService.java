package com.camping.service;

import java.util.List;

import com.camping.domain.CampingVO;
import com.camping.domain.Criteria;

public interface CampingService {
	
	public void register(CampingVO camping);
	
	public CampingVO get(Long bno);
	
	public boolean modify(CampingVO camping);
	
	public boolean remove(Long bno);
	
	//public List<CampingVO> getList();
	
	public List<CampingVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
