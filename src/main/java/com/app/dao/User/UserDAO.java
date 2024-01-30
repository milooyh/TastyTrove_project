package com.app.dao.User;

import com.app.dto.user.User;

public interface UserDAO {
	public User findUserByLoginId(User user);
}
