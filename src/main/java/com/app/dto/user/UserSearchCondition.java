package com.app.dto.user;

import lombok.Data;

@Data
public class UserSearchCondition {
	String memberId;
    String userId;
    String userPassword;
    String userName;
    String userNickname;
    String birthYear;
    String birthMonth;
    String birthDate;
    String tel1;
    String tel2;
    String tel3;
    String addressSystem;
    String myAddress;
    String myEmail;
    String emailSystem;
    String etcEmail;
    String searchKeyword;
}
