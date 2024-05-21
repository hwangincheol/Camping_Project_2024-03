package com.camping.domain;

import lombok.Data;

@Data
public class BoardAttachVO {

	private String attach_uuid;
	private String attach_path;
	private String attach_name;
	
	private int board_no;
}
