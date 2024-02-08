package com.app.dto.user;

import lombok.Data;

@Data
public class UserPasswordChk {
	int memberId;
	String userId;
	String userPassword;
	String userName;
	String userNickname;
	String userBirthdate;
	String userTel;
	String userAddress;
	String userEmail;
	String userType;
}
