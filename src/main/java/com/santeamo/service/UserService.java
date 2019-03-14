package com.santeamo.service;

import com.santeamo.model.User;

public interface UserService {

	public void insertUser(User user);

	public User findUserByUnameandPwd(String username, String password);

	Boolean checkUsername(String username);

}
