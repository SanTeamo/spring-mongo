
package com.santeamo.service.impl;

import javax.annotation.Resource;

import com.santeamo.dao.UserDao;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.santeamo.model.User;
import com.santeamo.service.UserService;

@Service
public class UserServiceImpl extends BaseServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	@Override
	public User findUserByUnameandPwd(String username, String password) {
		return userDao.findUserByUnameandPwd(username,password);
	}

	@Override
	public Boolean checkUsername(String username) {
		return userDao.checkUsername(username);
	}

	@Override
	public Page<User> queryWithPage(User user, Pageable pageable) {
		Query query = new Query();
		return userDao.getUsersByQuery(query,pageable);
	}

}
