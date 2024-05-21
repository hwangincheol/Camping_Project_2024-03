package com.camping.controller;

import com.camping.domain.ReserveVO;
import com.camping.service.MemberService;
import com.camping.service.ReserveService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/reserve/*")
public class ReserveController {

    @Setter(onMethod_ = @Autowired)
    private ReserveService reService;

    @Setter(onMethod_ = @Autowired)
    private MemberService memService;

    @GetMapping("/site_choice")
    public void site_choice(){}

    @GetMapping("/enter_info")
    @PreAuthorize("isAuthenticated()")
    public void enter_info(@RequestParam("site") String site, Principal principal, Model model){
        List<String> startDate = reService.find_sDate(site);
        List<String> endDate =  reService.find_eDate(site);
        String mem_id = principal.getName();
        String mem_name = memService.getMember(mem_id).getMem_name();

        model.addAttribute("mem_name", mem_name);
        model.addAttribute("camp", reService.find_price(site));
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("mem_id", mem_id);
    }

    // 예약 실행
    @PostMapping("/register")
    @PreAuthorize("isAuthenticated()")
    public String register(ReserveVO reserveVO, Principal principal, RedirectAttributes rttr, Model model){

        // reserve 값을 넘김
        reserveVO.setMem_id(principal.getName());
        ReserveVO reserve = reService.register(reserveVO);

        rttr.addFlashAttribute("reserveNo", reserve.getReserve_no());
        model.addAttribute("reserve", reserve);

        return "redirect:/reserve/getMem";
    }

    // 회원의 모든 예약정보
    @GetMapping("/register")
    @PreAuthorize("isAuthenticated()")
    public void registerGet(String mem_id, Model model){ }


    // 회원의 모든 예약정보
    @GetMapping("/getMem")
    @PreAuthorize("isAuthenticated()")
    public String getMem(Principal principal, Model model){
        String mem_id = principal.getName();

        System.out.println(mem_id);
        List<ReserveVO> reserveVO = reService.getMem(mem_id);

        model.addAttribute("reserve", reserveVO);

        return "/reserve/getMem";
    }

    // 예약 1건의 예약정보
    @GetMapping("/getRes")
    @PreAuthorize("isAuthenticated()")
    public void getRes(Long reserve_no, Model model){
        model.addAttribute("reserve", reService.getRes(reserve_no));
    }

    // 예약 수정
    @PostMapping("/modify")
    @PreAuthorize("isAuthenticated()")
    public String modify(ReserveVO reserveVO, RedirectAttributes rttr){
        if (reService.modify(reserveVO)){
            rttr.addFlashAttribute("reserve_no", reserveVO.getReserve_no());
        }

        return "redirect:/reserve/getRes?reserve_no=" + reserveVO.getReserve_no();
    }

    // 수정 페이지로 이동
    @GetMapping("/modify")
    @PreAuthorize("isAuthenticated()")
    public void go_modify(@RequestParam("reserve_no") Long reserve_no, Model model){
        model.addAttribute("reserve", reService.getRes(reserve_no));
    }


    // 예약 취소
    @GetMapping("/remove")
    @PreAuthorize("isAuthenticated()")
    public String remove(Long reserve_no, String mem_id, RedirectAttributes rttr){
        if (reService.remove(reserve_no)){
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:/reserve/getMem?mem_id=" + mem_id;
    }
}
