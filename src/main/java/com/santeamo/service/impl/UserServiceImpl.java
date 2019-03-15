
package com.santeamo.service.impl;

import javax.annotation.Resource;

import com.santeamo.dao.UserDao;
import org.springframework.stereotype.Service;

import com.santeamo.model.User;
import com.santeamo.service.UserService;

@Service
public class UserServiceImpl extends BaseServiceImpl implements UserService {
	@Resource
	private UserDao dao;

	@Override
	public User findUserByUnameandPwd(String username, String password) {
		return dao.findUserByUnameandPwd(username,password);
	}

	@Override
	public Boolean checkUsername(String username) {
		return dao.checkUsername(username);
	}

}
