package com.camping.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class CampingVO {
	
	private Long board_no;
	private String board_title;
	private String board_content;
	private Date board_date;
	private Date board_updateDate;
	private int board_hit;
	private String mem_id;
	
}
