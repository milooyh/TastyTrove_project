package com.app.dto.user;

import java.util.Date;

import lombok.Data;

@Data
public class Visitor {
	String userId;
	String pageUrl;
	Date visitDate;
}
