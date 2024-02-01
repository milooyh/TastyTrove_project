package com.app.service.admin;

import java.util.List;

import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

public interface AdminService {
	
	public List<User> findUserList();
	public List<User> findUserListBySearchCondition(UserSearchCondition userSearchCondition);
	public User findUserByMemberId(int memberId);
	
	public int saveMember(User user);
	
	public int modifyMember(User user);
	
	public int removeMember(int intMemberId);

}
