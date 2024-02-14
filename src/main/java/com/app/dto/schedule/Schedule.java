package com.app.dto.schedule;

import lombok.Data;

@Data
public class Schedule {
	int scheduleId;
	String subject;
	String startDate;
	String endDate;
	String memo;
}
