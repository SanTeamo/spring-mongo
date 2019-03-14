package com.santeamo.dao.impl;

import com.santeamo.dao.UserDao;
import com.santeamo.model.User;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl extends MongoDBBaseDao implements UserDao {

    @Override
    public User findUserByUnameandPwd(String username, String password) {

        return mongoTemplate.findOne(new Query(Criteria.where("username").is(username).and("password").is(password)),User.class);
    }

    @Override
    public Boolean checkUsername(String username) {

        User user = mongoTemplate.findOne(new Query(Criteria.where("username").is(username)),User.class);

        if(user!=null){
            return true;
        }

        return false;
    }

}
