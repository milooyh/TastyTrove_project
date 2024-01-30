package com.app.service.User;

import com.app.dto.user.User;

public interface UserService {
	public User findUserByLoginId(User user);
}
