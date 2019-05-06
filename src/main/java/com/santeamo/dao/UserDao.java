package com.santeamo.dao;

import com.santeamo.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.query.Query;

public interface UserDao extends BaseDao{
    public User findUserByUnameandPwd(String username, String password);

    Boolean checkUsername(String username);

    Page<User> getUsersByQuery(Query query, Pageable pageable);
}
