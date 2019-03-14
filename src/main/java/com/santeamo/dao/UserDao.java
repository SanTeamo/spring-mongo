package com.santeamo.dao;

import com.santeamo.model.User;

public interface UserDao extends BaseDao{
    public User findUserByUnameandPwd(String username, String password);

    Boolean checkUsername(String username);
}
