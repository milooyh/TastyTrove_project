package com.app.service.User;

import com.app.dto.user.User;

public interface UserService {
	public User findUserByLoginId(User user);
	public int saveUser(User user);
	
	public User findUserByUserId(String userId);
	public User findUserByUserPassword(String userPassword);
	public User findUserByUserNickname(String userNickname);
	public User findUserByUserTel(String userTel);
	public User findUserByUserEmail(String userEmail);
}
