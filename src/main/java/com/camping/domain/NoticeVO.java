package com.camping.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int board_no;
	private String board_title;
	private String board_content;
	private Date board_date;
	private Date board_updatedate;
	private int board_hit;
	private String mem_id;
	
	private List<Notice_AttachVO> attachList;
}
