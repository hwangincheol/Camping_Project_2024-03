package com.camping.domain;

import lombok.Data;

@Data
public class Notice_AttachVO {
	
	private String attach_name;
	private String attach_path;
	private String attach_uuid;
	private boolean attach_Type;
	
	private int board_no;

}
