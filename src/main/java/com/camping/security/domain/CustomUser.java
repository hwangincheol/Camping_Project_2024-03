package com.camping.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.camping.domain.MemberVO;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@SuppressWarnings("serial")
@Log4j2
@Getter
public class CustomUser extends User { //UserDetails를 상속받은 member 객체를 담고있는 어댑터

	@Setter(onMethod_ = @Autowired)
	private MemberVO member;

	public CustomUser(String mem_id, String mem_pw, Collection<? extends GrantedAuthority> authorities) {
		super(mem_id, mem_pw, authorities);
	} //부모 클래스의 생성자를 호출해야만 정상적인 객체를 생성할 수 있음
	
	public CustomUser(MemberVO vo) {
		
		super(vo.getMem_id(), vo.getMem_pw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));

		this.member = vo;
		
		log.info("아이디 확인" + vo.getMem_id());
	}
}
