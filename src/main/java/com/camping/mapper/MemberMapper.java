package com.camping.mapper;

import org.apache.ibatis.annotations.Param;

import com.camping.domain.AuthVO;
import com.camping.domain.MemberVO;

public interface MemberMapper {

	//로그인
	public MemberVO read(String mem_id);
	
	public void updateFailureCount(String mem_id);
	
//	public int checkFailureCount(String mem_id);

	public void updateFailureCountReset(String mem_id);
	
	public void updateDisabled(String mem_id);
	
	public int update(MemberVO vo);
	
	public int deleteMember(String mem_id);
	
	public int deleteAuth(String mem_id);
	
	
	//회원가입
	public void insertMember(MemberVO vo);
	
	// 회원의 기본 권한 등록
    void insertAuth(AuthVO auth);
	
	public String selectEncPw(int i);

	public MemberVO findIdByNameAndPhoneNumber(
			@Param("mem_name") String mem_name, @Param("mem_tel") String mem_tel);

	public int checkId(String mem_id);

	public MemberVO checkEmail(@Param("mem_id") String mem_id, @Param("mem_email") String mem_email);

	public MemberVO getTemporaryPasswordInformation(@Param("mem_name") String mem_name, @Param("mem_email") String mem_email, @Param("mem_tel") String mem_tel);

	

}
