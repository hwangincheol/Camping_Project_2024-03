package com.camping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.domain.AuthVO;
import com.camping.domain.MemberVO;
import com.camping.mapper.MemberMapper;
import com.camping.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class MemberServiceImpl implements MemberService {
	
    @Setter(onMethod_ = @Autowired)
    private MemberMapper memberMapper;

    @Override
    public void registerMember(MemberVO vo) {
        log.info("데이터베이스에 회원 등록");
        log.info("vo: "+vo);
        log.info("vo.getMem_id: "+vo.getMem_id());
        log.info("vo.getMem_name"+vo.getMem_name());
        log.info("vo.getMem_email"+vo.getMem_email());

        // 회원 정보 등록
        memberMapper.insertMember(vo);

        // 기본 권한 생성
        AuthVO defaultAuth = new AuthVO();
        defaultAuth.setMem_id(vo.getMem_id()); // 회원의 mem_id 설정
        defaultAuth.setAuth("ROLE_USER"); // 기본 권한을 "ROLE_USER"로 설정

        // 회원의 기본 권한 등록
        memberMapper.insertAuth(defaultAuth);
        log.info("vo: "+vo);
    }

	@Override
	public MemberVO getMember(String mem_id) {
		log.info("mem_id" + mem_id);
		return memberMapper.read(mem_id);
	}
	
	@Override
	public boolean updateForm(MemberVO vo) {
		
		log.info("회원정보 수정 서비스 계층 실행");
		log.info("vo: " + vo);
		log.info("vo.getMem_pw()" + vo.getMem_pw());
		log.info("vo.getMem_email(): " + vo.getMem_email());
		log.info("vo.getMem_tel(): " + vo.getMem_tel());
		boolean result = memberMapper.update(vo) == 1;
		return result;
	}
	
	@Override
	public boolean deleteMember(String mem_id) {
		log.info("회원정보 삭제 서비스 계층 실행");
		int deleteMember = memberMapper.deleteMember(mem_id);
		int deleteAuth = memberMapper.deleteAuth(mem_id);
		
		if(deleteMember != 1 && deleteAuth != 1) {
			return false;
		}
		return true;
	}

	@Override
	public MemberVO findIdByNameAndPhoneNumber(String mem_name, String mem_tel) {
		log.info("memberMapper.findIdByNameAndPhoneNumber()" + memberMapper.findIdByNameAndPhoneNumber(mem_name, mem_tel));
		return memberMapper.findIdByNameAndPhoneNumber(mem_name, mem_tel);
	}

	@Override
	public int checkId(String mem_id) {
		log.info("아이디 사용 가능 서비스 레이어" +memberMapper.checkId(mem_id));
		int result = memberMapper.checkId(mem_id);
		return result;
	}

	@Override
	public MemberVO checkEmail(String mem_id, String mem_email) {
		log.info("이메일 확인 서비스 레이어" +memberMapper.checkEmail(mem_id, mem_email));
		return memberMapper.checkEmail(mem_id, mem_email);
	}

	@Override
	public MemberVO getTemporaryPasswordInformation(String mem_name, String mem_email, String mem_tel) {
		log.info("memberMapper.getTemporaryPasswordInformation()" + memberMapper.getTemporaryPasswordInformation(mem_name, mem_email, mem_tel));
		return memberMapper.getTemporaryPasswordInformation(mem_name, mem_email, mem_tel);
	}

    
}