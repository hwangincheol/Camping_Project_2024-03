package com.camping.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import com.camping.domain.MemberVO;
import com.camping.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	@Setter(onMethod_ = @Autowired)
	private CustomUserDetailsService service;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String username = (String) authentication.getPrincipal(); //화면에서 입력한 아이디를 username에 담음
		String password = (String) authentication.getCredentials();//화면에서 입력한 비밀번호를 password에 담음
		
		if((String)authentication.getPrincipal() == null) {
			log.info("아무것도 없음" + authentication.getPrincipal());
		} else {
			log.info("떠라" + (String) authentication.getPrincipal());
		}
		
		CustomUser cu = (CustomUser) service.loadUserByUsername(username);
		log.info("왜 안 떠? 왜 안 떠? 왜 안 떠?"+cu);
		//loadUserByUsername 메서드를 호출할 때 username 변수를 전달하여 사용자 아이디에 해당하는 정보를 가져옴(그래서 mem_id)를 넣으면 ''값이 들어가는 거였음
		//loadUserByUsername 메서드는 전달된 아이디에 해당하는 사용자 정보를 반환
		
		
		if(!matchPassword(password, cu.getMember().getMem_pw())) { //화면에서 입력한 비밀번호와 DB에서 가져온 비밀번호를 비교함
			throw new BadCredentialsException(username); //맞지 않으면 예외를 던짐
		}
		if(!cu.isEnabled() || !cu.isCredentialsNonExpired()) { //계정 활성화 여부 확인 = disabled 상태
			throw new AuthenticationCredentialsNotFoundException(username); //계정 잠금 여부나 활성화 여부 등은 여기서 확인!!!!
		}
		
		//계정이 인정되었으면 UsernamePasswordAuthenticationToken 객체에 화면에서 입력한 정보와 DB에서 가져온 권한 담아 리턴
		return new UsernamePasswordAuthenticationToken(username, password, cu.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		
		//AuthenticationProvider 인터페이스가 지정된 Authentication 객체를 지원하는 경우에 true를 리턴
		return true;
	}

	private boolean matchPassword(String mem_pw, String password) { //비밀번호를 비교
		return mem_pw.equals(password);
	}
}
