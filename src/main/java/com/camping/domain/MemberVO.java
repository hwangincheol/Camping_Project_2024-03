package com.camping.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO implements Serializable {
	private static final long serialVersionUID = 1L; //직렬화
	
	private String mem_id; // DB 아이디
    private String mem_pw; // DB 비밀번호
    private String mem_name; // DB 이름
    private String mem_email; // DB 이메일
    private String mem_tel; // DB 전화번호
    private java.sql.Date mem_date; // DB 가입 날짜
    private boolean mem_enabled; // 계정 활성/비활성 여부
    private int mem_failure_cnt; //로그인 시도 실패 횟수

    private List<AuthVO> authList; // DB 권한 목록

}
