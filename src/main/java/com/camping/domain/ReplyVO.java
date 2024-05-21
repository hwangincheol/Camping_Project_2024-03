package com.camping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int reply_no;
	private String reply_content;
	private Date reply_date;
	private Date reply_updateDate;
	
	private int board_no;

}
