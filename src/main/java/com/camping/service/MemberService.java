package com.camping.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.camping.domain.MemberVO;

@Service
public interface MemberService {
	
	public void registerMember(MemberVO vo);

	public MemberVO getMember(String mem_id);
	
	public boolean updateForm(MemberVO vo);
	
	public boolean deleteMember(String mem_id);

	public MemberVO findIdByNameAndPhoneNumber(@Param("mem_name") String mem_name, @Param("mem_tel") String mem_tel);

	public int checkId(String mem_id);
	
	public MemberVO checkEmail(@Param("mem_id") String mem_id, @Param("mem_email") String mem_email);

	public MemberVO getTemporaryPasswordInformation(@Param("mem_name") String mem_name, @Param("mem_email") String mem_email, @Param("mem_tel") String mem_tel);

}
