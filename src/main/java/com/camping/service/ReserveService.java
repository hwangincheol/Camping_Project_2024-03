package com.camping.service;

import com.camping.domain.CampVO;
import com.camping.domain.ReserveVO;

import java.util.List;

public interface ReserveService {

    // 예약 실행
    public ReserveVO register(ReserveVO reserveVO);

    // 회원의 전체 예약 불러오기 실행
    public List<ReserveVO> getMem(String mem_id);

    // 예약 1건의 정보 불러오기 실행
    public ReserveVO getRes(Long reserve_no);

    // 수정 실행
    public boolean modify(ReserveVO reserveVO);

    // 삭제 실행
    public boolean remove(Long reserve_no);

    public List<String> find_sDate(String camp_no);

    public List<String> find_eDate(String camp_no);

    public CampVO find_price(String camp_no);
}
