package com.camping.service;

import com.camping.domain.CampVO;
import com.camping.domain.ReserveVO;
import com.camping.mapper.ReserveMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ReserveServiceImpl implements ReserveService {

    @Setter(onMethod_ = @Autowired)
    private ReserveMapper reMapper;

    // 새로운 예약
    @Override
    public ReserveVO register(ReserveVO reserveVO) {

        reMapper.insertSelectKey(reserveVO);

        return reserveVO;
    }

    // 예약 목록
    @Override
    public List<ReserveVO> getMem(String mem_id) {
        return reMapper.readMemId(mem_id);
    }

    @Override
    public ReserveVO getRes(Long reserve_no) {
        return reMapper.readReserveNo(reserve_no);
    }

    // 예약 변경
    @Override
    public boolean modify(ReserveVO reserveVO) {
        return reMapper.update(reserveVO) == 1;
    }

    // 예약 취소
    @Override
    public boolean remove(Long reserve_no) {
        return reMapper.delete(reserve_no) == 1;
    }

    @Override
    public List<String> find_sDate(String camp_no) {
        return reMapper.selectStartDate(camp_no);
    }

    @Override
    public List<String> find_eDate(String camp_no) {
        return reMapper.selectEndDate(camp_no);
    }

    @Override
    public CampVO find_price(String camp_no) {
        return reMapper.selectCampPrice(camp_no);
    }

}
