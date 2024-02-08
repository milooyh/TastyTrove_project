package com.app.dao.User;

import com.app.dto.user.User;

public interface UserDAO {
	public User findUserByLoginId(User user);
	public int saveUser(User user);
	public User findUserByUserId(String userId); //int로 하면 값이 없는 경우 오류발생
	public User findUserByUserPassword(String userPassword);
}
