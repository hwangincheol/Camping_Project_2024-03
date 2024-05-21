package com.camping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReserveVO {
	
	private Long reserve_no;
	private String reserve_startDate;
	private String reserve_endDate;
	private Long reserve_people;	//예약인원
	private Long reserve_price;
	private String camp_no;
	private String mem_id;
	private int rental_choice;

}
