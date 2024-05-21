package com.camping.mapper;

import com.camping.domain.*;

import java.util.List;

public interface ReserveMapper {

    // 예약 정보를 저장
    public void insertSelectKey(ReserveVO reserveVO);

    // 고객별 예약 정보를 불러옴
    public List<ReserveVO> readMemId(String mem_id);

    // 하나의 예약 정보 자세히 보기
    public ReserveVO readReserveNo(Long reserve_no);

    // 예약 정보 수정
    public int update(ReserveVO reserveVO);

    // 예약 정보 삭제
    public int delete(Long reserve_no);

    public List<String> selectStartDate(String camp_no);

    public List<String> selectEndDate(String camp_no);

    public CampVO selectCampPrice(String camp_no);

}
