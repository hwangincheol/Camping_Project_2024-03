package com.camping.domain;

import lombok.Data;

@Data
public class CampVO {
	
	private String camp_no;
	private int camp_price;
	private int camp_peakPrice;
	private String camp_category;
	private String camp_size;
	private int camp_capacity;	//수용인원

}
