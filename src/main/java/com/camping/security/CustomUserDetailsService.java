package com.camping.security;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.camping.domain.MemberVO;
import com.camping.mapper.MemberMapper;
import com.camping.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CustomUserDetailsService implements UserDetailsService { //추상 메서드 하나만 가지고 있고 리턴 타입은 org.springframework.security.core.userdetails.UserDetails
//사용자 정보와 권한 정보를 가짐
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String mem_id) throws UsernameNotFoundException {
		
		MemberVO vo = memberMapper.read(mem_id); //MemberMapper를 이용해 MemberVO 조회
		
		log.warn("Load User By UserName : " + mem_id);
		log.info("@@@@@@@@@@@"+mem_id);

		log.warn("queried by member mapper: " + vo);
		
		if (vo == null) { //memberMapper가 초기화되지 않을 때 NullPointException 발생 -> 초기화 위해 @AutoWired 사용해야 함 -> 스프링에서 memberMapper를 주입하면서 자동으로 초기화시켜줌
	        throw new InternalAuthenticationServiceException(mem_id); // 사용자를 찾을 수 없는 경우 UsernameNotFoundException을 throw
		}
		
		//Principal(UserDetails) 대신 CustomerUser를 리턴 함
		//즉, loadUserByUsername메서드의 반환되는 타입을 변경하기 위해 Principal(UserDetails)을 커스텀한 것
	    return new CustomUser(vo); // 사용자를 찾은 경우 CustomUser 객체 반환
	}
	
	public boolean deleteMember(String mem_id) {
		return memberMapper.deleteMember(mem_id) == 1;
	}

	public boolean deleteAuth(String mem_id) {
		return memberMapper.deleteAuth(mem_id) == 1;
	}

	public void countFailure(String mem_id) {
		memberMapper.updateFailureCountReset(mem_id);
		
	} 
	
//	public int checkFailureCount(String mem_id) {
//		log.info("로그인 실패 횟수 세기");
//		Integer failureCount = memberMapper.checkFailureCount(mem_id);
//		return failureCount != null? failureCount : 0 ; //null이 아니면 해당 값 반환하고 null이면 0을 반환
//	}
	
	public void disabledUserName(String mem_id) {
		log.info("계정 락");
		memberMapper.updateDisabled(mem_id);
	}
	
	public void resetFailureCnt(String mem_id) {
		log.info("로그인 실패 횟수 초기화");
		memberMapper.updateFailureCountReset(mem_id);
		
	}

//	public int checkId(String mem_id) {
//		int result = memberMapper.checkId(mem_id);
//		return result;
//	}


	
}
