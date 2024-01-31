package com.app.dao.admin;

import java.util.List;

import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

public interface AdminDAO {
	
	public List<User> findUserList();
	public List<User> findUserListBySearchCondition(UserSearchCondition userSearchCondition);

}
