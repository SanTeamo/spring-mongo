package com.santeamo.service;

import com.santeamo.model.User;

public interface UserService extends BaseService {

	public User findUserByUnameandPwd(String username, String password);

	Boolean checkUsername(String username);

}
